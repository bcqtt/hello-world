package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdControl;
import com.gionee.baserom.search.pojo.Page;

public interface IAdService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAd(String resKey,String editType,AdControl group);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AdControl> queryPage(Page<AdControl> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdControl selectByExample(AdControl ad);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdControl ad);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAds(String resKey,String ids);

	public DwzAjaxObject updateAd(String resKey,AdControl ad);


}
