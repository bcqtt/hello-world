package com.gionee.baserom.search.service;

import java.util.List;

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
	 * @param usertype 
	 * @return
	 */
	public Page<Rosters> queryPage(Page<Rosters> page, String usertype);
	
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

	/**
	 * 根据用户类型和版本号查询Rosters
	 * @param u
	 * @param v
	 * @return
	 */
	public List<Rosters> getRosters(String u, int v);

}
