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
import com.gionee.baserom.search.pojo.Rosters;
import com.gionee.baserom.search.pojo.Version;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.IRostersService;
import com.gionee.baserom.search.service.IVersionService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("rosters")
public class RostersController {
	protected static Logger logger = Logger.getLogger(RostersController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IRostersService rostersService;
	@Resource
	private IVersionService versionService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示软件包信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryRostersPaper", method = RequestMethod.GET)
	public ModelAndView queryRostersPaper(Page<Rosters> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		String usertype = request.getParameter("usertype");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = rostersService.queryPage(page,usertype);
		List<Version> vlist = versionService.queryUsertypeList();
		
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
		model.addObject("vlist",vlist);
		model.addObject("selected_usertype",usertype);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/rosters/rostersList");
		logger.info("--------->查看软件包列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addRostersView", method = RequestMethod.GET)
	public ModelAndView addRostersView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/rosters/rostersEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editRostersView", method = RequestMethod.GET)
	public ModelAndView editRostersView(String resKey,String editType,Rosters rosters) {
		Rosters r = rostersService.selectByExample(rosters);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("rosters",r);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/rosters/rostersEdit");
		return model;
	}
	
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveRosters", method = RequestMethod.POST)
	public void saveRosters(String resKey,String editType,Rosters rosters,HttpServletResponse response){
		ajaxObj = rostersService.saveRosters(resKey,editType,rosters);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateRosters", method = RequestMethod.POST)
	public void updateRosters(String resKey,Rosters rosters,HttpServletResponse response){
		ajaxObj = rostersService.updateRosters(resKey,rosters);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除(包含多行删除)
	 */
	@RequestMapping(value = "/deleteRosters", method = RequestMethod.POST)
	public void deleteRosters(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.rostersService.deleteRosters(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
