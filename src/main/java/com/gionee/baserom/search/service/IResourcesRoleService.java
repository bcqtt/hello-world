package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;

public interface IResourcesRoleService {
	
	/**
	 * 保存资源角色信息
	 * @param account
	 */
	public DwzAjaxObject saveResourcesRole(String ids,int roleId);

}
