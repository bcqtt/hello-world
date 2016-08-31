package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Version;

public interface IVersionService {

	/**
	 * 保存信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveVersion(String resKey,String editType,Version v);

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<Version> queryPage(Page<Version> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public Version selectByExample(Version v);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(Version v);

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteVersion(String resKey,String ids);

	public DwzAjaxObject updateVersion(String resKey,Version v);

}
