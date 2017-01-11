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
import com.gionee.baserom.search.pojo.LifeService;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.ILifeServiceService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("life")
public class LifeServiceController {
	protected static Logger logger = Logger.getLogger(LifeServiceController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ILifeServiceService lifeService;
	
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryLifeServicePaper", method = RequestMethod.GET)
	public ModelAndView queryLifeServicePaper(Page<LifeService> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = lifeService.queryPage(page);
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
		model.setViewName("WEB-INF/jsp/lifeservice/lifeList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addLifeServiceView", method = RequestMethod.GET)
	public ModelAndView addLifeServiceView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/lifeservice/lifeEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editLifeServiceView", method = RequestMethod.GET)
	public ModelAndView editLifeServiceView(String resKey,String editType,LifeService life) {
		LifeService ls = lifeService.selectByExample(life);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("life",ls);
		model.setViewName("WEB-INF/jsp/lifeservice/lifeEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveLifeService", method = RequestMethod.POST)
	public void saveLifeService(String resKey,String editType,LifeService life,HttpServletResponse response){
		ajaxObj = lifeService.saveLife(resKey,editType,life);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateLifeService", method = RequestMethod.POST)
	public void updateLifeService(String resKey,LifeService life,HttpServletResponse response){
		ajaxObj = lifeService.updateLifeService(resKey,life);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteLifeServices", method = RequestMethod.POST)
	public void deleteLifeServices(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.lifeService.deleteLifeServices(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
