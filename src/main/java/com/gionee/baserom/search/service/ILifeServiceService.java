package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.LifeService;
import com.gionee.baserom.search.pojo.Page;

public interface ILifeServiceService {
	
	/**
	 * 保存分组信息
	 * @param resKey
	 * @param editType
	 * @param life 
	 */
	public DwzAjaxObject saveLife(String resKey,String editType, LifeService life);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<LifeService> queryPage(Page<LifeService> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public LifeService selectByExample(LifeService card);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(LifeService card);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteLifeServices(String resKey,String ids);

	/**
	 * 根据id修改showEnable
	 * @param id
	 * @param showEnable
	 * @return
	 */
	public DwzAjaxObject updateLifeService(String resKey,LifeService life);

}
