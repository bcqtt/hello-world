package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Rosters;

public interface IRostersService {

	/**
	 * 保存信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveRosters(String resKey,String editType,Rosters r);

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<Rosters> queryPage(Page<Rosters> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public Rosters selectByExample(Rosters r);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(Rosters r);

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteRosters(String resKey,String ids);

	public DwzAjaxObject updateRosters(String resKey,Rosters r);

}
