package com.gionee.baserom.search.job.impl.sougou;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.gionee.baserom.search.common.EHCacheManager;
import com.gionee.baserom.search.dao.HotKeysMapper;
import com.gionee.baserom.search.job.IDataExtract;
import com.gionee.baserom.search.pojo.HotKeys;
import com.gionee.baserom.search.util.HttpUtil;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

@Service("sougouDataExtract")
public class SougouDataExtract implements IDataExtract {
    private final Logger logger = LoggerFactory.getLogger(SougouDataExtract.class);
    
    /**
     * url参数说明
     * pid:必须。由搜狗联盟BD负责申请pid，PM添加白名单，否则可能影响广告展现。
     * num：必须。单次请求返回热词总个数，有效值=[1，N]，暂定N=50。
     * length：可选。单条热词最长字节数，默认16字节。
     * forbid：可选。禁止展现热词行业类别。默认值为0 即无限制，有限制行业则填入行业编码，多个行业以“，”。
     * select：可选。表示勾选行业，与forbid的含义相反，用于屏蔽行业很多时使用，行业编码。注意当参数中有select参数时，forbid参数无效。
     * leadip：可选。用户IP地址。指访问合作伙伴页的真实用户IP，不是合作伙伴抓取程序本身的IP。
     */
    private static String EXCHANGE_RATE_URL = "http://ts.mobile.sogou.com/query?pid=sogou-mobp-eeea8c180c5dff16&num=50&length=15&select=1,2,5,6,10,11,13,20";

    @Resource
    private HotKeysMapper hotKeysMapper;

    @Override
    public void execute() {
        logger.info(this.getClass().getName() + "---->execute");
 
        Cache cache = EHCacheManager.initCacheManager().getCache("sourceUrlCache");
        Element hotkey_source_url = cache.get("cache_hotkey_source_url");
        EXCHANGE_RATE_URL = (String) hotkey_source_url.getValue();
        String httpRateString = HttpUtil.sendGet(EXCHANGE_RATE_URL, "utf-8");
        logger.info("rateResult----->" + httpRateString);
		List<SougouDataResult> result = (List<SougouDataResult>) JSONArray.parseArray(httpRateString, SougouDataResult.class);
        if (result != null) {
            hotKeysMapper.deleteAll();
            int size = result.size();
            Random r = new Random();
            int rnum = r.nextInt(6)+1;
            int b = 6 ; //每隔多少个热词就产生一个hot
            for (int i = 0; i <size; i++) {
            	SougouDataResult dataBean = result.get(i);
            	HotKeys hotKeys = new HotKeys();
            	hotKeys.setHotKey(dataBean.getKwd());
            	hotKeys.setUrl(dataBean.getUrl());
            	hotKeys.setStats((i-rnum)%b == 0?1:0);
            	logger.info("getHotKeys -----> " + dataBean.kwd + "(" + "status=" + hotKeys.getStats() + ")");
            	hotKeysMapper.insert(hotKeys);
            }
        }
    }
    
}