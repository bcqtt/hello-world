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
import com.gionee.baserom.search.pojo.AdClassify;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdClassifyService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("adCls")
public class AdClassifyController {
	protected static Logger logger = Logger.getLogger(AdClassifyController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdClassifyService adClsService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdClsPaper")
	public ModelAndView queryAdClsPaper(Page<AdClassify> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = adClsService.queryPage(page);
		
		model.addObject(page);

		model.setViewName("WEB-INF/jsp/ad/adClassifyList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdClsView", method = RequestMethod.GET)
	public ModelAndView addAdClsView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adClassifyEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdClsView", method = RequestMethod.GET)
	public ModelAndView editAdClsView(String resKey,String editType,AdClassify adc) {
		AdClassify c = adClsService.selectByExample(adc);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("adc",c);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adClassifyEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAdCls", method = RequestMethod.POST)
	public void saveAdCls(String resKey,String editType,AdClassify adc,HttpServletResponse response){
		ajaxObj = adClsService.saveAdCls(resKey,editType,adc);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdCls")
	public void deleteAdCls(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adClsService.deleteAdCls(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
