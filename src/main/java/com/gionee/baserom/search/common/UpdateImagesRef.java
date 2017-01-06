package com.gionee.baserom.search.common;

import com.gionee.baserom.search.dao.AdControlMapper;
import com.gionee.baserom.search.dao.AdNewsMapper;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.dao.SiteNavigationMapper;
import com.gionee.baserom.search.pojo.AdControl;
import com.gionee.baserom.search.pojo.AdNews;
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
			SiteNavigation news = siteNavigationMapper.selectByPrimaryKey(an.getId());
			String oldFileName = news.getIconUrl().substring(news.getIconUrl().lastIndexOf("/")+1);
			imagesMapper.updateRef(0,oldFileName);
		}
		imagesMapper.updateRef(1,fileName);
	}
	
	/**
	 * 【网址导航】新增修改时更新图片引用状态
	 * @param an 需要被删除的网址导航id
	 * @param siteNavigationMapper
	 * @param imagesMapper
	 */
	public static void updateImgRefWhenDel(int anId,
			SiteNavigationMapper siteNavigationMapper,ImagesMapper imagesMapper){
		SiteNavigation an = siteNavigationMapper.selectByPrimaryKey(anId);
		String fileName = an.getIconUrl().substring(an.getIconUrl().lastIndexOf("/")+1);
		imagesMapper.updateRef(0,fileName);
	}
	
	/**
	 * 【旧版新闻】新增修改时更新图片引用状态
	 * @param editType
	 * @param an
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
	 * 【旧版新闻】新增修改时更新图片引用状态
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
	 * 【新闻广告】新增修改时更新图片引用状态
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
