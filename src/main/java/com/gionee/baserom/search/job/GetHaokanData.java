package com.gionee.baserom.search.job;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.pojo.AdNews;
import com.gionee.baserom.search.service.IAdNewsService;
import com.gionee.baserom.search.util.HttpUtil;
import com.gionee.baserom.search.util.PropertiesUtils;

public class GetHaokanData {
	private final Logger logger = LoggerFactory.getLogger(GetHaokanData.class);
	
	@Resource
	private IAdNewsService adNewsService;
	
	public void getNewsData(){
		String dataApi = PropertiesUtils.getPropertieByKey("news_from_haokan");
		String newsData = HttpUtil.sendGet(dataApi, "utf-8");
		JSONObject json = JSONObject.parseObject(newsData);
		JSONArray datas = json.getJSONArray("news_data");
		
		//删除旧数据
		adNewsService.deleteByType(1);
		
		int n = 0;
		for(int i=0;i<3;i++){
			JSONObject obj = datas.getJSONObject(i);
			
			AdNews ad = new AdNews();
			ad.setName(obj.getString("name"));
			ad.setLink(obj.getString("link"));
			ad.setImg(obj.getString("thumb_img"));
			AdNews existAd = adNewsService.selectByExample(ad);
			if(existAd == null){
				ad.setEnable(1);
				ad.setCreateTime(new Date());
				ad.setType(1); //0：手动添加的。1：从第三方接口获取的
				n += adNewsService.addAdNews(ad);
			}else{
				logger.info("已经存在好看数据：" + obj.toJSONString());
			}
		}
		logger.info("更新好看数据：" + n + "条。");
		
	}
}
