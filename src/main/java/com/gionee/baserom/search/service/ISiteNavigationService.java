package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SiteNavigation;

public interface ISiteNavigationService {
	
	/**
	 * 保存分组信息
	 * @param site
	 * @param editType
	 */
	public DwzAjaxObject saveSite(String resKey,String editType,SiteNavigation site);

	/**
	 * 分页查询账号信息
	 * @param site 
	 * @param dataStatus 
	 * @param page
	 * @return
	 */
	public Page<SiteNavigation> queryPage(Page<SiteNavigation> page, SiteNavigation site, String dataStatus);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public SiteNavigation selectByExample(SiteNavigation site);

	/**
	 * 根据id修改
	 * @param site
	 * @return
	 */
	public int updateById(SiteNavigation site);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteSites(String resKey,String ids);

	public DwzAjaxObject updateSite(String resKey,SiteNavigation site);

}
