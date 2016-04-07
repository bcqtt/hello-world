package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Config;
import com.gionee.baserom.search.pojo.Page;

public interface IConfigService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveConfig(String resKey,String editType,Config c);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<Config> queryPage(Page<Config> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public Config selectByExample(Config c);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(Config c);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteConfigs(String resKey,String ids);

}
