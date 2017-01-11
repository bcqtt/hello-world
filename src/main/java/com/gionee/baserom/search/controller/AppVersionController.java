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
import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IAppVersionService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("appVersion")
public class AppVersionController {
	protected static Logger logger = Logger.getLogger(AppVersionController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAppVersionService appVersionService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAppVersionPaper", method = RequestMethod.GET)
	public ModelAndView queryCardPaper(Page<AppVersion> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = appVersionService.queryPage(page);
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
		model.setViewName("WEB-INF/jsp/app/appVersionList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAppVersionView", method = RequestMethod.GET)
	public ModelAndView addAppVersionView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/appVersionEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAppVersionView", method = RequestMethod.GET)
	public ModelAndView editAppVersionView(String resKey,String editType,AppVersion version) {
		AppVersion v = appVersionService.selectByExample(version);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("version",v);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/appVersionEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAppVersion", method = RequestMethod.POST)
	public void saveAppVersion(String resKey,String editType,AppVersion version,HttpServletResponse response){
		ajaxObj = appVersionService.saveAppVersion(resKey,editType,version);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}

	
	/**
	 * 根据id删除
	 */
	@RequestMapping(value = "/deleteAppVersion")
	public void deleteAppVersion(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.appVersionService.deleteAppVersion(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
