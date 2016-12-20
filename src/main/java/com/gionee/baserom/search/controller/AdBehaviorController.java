package com.gionee.baserom.search.controller;

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
import com.gionee.baserom.search.pojo.AdBehavior;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdBehaviorService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("adBehavior")
public class AdBehaviorController {
	protected static Logger logger = Logger.getLogger(AdBehaviorController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdBehaviorService adBehaviorService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdBehaviorPaper")
	public ModelAndView queryAdBehaviorPaper(Page<AdBehavior> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = adBehaviorService.queryPage(page);
		
		model.addObject(page);

		model.setViewName("WEB-INF/jsp/ad/adBehaviorList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdBehaviorView", method = RequestMethod.GET)
	public ModelAndView addAdBehaviorView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adBehaviorEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdBehaviorView", method = RequestMethod.GET)
	public ModelAndView editAdBehaviorView(String resKey,String editType,AdBehavior ab) {
		AdBehavior c = adBehaviorService.selectByExample(ab);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("ab",c);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adBehaviorEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAdBehavior", method = RequestMethod.POST)
	public void saveAdBehavior(String resKey,String editType,AdBehavior ab,HttpServletResponse response){
		ajaxObj = adBehaviorService.saveAdBehavior(resKey,editType,ab);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdBehavior")
	public void deleteAdBehavior(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adBehaviorService.deleteAdBehavior(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
