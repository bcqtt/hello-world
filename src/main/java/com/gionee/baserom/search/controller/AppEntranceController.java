package com.gionee.baserom.search.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.AppEntrance;
import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.AppVersionEntrance;
import com.gionee.baserom.search.pojo.AppVersionEntranceKey;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.service.IAppEntranceService;
import com.gionee.baserom.search.service.IAppVersionService;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("appEntrance")
public class AppEntranceController {
	protected static Logger logger = Logger.getLogger(AppEntranceController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAppEntranceService appEntranceService;
	@Resource
	private IAppVersionService appVersionService;
	@Resource
	private IResourcesService resourcesService;
	@Resource
	private IDictionaryService dicService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAppEntrancePaper", method = RequestMethod.GET)
	public ModelAndView queryAppEntrancePaper(Page<AppEntrance> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = appEntranceService.queryPage(page);
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
		model.setViewName("WEB-INF/jsp/app/appEntranceList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAppEntranceView", method = RequestMethod.GET)
	public ModelAndView addAppEntranceView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/appEntranceEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAppEntranceView", method = RequestMethod.GET)
	public ModelAndView editAppEntranceView(String resKey,String editType,AppEntrance entrance) {
		AppEntrance e = appEntranceService.selectByExample(entrance);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("entrance",e);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/app/appEntranceEdit");
		return model;
	}
	
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAppEntrance", method = RequestMethod.POST)
	public void saveAppEntrance(String resKey,String editType,AppEntrance entrance,HttpServletResponse response){
		ajaxObj = appEntranceService.saveAppEntrance(resKey,editType,entrance);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}

	
	/**
	 * 根据id删除
	 */
	@RequestMapping(value = "/deleteAppEntrance")
	public void deleteAppEntrance(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.appEntranceService.deleteAppEntrance(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/appEntranceConfigManage")
	public ModelAndView appEntranceConfigManage(Page<AppVersion> page,HttpServletRequest request){
		page = appVersionService.queryVersionEntranceList(page);
		ModelAndView model = new ModelAndView();
		model.addObject(page);
		model.setViewName("WEB-INF/jsp/app/appEntranceConfigManage");
		return model;
	}
	
	@RequestMapping(value = "/addAppVersionEntranceView", method = RequestMethod.GET)
	public ModelAndView addAppVersionEntranceView(String resKey,String editType) {
		List<AppVersion> versionList = appVersionService.queryAllVersion(); 
		List<AppEntrance> entranceList = appEntranceService.queryAllEntrance();
		List<SysDictionary> targetList = dicService.getDictionaryByClsRef("redirect_page");
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("versionList",versionList);
		model.addObject("entranceList",entranceList);
		model.addObject("targetList",targetList);
		model.setViewName("WEB-INF/jsp/app/appVersionEntranceEdit");
		return model;
	}
	
	@RequestMapping(value = "/editAppVersionEntranceView", method = RequestMethod.GET)
	public ModelAndView editAppVersionEntranceView(String resKey,String editType,AppVersion av) {
		List<AppVersion> versionList = appVersionService.queryAllVersion(); 
		List<AppEntrance> entranceList = appEntranceService.queryAllEntrance();
		List<SysDictionary> targetList = dicService.getDictionaryByClsRef("redirect_page");
		
		AppVersion version = appVersionService.selectByVid(av.getVid());
		ModelAndView model = new ModelAndView();
		
		List<Integer> eids = new ArrayList<Integer>();
		List<String> targetIds = new ArrayList<String>();
		if(version!=null){
			List<AppVersionEntrance> avekList = appVersionService.getVersionEntranceKeyByVid(av.getVid());
			for(int i=0;i<avekList.size();i++){
				AppVersionEntrance avek = avekList.get(i);
				eids.add(avek.getAppEntranceId());
				targetIds.add(avek.getAppEntranceId()+"-"+avek.getDicId());
			}
		}
		
		model.addObject("eids",eids);
		model.addObject("targetIds",targetIds);
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("versionList",versionList);
		model.addObject("entranceList",entranceList);
		model.addObject("targetList",targetList);
		model.addObject("version",version);
		model.setViewName("WEB-INF/jsp/app/appVersionEntranceEdit");
		return model;
	}
	
	/**
	 * 
	 * @param resKey 要刷新的div
	 * @param editType
	 * @param aek
	 * @param entrancesIds 入口id列表
	 * @param targetIds 的组合方式是 {eid-dicId},是为了跟entrance配对
	 * @param response
	 */
	@RequestMapping(value = "/saveAppVersionEntrance", method = RequestMethod.POST)
	public void saveAppVersionEntrance(String resKey,String editType,AppVersionEntranceKey aek,
			@RequestParam("entrancesIds[]")List<Integer> entrancesIds,
			@RequestParam("targetIds[]")List<String> targetIds,
			HttpServletResponse response){
		
		ajaxObj = appEntranceService.saveAppVersionEntrance(resKey,editType,aek,entrancesIds,targetIds);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/deleteAppVersionEntrance")
	public void deleteAppVersionEntrance(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.appEntranceService.deleteAppVersionEntrance(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	
}
