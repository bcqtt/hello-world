package com.gionee.baserom.search.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.service.IResourcesRoleService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("resourcesRole")
public class ResourcesRoleController {
	protected static Logger logger = Logger.getLogger(ResourcesRoleController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IResourcesRoleService resourcesRoleService ;
	
	/**
	 * 保存资源角色信息
	 * @param account
	 */
	@RequestMapping(value = "/saveResourcesRole", method = RequestMethod.POST)
	public void saveResourcesRole(String ids,int roleId,HttpServletResponse response){
		ajaxObj = resourcesRoleService.saveResourcesRole(ids,roleId);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
