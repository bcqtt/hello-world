package com.gionee.baserom.search.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.common.ResourcesExt;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.pojo.Role;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.IRoleService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("role")
public class RoleController {
	protected static Logger logger = Logger.getLogger(RoleController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IRoleService roleService;
	
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryRolePaper", method = RequestMethod.GET)
	public ModelAndView queryRolePaper(Page<Role> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = roleService.queryPage(page);
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("redirect");
			return model;
		}
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		model.addObject(page);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/authority/roleList");
		logger.info("--------->查看角色列表。");
		return model;
	}
	
	/**
	 * 打开新增账号页面
	 * @return
	 */
	@RequestMapping(value = "/addRoleView", method = RequestMethod.GET)
	public ModelAndView addRoleView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/authority/roleEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editRoleView", method = RequestMethod.GET)
	public ModelAndView editRoleView(String resKey,String editType,Role role) {
		Role r = roleService.selectByExample(role);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("role",r);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/authority/roleEdit");
		return model;
	}
	
	/**
	 * 保存账号信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveRole", method = RequestMethod.POST)
	public void saveRole(String resKey,String editType,Role role,HttpServletResponse response){
		ajaxObj = roleService.saveRole(resKey,editType,role);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除role(包含多行删除)
	 */
	@RequestMapping(value = "/deleteRoles")
	public void deleteRoles(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.roleService.deleteRoles(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 打开权限分配窗口
	 * @return
	 */
	@RequestMapping(value = "/assignAuthority")
	public ModelAndView assignAuthority(int id){
		List<ResourcesExt> resList = this.resourcesService.queryResources("",id);
		String jsonArray = JSONArray.toJSONString(resList);
		ModelAndView model = new ModelAndView();
		model.addObject("resList", jsonArray);
		model.addObject("roleId", id);
		model.setViewName("WEB-INF/jsp/authority/roleAssigAuthority");
		return model;
	}

}
