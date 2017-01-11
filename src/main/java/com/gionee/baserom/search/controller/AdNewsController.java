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
import com.gionee.baserom.search.pojo.AdNews;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IAdNewsService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("adNews")
public class AdNewsController {
	protected static Logger logger = Logger.getLogger(AdNewsController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdNewsService adNewsService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdNewsPaper", method = RequestMethod.GET)
	public ModelAndView queryAdNewsPaper(Page<AdNews> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = adNewsService.queryPage(page);
		
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
		model.setViewName("WEB-INF/jsp/ad/adNewsList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdNewsView", method = RequestMethod.GET)
	public ModelAndView addAdNewsView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adNewsEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdNewsView", method = RequestMethod.GET)
	public ModelAndView editAdNewsView(String resKey,String editType,AdNews an) {
		AdNews a = adNewsService.selectByExample(an);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("an",a);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adNewsEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAdNews", method = RequestMethod.POST)
	public void saveAdNews(String resKey,String editType,AdNews an,HttpServletResponse response){
		ajaxObj = adNewsService.saveAdNews(resKey,editType,an);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateAdNews", method = RequestMethod.POST)
	public void updateAdNews(String resKey,AdNews an,HttpServletResponse response){
		ajaxObj = adNewsService.updateAdNews(resKey,an);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdNews", method = RequestMethod.POST)
	public void deleteAdNews(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adNewsService.deleteAdNews(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
