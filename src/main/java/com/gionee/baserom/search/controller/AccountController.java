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

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.pojo.Role;
import com.gionee.baserom.search.service.IAccountService;
import com.gionee.baserom.search.service.IGroupService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.IRoleService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("account")
public class AccountController {
	protected static Logger logger = Logger.getLogger(AccountController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAccountService accountService;
	
	@Resource
	private IGroupService groupService;
	
	@Resource
	private IRoleService roleService;
	
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAccountPaper", method = RequestMethod.GET)
	public ModelAndView queryAccountPaper(Page<Account> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = accountService.queryPage(page);
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("login");
			return model;
		}
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		model.addObject(page);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/account/accountList");
		logger.info("--------->查看账号列表。");
		return model;
	}
	
	@RequestMapping(value = "/openConfigView")
	public ModelAndView openConfigView(){
		ModelAndView model = new ModelAndView();
		model.setViewName("WEB-INF/jsp/account/setting");
		return model;
	}
	
	/**
	 * 打开新增账号页面
	 * @return
	 */
	@RequestMapping(value = "/addAccountView", method = RequestMethod.GET)
	public ModelAndView addAccountView(String resKey,String editType,HttpServletRequest request) {
		//List<GroupInfo> groupList = groupService.findAll();
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		List<Role> roleList = roleService.findAll(acc.getGroupId());
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("roleList",roleList);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/account/accountEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAccountView", method = RequestMethod.GET)
	public ModelAndView editAccountView(String resKey,String editType,Account account,HttpServletRequest request) {
		Account acc = accountService.selectByExample(account);
		//List<GroupInfo> groupList = groupService.findAll();
		Account login_acc = (Account) request.getSession().getAttribute("accountSession");
		List<Role> roleList = roleService.findAll(login_acc.getGroupId());
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("roleList",roleList);
		model.addObject("account",acc);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/account/accountEdit");
		return model;
	}
	
	/**
	 * 保存账号信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAccount", method = RequestMethod.POST)
	public void saveAccount(String resKey,String editType,Account account,HttpServletResponse response){
		ajaxObj = accountService.saveAccount(resKey,editType,account);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除account(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAccounts")
	public void deleteAccounts(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.accountService.deleteAccounts(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/assignRole")
	public ModelAndView assignRole(String id,HttpServletRequest request){
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		List<Role> roleList = this.roleService.findAll(acc.getGroupId());
		ModelAndView model = new ModelAndView();
		model.addObject("roleList", roleList);
		model.addObject("accountId", id);
		model.setViewName("WEB-INF/jsp/account/accountAssigRoles");
		return model;
	}
	
	@RequestMapping(value = "/updatePassword")
	public void updatePassword(HttpServletRequest request,HttpServletResponse response){
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		String pw = request.getParameter("newPassword");
		acc.setPassword(StringHelper.md5(pw));
		ajaxObj = this.accountService.updatePassword(acc);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}

}
