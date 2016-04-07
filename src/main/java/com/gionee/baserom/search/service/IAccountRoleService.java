package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AccountRoleKey;

public interface IAccountRoleService {
	
	/**
	 * 保存账号角色信息
	 * @param account
	 */
	public DwzAjaxObject saveAccountRole(AccountRoleKey ar);

}
