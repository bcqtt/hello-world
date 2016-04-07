package com.gionee.baserom.search.service;

import java.util.List;
import java.util.Map;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.common.ResourcesExt;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;

public interface IResourcesService {
	
	/**
	 * 保存角色信息
	 * @param editType 
	 * @param account
	 */
	public DwzAjaxObject saveResources(String resKey,String editType, Resources res);

	/**
	 * 分页查询角色信息
	 * @param page
	 * @param resId 
	 * @return
	 */
	public Page<Resources> queryPage(Page<Resources> page, String pIdList);

	/**
	 * 根据Example查询Resources
	 * @param role
	 * @return
	 */
	public Resources selectByExample(Resources res);

	/**
	 * 根据id删除account(包含多行删除)
	 */
	public DwzAjaxObject deleteResources(String resKey,String ids);

	/**
	 * 根据登陆账号的id查询相关可访问资源
	 * @param accountId
	 * @param roleId 
	 * @return
	 */
	public List<Resources> queryResourcesByAccountId(String accountId);

	/**
	 * 根据id查询Resource
	 * @param parentId
	 * @return
	 */
	public Resources selectById(Integer parentId);

	/**
	 * 查询资源
	 * @param string
	 * @param id
	 * @return
	 */
	public List<ResourcesExt> queryResources(String accountId, int id);

	/**
	 * 根据账号id查询该账号下的可访问资源
	 * @param id
	 * @return
	 */
	public String queryAccountMenu(Integer id);

	/**
	 * 根据账号id查询该账号下对应该菜单的按钮
	 * @param id
	 * @return
	 */
	public List<Resources> queryAccountOpt(int accId,int resId);

}
