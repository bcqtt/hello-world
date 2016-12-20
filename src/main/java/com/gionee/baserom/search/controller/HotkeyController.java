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
import com.gionee.baserom.search.pojo.HotKeys;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IHotkeyService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("hk")
public class HotkeyController {
	protected static Logger logger = Logger.getLogger(HotkeyController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IHotkeyService hotkeyService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryHotkeyPaper", method = RequestMethod.GET)
	public ModelAndView queryHotkeyPaper(Page<HotKeys> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = hotkeyService.queryPage(page);
		
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("login2");
			return model;
		}
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		model.addObject(page);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/hotkey/hotkeyList");
		logger.info("--------->查看自定义热词列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addHotkeyView", method = RequestMethod.GET)
	public ModelAndView addHotkeyView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/hotkey/hotkeyEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editHotkeyView", method = RequestMethod.GET)
	public ModelAndView editHotkeyView(String resKey,String editType,HotKeys hk) {
		HotKeys a = hotkeyService.selectByExample(hk);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("hk",a);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/hotkey/hotkeyEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveHotKey", method = RequestMethod.POST)
	public void saveHotKey(String resKey,String editType,HotKeys hk,HttpServletResponse response){
		ajaxObj = hotkeyService.saveHotkey(resKey,editType,hk);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateHotKey", method = RequestMethod.POST)
	public void updateHotKey(String resKey,HotKeys hk,HttpServletResponse response){
		ajaxObj = hotkeyService.updateHotkey(resKey,hk);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteHotKeys", method = RequestMethod.POST)
	public void deleteHotKeys(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.hotkeyService.deleteHotKeys(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
