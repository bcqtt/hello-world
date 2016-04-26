package com.gionee.baserom.search.job.impl.haosou;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.gionee.baserom.search.dao.HotKeysMapper;
import com.gionee.baserom.search.job.IDataExtract;
import com.gionee.baserom.search.pojo.HotKeys;
import com.gionee.baserom.search.util.HttpUtil;

@Service("haosouDataExtract")
public class HaosouDataExtract implements IDataExtract {
    private final Logger logger = LoggerFactory.getLogger(HaosouDataExtract.class);
    private static final String EXCHANGE_RATE_URL = "http://m.haosou.com/mhtml/app_index/app_news.json";

    @Resource
    private HotKeysMapper hotKeysMapper;

    @Override
    public void execute() {
        // TODO Auto-generated method stub
        logger.info(this.getClass().getName() + "---->execute");
 
        String httpRateString = HttpUtil.sendGet(EXCHANGE_RATE_URL, "utf-8");
        logger.info("rateResult----->" + httpRateString);
        DataResult result = JSON.parseObject(httpRateString, DataResult.class);
        if (result != null) {
            List<DataBean> listData = result.getData();
            if (listData != null) {
            	hotKeysMapper.deleteAll();
                for (int i = 0; i < listData.size(); i++) {
                    DataBean dataBean = listData.get(i);
                    HotKeys hotKeys = new HotKeys();
                    hotKeys.setHotKey(dataBean.search_word);
                    hotKeys.setSortId(i);
                    hotKeys.setStats(dataBean.stats.equals("new")?1:0);
                    logger.info("getHotKeys -----> " + dataBean.search_word);
                    hotKeysMapper.insert(hotKeys);
                }
            }
        }
    }
}
