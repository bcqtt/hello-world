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
import com.gionee.baserom.search.pojo.AdDisplayRule;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.service.IAdDisplayRuleService;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("adRule")
public class AdDisplayRuleController {
	protected static Logger logger = Logger.getLogger(AdDisplayRuleController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdDisplayRuleService adDisplayRuleService;
	@Resource
	private IDictionaryService dicService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdRulePaper")
	public ModelAndView queryAdRulePaper(Page<AdDisplayRule> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = adDisplayRuleService.queryPage(page);
		
		model.addObject(page);

		model.setViewName("WEB-INF/jsp/ad/adDisplayRuleList");
		logger.info("--------->查看广告规则列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdRuleView", method = RequestMethod.GET)
	public ModelAndView addAdRuleView(String resKey,String editType) {
		List<SysDictionary> dicList = dicService.getDictionaryOfAdType();
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("dicList",dicList);
		model.setViewName("WEB-INF/jsp/ad/adDisplayRuleEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdRuleView", method = RequestMethod.GET)
	public ModelAndView editAdRuleView(String resKey,String editType,AdDisplayRule adr) {
		List<SysDictionary> dicList = dicService.getDictionaryOfAdType();
		AdDisplayRule c = adDisplayRuleService.selectByExample(adr);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("r",c);
		model.addObject("resKey",resKey);
		model.addObject("dicList",dicList);
		model.setViewName("WEB-INF/jsp/ad/adDisplayRuleEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAdRule", method = RequestMethod.POST)
	public void saveAdRule(String resKey,String editType,AdDisplayRule adr,HttpServletResponse response){
		ajaxObj = adDisplayRuleService.saveAdRule(resKey,editType,adr);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdRule")
	public void deleteAdRule(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adDisplayRuleService.deleteAdRule(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
