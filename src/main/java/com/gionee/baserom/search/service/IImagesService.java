package com.gionee.baserom.search.service;

import org.springframework.web.multipart.MultipartFile;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Images;
import com.gionee.baserom.search.pojo.Page;

public interface IImagesService {
	
	/**
	 * 保存图片信息
	 * @param images
	 * @param editType
	 * @param type 
	 */
	public DwzAjaxObject saveImages(String resKey,String editType,MultipartFile[] images, int type);
	
	public DwzAjaxObject saveImagesInfo(String resKey, String editType, Images images);

	/**
	 * 分页查询信息
	 * @param page
	 * @param type 
	 * @return
	 */
	public Page<Images> queryPage(Page<Images> page, int type);
	
	/**
	 * 根据Example查询
	 * @param img
	 * @return
	 */
	public Images selectByExample(Images img);

	/**
	 * 根据id修改
	 * @param img
	 * @return
	 */
	public int updateById(Images img);

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteImages(String resKey,String ids);

}
