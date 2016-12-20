package com.gionee.baserom.search.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdKeyword;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdKeywordService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("adKeyword")
public class AdKeywordController {
	protected static Logger logger = Logger.getLogger(AdKeywordController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdKeywordService adKeywordService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdKeywordPaper")
	public ModelAndView queryCardPaper(Page<AdKeyword> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = adKeywordService.queryPage(page);
		
		model.addObject(page);

		model.setViewName("WEB-INF/jsp/ad/adKeywordList");
		logger.info("--------->查看关键字列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/selectKeywordView", method = RequestMethod.GET)
	public ModelAndView selectKeywordView(String resKey,String editType,String keywordIds) {
		List<AdKeyword> kwList = adKeywordService.getAllKeyword();
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("kwList",kwList);
		model.addObject("keywordIds",keywordIds);
		model.setViewName("WEB-INF/jsp/ad/selectKeywordWindow");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdKeywordView", method = RequestMethod.GET)
	public ModelAndView addAdKeywordView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adKeywordEdit");
		return model;
	}
	/**
	 * 打开关键字上传页面
	 * @return
	 */
	@RequestMapping(value = "/uploadAdKeywordView", method = RequestMethod.GET)
	public ModelAndView uploadAdKeywordView(String resKey,String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adKeywordUpload");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdKeywordView", method = RequestMethod.GET)
	public ModelAndView editKeywordView(String resKey,String editType,AdKeyword keyword) {
		AdKeyword k = adKeywordService.selectByExample(keyword);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("key",k);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/ad/adKeywordEdit");
		return model;
	}
	
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveAdKeyword", method = RequestMethod.POST)
	public void saveAdKeyword(String resKey,String editType,AdKeyword keyword,HttpServletResponse response){
		ajaxObj = adKeywordService.saveAdKeyword(resKey,editType,keyword);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	/**
	 * 上传信息
	 * @param account
	 * @throws IOException 
	 */
	@RequestMapping(value = "/uploadAdKeyword", method = RequestMethod.POST)
	public void uploadAdKeyword(String resKey,HttpServletResponse response,
			@RequestParam("txtFile") MultipartFile txtFile) throws IOException{
		InputStream in = txtFile.getInputStream();
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(in));
		String str=null;
		
		// 一行一行读 
		List<String> keyList = new ArrayList<String>();
		while ((str = br.readLine()) != null) {
			keyList.add(str);
		}
		ajaxObj = adKeywordService.uploadAdKeyword(resKey,keyList);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdKeyword")
	public void deleteAdKeyword(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adKeywordService.deleteAdKeyword(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
