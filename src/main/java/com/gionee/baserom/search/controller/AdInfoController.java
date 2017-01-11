package com.gionee.baserom.search.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.AdBehavior;
import com.gionee.baserom.search.pojo.AdBehaviorTodo;
import com.gionee.baserom.search.pojo.AdClassify;
import com.gionee.baserom.search.pojo.AdDisplayRule;
import com.gionee.baserom.search.pojo.AdInfo;
import com.gionee.baserom.search.pojo.AdKeyword;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.service.IAdBehaviorService;
import com.gionee.baserom.search.service.IAdBehaviorTodoService;
import com.gionee.baserom.search.service.IAdClassifyService;
import com.gionee.baserom.search.service.IAdDisplayRuleService;
import com.gionee.baserom.search.service.IAdInfoService;
import com.gionee.baserom.search.service.IAdKeywordService;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

import jxl.read.biff.BiffException;
import jxl.write.WriteException;

@Controller  
@RequestMapping("adinfo")
public class AdInfoController {
	protected static Logger logger = Logger.getLogger(AdInfoController.class);
	
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IAdInfoService adInfoService;
	@Resource
	private IDictionaryService dictionaryService;
	@Resource
	private IAdClassifyService adClassifyService;
	@Resource
	private IAdKeywordService adKeywordService;
	@Resource
	private IAdBehaviorTodoService adBehaviorTodoService;
	@Resource
	private IAdBehaviorService adBehaviorService;
	@Resource
	private IAdDisplayRuleService adDisplayRuleService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 打开广告管理页面
	 * @return
	 */
	@RequestMapping(value = "/adManageView", method = RequestMethod.GET)
	public ModelAndView adManageView(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("redirect");
			return model;
		}
		List<AdDisplayRule> adRuleList = adDisplayRuleService.queryAllAdRule();
		model.addObject("adRuleList",adRuleList);
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("resKey",res.getResKey());
		model.setViewName("WEB-INF/jsp/ad/adManage");
		logger.info("--------->查看分组列表。");
		return model;
	}
	/**
	 * 打开广告投放管理页面
	 * @return
	 */
	@RequestMapping(value = "/adPuttingManageView", method = RequestMethod.GET)
	public ModelAndView adPuttingManageView(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		List<AdDisplayRule> adRuleList = adDisplayRuleService.queryAllAdRule();
		model.addObject("adRuleList",adRuleList);
		model.setViewName("WEB-INF/jsp/ad/adPuttingInfoWindow");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryAdInfoPaper")
	public ModelAndView queryAdInfoPaper(Page<AdInfo> page,HttpServletRequest request,AdInfo ai) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		if(ai.getAdBehaviorId()!=null && ai.getAdBehaviorId()==-1){
			ai.setAdBehaviorId(null);
		}
		if(ai.getAdClassifyId()!=null && ai.getAdClassifyId()==-1){
			ai.setAdClassifyId(null);
		}
		String searchType = request.getParameter("searchType");//用于识别是广告信息管理列表的查询还是投放管理的查询
		String resKey = request.getParameter("resKey");
		String adRuleId = request.getParameter("adRuleId");
		String startTime = request.getParameter("start_time");
		String endTime = request.getParameter("end_time");
		if(startTime != null && !startTime.equals("")){
			ai.setStartTime(StringHelper.strToDate2(startTime));
		}
		if(endTime != null && !endTime.equals("")){
			ai.setEndTime(StringHelper.strToDate2(endTime));
		}
		ai.setAdRuleId(adRuleId!=null && !adRuleId.equals("")?Integer.parseInt(adRuleId):null);
		page = adInfoService.queryPage(page,ai,searchType,resKey);
		List<AdClassify> classifyList = adClassifyService.getAllClassify();
		model.addObject("classifyList",classifyList);
		model.addObject(page);
		model.addObject("ai",ai);
		if(searchType == null ){
			List<AdBehavior> behaviorList = adBehaviorService.getAdBehaviorList();
			model.addObject("behaviorList",behaviorList);
			model.setViewName("WEB-INF/jsp/ad/adInfoList");
		}else{
			List<AdDisplayRule> ruleList = adDisplayRuleService.queryAllAdRule();
			model.addObject("ruleList",ruleList);
			model.addObject("resKey",resKey);
			model.setViewName("WEB-INF/jsp/ad/adPuttingInfoList");
			
		}
		logger.info("--------->查看广告列表。");
		return model;
	}
	
	@RequestMapping(value = "/exportAdInfo")
	public void exportAdInfo(HttpServletResponse response,HttpServletRequest request,AdInfo ai,String resKey) throws IOException, BiffException, WriteException{
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";;
		String filepath = adInfoService.exportAdInfo(ai,resKey,basePath);
		
        File file = new File(filepath);  
        String filename = file.getName();
        String fileHttpPath = "templet/" + filename;
        Map<String,Object> map =new HashMap<String, Object>();
        map.put("filePath", fileHttpPath);
        jsonResult = JSONObject.toJSONString(map);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addAdInfoView", method = RequestMethod.GET)
	public ModelAndView addAdInfoView(String resKey,String editType,String adRuleId) {
		Map<String,Object> dicMap = dictionaryService.getDictionary();
		List<AdBehavior> behaviorList = adBehaviorService.getAdBehaviorList();
		List<AdClassify> classifyList = adClassifyService.getAllClassify();
		ModelAndView model = new ModelAndView();
		model.addObject("dicMap",dicMap);
		model.addObject("behaviorList",behaviorList);
		model.addObject("classifyList",classifyList);
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.addObject("adRuleId",adRuleId);
		model.setViewName("WEB-INF/jsp/ad/adInfoEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editAdInfoView", method = RequestMethod.GET)
	public ModelAndView editAdInfoView(String resKey,String editType,AdInfo ai,String adRuleId) {
		Map<String,Object> dicMap = dictionaryService.getDictionary();
		List<AdBehavior> behaviorList = adBehaviorService.getAdBehaviorList();
		List<AdClassify> classifyList = adClassifyService.getAllClassify();
		
		AdInfo c = adInfoService.selectByExample(ai);
		List<AdKeyword> keywordList = adKeywordService.getSelectedKeyword(c.getKeyword()!=null?c.getKeyword().split(","):new String[0]);
		Map<String ,Object> dicmap = dictionaryService.getDataByIds(c.getVersion(),c.getMechineType());
		AdBehaviorTodo abt = adBehaviorTodoService.selectByExample(ai);
		ModelAndView model = new ModelAndView();
		model.addObject("abt",abt);
		model.addObject("dicMap",dicMap);
		model.addObject("behaviorList",behaviorList);
		model.addObject("classifyList",classifyList);
		model.addObject("keywordList",keywordList);
		model.addObject("editType",editType);
		model.addObject("ai",c);
		model.addObject("dicmap",dicmap);
		model.addObject("resKey",resKey);
		model.addObject("adRuleId",adRuleId);
		model.setViewName("WEB-INF/jsp/ad/adInfoEdit");
		return model;
	}
	
	/**
	 * 保存广告信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "/saveAdInfo", method = RequestMethod.POST)
	public void saveAdInfo(HttpServletRequest request,HttpServletResponse response,AdInfo ai,
			String editType,String resKey,@RequestParam("adImage") MultipartFile adImage) throws IllegalStateException, IOException{
		
		String fileName = adImage.getOriginalFilename();
		String[] ymd = StringHelper.getYMD().split("-");
		
		String path=request.getSession().getServletContext().getRealPath("");
		String imgPath = "/upload/" + ymd[0] + "/" + ymd[1] + "/" + ymd[2];
		ai.setAdImagePath(imgPath + "/" + fileName);
		
		File targetDir = new File(path + imgPath);
        if (!targetDir.exists()) {
            targetDir.mkdirs();
        }
        logger.info("广告图保存至目录：" + targetDir);
        
        try {
        	// 保存
        	adImage.transferTo( new File(targetDir +"/" + fileName));
//        	FileOutputStream out = new FileOutputStream(targetDir + "/" + fileName);
//        	out.write(adImage.getBytes());
//          out.flush();
//          out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		
        String url = request.getParameter("url");
        String appName = request.getParameter("appName");
        AdBehaviorTodo abt = new AdBehaviorTodo();
        abt.setUrl(url);
        abt.setAppName(appName);
        
		ajaxObj = adInfoService.saveAdInfo(resKey,editType,ai,abt);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	/**
	 * 更新广告信息
	 * @param editType add:新增；edit:修改
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value = "/updateAdInfo", method = RequestMethod.POST)
	public void updateAdInfo(HttpServletRequest request,HttpServletResponse response,AdInfo ai,
			String editType,String resKey) throws IllegalStateException, IOException{
		
		String url = request.getParameter("url");
        String appName = request.getParameter("appName");
        AdBehaviorTodo abt = new AdBehaviorTodo();
        abt.setUrl(url);
        abt.setAppName(appName);
		
		ajaxObj = adInfoService.saveAdInfo(resKey,editType,ai,abt);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteAdInfo")
	public void deleteAdInfo(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.adInfoService.deleteAdInfo(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	@RequestMapping(value = "/selectWindow", method = RequestMethod.GET)
	public ModelAndView selectWindow(HttpServletRequest request,String dickey,String optid) {
		Map<String,Object> dicmap = dictionaryService.getVersionAndDic();
		ModelAndView model = new ModelAndView();
		if(dickey.equals("version")){
			model.addObject("dics", dicmap.get("version"));
		}else{
			model.addObject("dics", dicmap.get("mechineType"));
		}
		model.addObject("optids", optid);
		model.addObject("dickey", dickey);
		model.setViewName("WEB-INF/jsp/ad/selectWindow");
		return model;
	}

}
