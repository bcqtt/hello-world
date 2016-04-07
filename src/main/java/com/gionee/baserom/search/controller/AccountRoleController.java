package com.gionee.baserom.search.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AccountRoleKey;
import com.gionee.baserom.search.service.IAccountRoleService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("accountRole")
public class AccountRoleController {
protected static Logger logger = Logger.getLogger(AccountRoleController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAccountRoleService accountRoleService;
	
	/**
	 * 保存账号角色信息
	 * @param account
	 */
	@RequestMapping(value = "/saveAccountRole", method = RequestMethod.POST)
	public void saveAccount(AccountRoleKey ar,HttpServletResponse response){
		ajaxObj = accountRoleService.saveAccountRole(ar);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
