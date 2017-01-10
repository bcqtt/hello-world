package com.gionee.baserom.search.common;

import com.gionee.baserom.search.dao.AdControlMapper;
import com.gionee.baserom.search.dao.AdNewsMapper;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.dao.LifeServiceMapper;
import com.gionee.baserom.search.dao.SiteNavigationMapper;
import com.gionee.baserom.search.pojo.AdControl;
import com.gionee.baserom.search.pojo.AdNews;
import com.gionee.baserom.search.pojo.LifeService;
import com.gionee.baserom.search.pojo.SiteNavigation;
/**
 * 更新图片引用状态
 */
public class UpdateImagesRef {
	
	
	/**
	 * 【网址导航】新增修改时更新图片引用状态
	 */
	public static void updateImgRef(String editType,SiteNavigation an,
			SiteNavigationMapper siteNavigationMapper,ImagesMapper imagesMapper){
		String imgPath = an.getIconUrl();
		String fileName = imgPath.substring(imgPath.lastIndexOf("/")+1);
		if(editType.equals("update")){
			SiteNavigation obj = siteNavigationMapper.selectByPrimaryKey(an.getId());
			String oldFileName = obj.getIconUrl().substring(obj.getIconUrl().lastIndexOf("/")+1);
			imagesMapper.updateRef(0,oldFileName);
		}
		imagesMapper.updateRef(1,fileName);
	}
	
	/**
	 * 【网址导航】删除时更新图片引用状态
	 * @param an 需要被删除的网址导航id
	 * @param siteNavigationMapper
	 * @param imagesMapper
	 */
	public static void updateImgRefWhenDel(int anId,
			SiteNavigationMapper siteNavigationMapper,ImagesMapper imagesMapper){
		SiteNavigation obj = siteNavigationMapper.selectByPrimaryKey(anId);
		String fileName = obj.getIconUrl().substring(obj.getIconUrl().lastIndexOf("/")+1);
		imagesMapper.updateRef(0,fileName);
	}
	/**
	 * 【生活服务】新增修改时更新图片引用状态
	 * @param lifeServiceMapper
	 * @param imagesMapper
	 * 
	 */
	public static void updateImgRef(String editType,LifeService life,
			LifeServiceMapper lifeServiceMapper,ImagesMapper imagesMapper){
		String imgPath = life.getIconUrl();
		String fileName = imgPath.substring(imgPath.lastIndexOf("/")+1);
		if(editType.equals("update")){
			LifeService obj = lifeServiceMapper.selectByPrimaryKey(life.getId());
			String oldFileName = obj.getIconUrl().substring(obj.getIconUrl().lastIndexOf("/")+1);
			imagesMapper.updateRef(0,oldFileName);
		}
		imagesMapper.updateRef(1,fileName);
	}
	
	/**
	 * 【生活服务】删除时更新图片引用状态
	 * @param an 需要被删除的对象id
	 * @param lifeServiceMapper
	 * @param imagesMapper
	 */
	public static void updateImgRefWhenDel(int id,
			LifeServiceMapper lifeServiceMapper,ImagesMapper imagesMapper){
		LifeService obj = lifeServiceMapper.selectByPrimaryKey(id);
		String fileName = obj.getIconUrl().substring(obj.getIconUrl().lastIndexOf("/")+1);
		imagesMapper.updateRef(0,fileName);
	}
	
	/**
	 * 【旧版新闻】新增修改时更新图片引用状态
	 * @param editType
	 * @param ad
	 */
	public static void updateImgRef(String editType,AdControl ad,
			AdControlMapper adMapper,ImagesMapper imagesMapper){
		String imgPath = ad.getAdImg();
		String fileName = imgPath.substring(imgPath.lastIndexOf("/")+1);
		if(editType.equals("update")){
			AdControl news = adMapper.selectByPrimaryKey(ad.getId());
			String oldFileName = news.getAdImg().substring(news.getAdImg().lastIndexOf("/")+1);
			imagesMapper.updateRef(0,oldFileName);
		}
		imagesMapper.updateRef(1,fileName);
	}
	
	/**
	 * 【旧版新闻】删除时更新图片引用状态
	 * @param id 需要被删除的旧版广告id
	 * @param adMapper
	 * @param imagesMapper
	 */
	public static void updateImgRefWhenDel(int id,
			AdControlMapper adMapper,ImagesMapper imagesMapper){
		AdControl obj = adMapper.selectByPrimaryKey(id);
		String fileName = obj.getAdImg().substring(obj.getAdImg().lastIndexOf("/")+1);
		imagesMapper.updateRef(0,fileName);
	}
	
	/**
	 * 【新闻广告】新增修改时更新图片引用状态
	 * @param editType
	 * @param an
	 */
	public static void updateImgRef(String editType,AdNews an,
			AdNewsMapper adNewsMapper,ImagesMapper imagesMapper){
		String imgPath = an.getImg();
		String fileName = imgPath.substring(imgPath.lastIndexOf("/")+1);
		if(editType.equals("update")){
			AdNews news = adNewsMapper.selectByPrimaryKey(an.getId());
			String oldFileName = news.getImg().substring(news.getImg().lastIndexOf("/")+1);
			imagesMapper.updateRef(0,oldFileName);
		}
		imagesMapper.updateRef(1,fileName);
	}
	
	/**
	 * 【新闻广告】删除时更新图片引用状态
	 * @param id 需要被删除的新闻广告id
	 * @param adNewsMapper
	 * @param imagesMapper
	 */
	public static void updateImgRefWhenDel(int id,
			AdNewsMapper adNewsMapper,ImagesMapper imagesMapper){
		AdNews obj = adNewsMapper.selectByPrimaryKey(id);
		String fileName = obj.getImg().substring(obj.getImg().lastIndexOf("/")+1);
		imagesMapper.updateRef(0,fileName);
	}

}
