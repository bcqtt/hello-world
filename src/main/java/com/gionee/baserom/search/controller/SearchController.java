package com.gionee.baserom.search.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.HotkeySource;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IHotkeySourceService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.service.ISearchService;
import com.gionee.baserom.search.util.StringHelper; 

@Controller
@RequestMapping("/search")
public class SearchController {
    private final Logger logger = LoggerFactory.getLogger(SearchController.class);
    private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IHotkeySourceService hotkeySourceService;
	@Resource
	private IResourcesService resourcesService;

    @Resource
    private ISearchService searchService;
 
    @RequestMapping("/changeSource")
    public ModelAndView changeSource(Page<HotkeySource> page,HttpServletRequest request) {
    	ModelAndView model = new ModelAndView();
        String sourceCode = (String)request.getParameter("sourceCode");
        logger.info("request para sourceCode ----> " + sourceCode);
        if (sourceCode != null && sourceCode.endsWith("")) {
            searchService.updateUseSource(sourceCode,1);
        }
        HotkeySource hotkeySource = searchService.getUseredSource();
        List<HotkeySource> dataSourceList = this.searchService.getAllDataSource(1);
        if (hotkeySource != null) {
            model.addObject("hotkeySource", hotkeySource);
        } 
        model.addObject("dataSourceList", dataSourceList);
        
        //分页查询列表
        String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = hotkeySourceService.queryPage(page,1);
		
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
		model.setViewName("/WEB-INF/jsp/authority/sourceChange");
        return model;
    }
    
    /**
     * 切换采集源
     * @param request
     * @param response
     */
    @RequestMapping("/doChange")
    public void doChange(HttpServletRequest request,HttpServletResponse response){
    	String jsonResult = "";
    	DwzAjaxObject ajaxObj = null;
    	int type = Integer.parseInt(request.getParameter("type"));
    	String sourceCode = (String)request.getParameter("sourceCode");
        logger.info("切换采集源 - request para sourceCode ----> " + sourceCode);
        if (sourceCode != null && sourceCode.endsWith("")) {
            searchService.updateUseSource(sourceCode,type);
            ajaxObj = new DwzAjaxObject("200", "操作成功！" ,"", "", "");
        }
        jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
    }
    
    /**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addHotkeySourceView", method = RequestMethod.GET)
	public ModelAndView addHotkeySourceView(int type,String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		if(type == 1){
			model.setViewName("/WEB-INF/jsp/authority/sourceEdit");
		}else if(type == 2){
			model.setViewName("/WEB-INF/jsp/source/assoSourceEdit");
		}
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editHotkeySourceView", method = RequestMethod.GET)
	public ModelAndView editHotkeySourceView(int type,String resKey,String editType,HotkeySource source) {
		HotkeySource s = hotkeySourceService.selectByExample(source);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("source",s);
		model.addObject("resKey",resKey);
		if(type == 1){
			model.setViewName("/WEB-INF/jsp/authority/sourceEdit");
		}else if(type == 2){
			model.setViewName("/WEB-INF/jsp/source/assoSourceEdit");
		}
		return model;
	}
	
	/**
	 * 保存采集源信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveHotkeySource", method = RequestMethod.POST)
	public void saveHotkeySource(String resKey,String editType,HotkeySource source,HttpServletResponse response){
		ajaxObj = this.hotkeySourceService.saveHotkeySource(resKey,editType,source);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/updateHotkeySource", method = RequestMethod.POST)
	public void updateHotkeySource(String resKey,HotkeySource source,HttpServletResponse response){
		ajaxObj = hotkeySourceService.updateHotkeySource(resKey,source);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除采集源(包含多行删除)
	 */
	@RequestMapping(value = "/deleteHotkeySources", method = RequestMethod.POST)
	public void deleteHotkeySources(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.hotkeySourceService.deleteHotkeySources(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 联想词接口列表
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/assoSourceList")
	public ModelAndView assoSourceList(Page<HotkeySource> page,HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		
		HotkeySource hotkeySource = searchService.getUseredSource();
        List<HotkeySource> dataSourceList = this.searchService.getAllDataSource(2);
        if (hotkeySource != null) {
            model.addObject("hotkeySource", hotkeySource);
        } 
        model.addObject("dataSourceList", dataSourceList);
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = hotkeySourceService.queryPage(page,2);
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
		model.setViewName("/WEB-INF/jsp/source/assoSourceList");
		logger.info("--------->查看联想词源列表。");
		return model;
	}
}
