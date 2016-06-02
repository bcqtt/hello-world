package com.gionee.baserom.search.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AccountRoleMapper;
import com.gionee.baserom.search.pojo.AccountRoleExample;
import com.gionee.baserom.search.pojo.AccountRoleExample.Criteria;
import com.gionee.baserom.search.pojo.AccountRoleKey;
import com.gionee.baserom.search.service.IAccountRoleService;

@Service("accountRoleService")
public class AccountRoleServiceImpl implements IAccountRoleService {
	private final Logger logger = LoggerFactory.getLogger(AccountRoleServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AccountRoleMapper accountRoleMapper;

	/**
	 * 保存accountRole
	 */
	public DwzAjaxObject saveAccountRole(AccountRoleKey ar) {
		//删除该账号下已有的角色
		AccountRoleExample example = new AccountRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountIdEqualTo(ar.getAccountId());
		accountRoleMapper.deleteByExample(example);
		//保存新配置的角色
		int n = accountRoleMapper.insert(ar);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	

}
