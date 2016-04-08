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
import com.gionee.baserom.search.pojo.SiteNavigation;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.ISiteNavigationService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("site")
public class SiteNavigationController {
	protected static Logger logger = Logger.getLogger(SiteNavigationController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ISiteNavigationService siteNavigationService;
	
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示网址信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/querySitePaper", method = RequestMethod.GET)
	public ModelAndView querySitePaper(Page<SiteNavigation> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = siteNavigationService.queryPage(page,type);
		
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
		model.addObject("type",type);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/site/siteList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addSiteView", method = RequestMethod.GET)
	public ModelAndView addSiteView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/site/siteEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editSiteView", method = RequestMethod.GET)
	public ModelAndView editSiteView(String resKey,String editType,SiteNavigation site) {
		SiteNavigation s = siteNavigationService.selectByExample(site);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("site",s);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/site/siteEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveSite", method = RequestMethod.POST)
	public void saveSite(String resKey,String editType,SiteNavigation site,HttpServletResponse response){
		ajaxObj = siteNavigationService.saveSite(resKey,editType,site);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateSite", method = RequestMethod.POST)
	public void updateSite(String resKey,SiteNavigation site,HttpServletResponse response){
		ajaxObj = siteNavigationService.updateSite(resKey,site);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteSites", method = RequestMethod.POST)
	public void deleteSites(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.siteNavigationService.deleteSites(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
