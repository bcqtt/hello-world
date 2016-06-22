package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Role;

public interface IRoleService {
	
	/**
	 * 保存角色信息
	 * @param editType 
	 * @param account
	 */
	public DwzAjaxObject saveRole(String resKey,String editType, Role role);

	/**
	 * 分页查询角色信息
	 * @param page
	 * @return
	 */
	public Page<Role> queryPage(Page<Role> page);

	/**
	 * 根据id删除account(包含多行删除)
	 */
	public DwzAjaxObject deleteRoles(String resKey,String ids);
	
	/**
	 * 根据Example查询Role
	 * @param role
	 * @return
	 */
	public Role selectByExample(Role role);

	/**
	 * 查询全部角色
	 * @param groupId 
	 * @return
	 */
	public List<Role> findAll(Integer groupId);

}
