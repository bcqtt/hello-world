package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdNews;
import com.gionee.baserom.search.pojo.Page;

public interface IAdNewsService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAdNews(String resKey,String editType,AdNews an);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AdNews> queryPage(Page<AdNews> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdNews selectByExample(AdNews ad);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdNews ad);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdNews(String resKey,String ids);

	public DwzAjaxObject updateAdNews(String resKey,AdNews ad);

	/**
	 * 查找正显示的广告位
	 * @return
	 */
	public List<AdNews> queryAdNewsOfShow();


}
