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
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.pojo.SysDictionaryClassify;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("dic")
public class DictionaryController {
	protected static Logger logger = Logger.getLogger(DictionaryController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IDictionaryService dicService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryDicPaper", method = RequestMethod.GET)
	public ModelAndView queryDicPaper(Page<SysDictionary> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		String clsId = request.getParameter("clsId");
		if(clsId==null || clsId.equals("")){
			clsId = "-1";
		}
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = dicService.queryDicPage(page,clsId);
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("login2");
			return model;
		}
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		List<SysDictionaryClassify> dicTypeList = dicService.queryAllClassify();
		model.addObject(page);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("clsId",clsId);
		model.addObject("resKey",res.getResKey());
		model.addObject("dicTypeList",dicTypeList);
		model.setViewName("WEB-INF/jsp/system/dicList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addDicView", method = RequestMethod.GET)
	public ModelAndView addDicView(String resKey,String editType) {
		List<SysDictionaryClassify> clslist = dicService.queryAllClassify();
		ModelAndView model = new ModelAndView();
		model.addObject("clslist",clslist);
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/system/dicEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editDicView", method = RequestMethod.GET)
	public ModelAndView editDicView(String resKey,String editType,SysDictionary dic) {
		List<SysDictionaryClassify> clslist = dicService.queryAllClassify();
		SysDictionary d = dicService.selectByExample(dic);
		ModelAndView model = new ModelAndView();
		model.addObject("clslist",clslist);
		model.addObject("editType",editType);
		model.addObject("dic",d);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/system/dicEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveDic", method = RequestMethod.POST)
	public void saveDic(String resKey,String editType,SysDictionary dic,HttpServletResponse response){
		ajaxObj = dicService.saveDic(resKey,editType,dic);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteDic")
	public void deleteDic(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.dicService.deleteDic(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/*************以下是字典类型管理的部分************/
	
	/**
	 * 查询并展示信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryDicClassifyPaper")
	public ModelAndView queryDicClassifyPaper(Page<SysDictionaryClassify> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = dicService.queryPage(page);
		model.addObject(page);
		model.setViewName("WEB-INF/jsp/system/dicClassifyList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addDicClassifyView", method = RequestMethod.GET)
	public ModelAndView addDicClassifyView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/system/dicClassifyEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editDicClassifyView", method = RequestMethod.GET)
	public ModelAndView editDicClassifyView(String resKey,String editType,SysDictionaryClassify sdc) {
		SysDictionaryClassify c = dicService.selectByExample(sdc);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("classify",c);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/system/dicClassifyEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveDicClassify", method = RequestMethod.POST)
	public void saveDicClassify(String resKey,String editType,SysDictionaryClassify sdc,HttpServletResponse response){
		ajaxObj = dicService.saveDicClassify(resKey,editType,sdc);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteDicClassify")
	public void deleteDicClassify(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.dicService.deleteDicClassify(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
