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
import com.gionee.baserom.search.pojo.Version;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.IVersionService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("version")
public class VersionController {
	protected static Logger logger = Logger.getLogger(VersionController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IVersionService versionService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示软件包信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryVersionPaper", method = RequestMethod.GET)
	public ModelAndView queryVersionPaper(Page<Version> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = versionService.queryPage(page);
		
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
		model.setViewName("WEB-INF/jsp/rosters/versionList");
		logger.info("--------->查看版本信息列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addVersionView", method = RequestMethod.GET)
	public ModelAndView addVersionView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/rosters/versionEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editVersionView", method = RequestMethod.GET)
	public ModelAndView editVersionView(String resKey,String editType,Version version) {
		Version v = versionService.selectByExample(version);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("version",v);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/rosters/versionEdit");
		return model;
	}
	
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveVersion", method = RequestMethod.POST)
	public void saveVersion(String resKey,String editType,Version version,HttpServletResponse response){
		ajaxObj = versionService.saveVersion(resKey,editType,version);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateVersion", method = RequestMethod.POST)
	public void updateVersion(String resKey,Version version,HttpServletResponse response){
		ajaxObj = versionService.updateVersion(resKey,version);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除(包含多行删除)
	 */
	@RequestMapping(value = "/deleteVersion", method = RequestMethod.POST)
	public void deleteVersion(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.versionService.deleteVersion(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
