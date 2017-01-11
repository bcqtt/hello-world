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
import com.gionee.baserom.search.pojo.AppUri;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IAppUriService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("uri")
public class AppUriController {
	protected static Logger logger = Logger.getLogger(AppUriController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAppUriService uriService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryUriPaper", method = RequestMethod.GET)
	public ModelAndView queryUriPaper(Page<AppUri> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = uriService.queryPage(page);
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
		model.setViewName("WEB-INF/jsp/app/uriList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addUriView", method = RequestMethod.GET)
	public ModelAndView addUriView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/uriEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editUriView", method = RequestMethod.GET)
	public ModelAndView editUriView(String resKey,String editType,AppUri appuri) {
		AppUri uri = uriService.selectByExample(appuri);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("uri",uri);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/uriEdit");
		return model;
	}
	
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveUri", method = RequestMethod.POST)
	public void saveUri(String resKey,String editType,AppUri card,HttpServletResponse response){
		ajaxObj = uriService.saveUri(resKey,editType,card);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除(包含多行删除)
	 */
	@RequestMapping(value = "/deleteUris")
	public void deleteUris(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.uriService.deleteUris(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
