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
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("resources")
public class ResourcesController {
	protected static Logger logger = Logger.getLogger(ResourcesController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryResourcesPaper")
	public ModelAndView queryResourcesPaper(Page<Resources> page,HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		String pIdList = request.getParameter("pIdList");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = resourcesService.queryPage(page,pIdList);
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		ModelAndView model = new ModelAndView();
		model.addObject(page);
		model.addObject("pIdList",pIdList);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("menuKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/authority/menuList");
		logger.info("--------->查看资源(菜单)列表。");
		return model;
	}
	
	/**
	 * 打开新增账号页面
	 * @return
	 */
	@RequestMapping(value = "/addResourcesView", method = RequestMethod.GET)
	public ModelAndView addResourcesView(String menuKey,String editType,HttpServletRequest request) {
		String resId = request.getParameter("resId");
		String resName = request.getParameter("resName");
		String pIdList = request.getParameter("pIdList");
		List<Resources> resList = this.resourcesService.queryResourcesByAccountId("");
		String jsonArray = JSONArray.toJSONString(resList);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resList", jsonArray);
		model.addObject("resId", resId);
		model.addObject("resName", resName);
		model.addObject("pIdList", pIdList);
		model.addObject("menuKey", menuKey);
		model.setViewName("WEB-INF/jsp/authority/menuEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editResourcesView", method = RequestMethod.GET)
	public ModelAndView editResourcesView(String menuKey,String editType,Resources res) {
		Resources r = resourcesService.selectByExample(res);
		Resources pR = resourcesService.selectById(r.getParentId());
		List<Resources> resList = this.resourcesService.queryResourcesByAccountId("");
		String jsonArray = JSONArray.toJSONString(resList);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("res",r);
		model.addObject("pRes",pR);
		model.addObject("resList", jsonArray);
		model.addObject("menuKey", menuKey);
		model.setViewName("WEB-INF/jsp/authority/menuEdit");
		return model;
	}
	
	/**
	 * 保存账号信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveResources", method = RequestMethod.POST)
	public void saveResources(String menuKey,String editType,Resources resources,HttpServletResponse response){
		ajaxObj = resourcesService.saveResources(menuKey,editType,resources);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除role(包含多行删除)
	 */
	@RequestMapping(value = "/deleteResources", method = RequestMethod.POST)
	public void deleteResources(String menuKey,String ids,HttpServletRequest request,HttpServletResponse response){
		if(ids.equals("")){
			ids = request.getParameter("id");
		}
		ajaxObj = this.resourcesService.deleteResources(menuKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除role(包含多行删除)
	 */
	@RequestMapping(value = "/menuTree", method = RequestMethod.POST)
	public void menuTree(String accountId,HttpServletResponse response){
		List<Resources> resList = this.resourcesService.queryResourcesByAccountId(accountId);
		String jsonArray = JSONArray.toJSONString(resList);
		StringHelper.outputJsonString(jsonArray, response);
	}

}
