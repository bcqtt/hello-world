package com.gionee.baserom.search.controller;

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
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.Images;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.service.IImagesService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("images")
public class ImagesController {
	protected static Logger logger = Logger.getLogger(ImagesController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IImagesService imagesService;
	@Resource
	private IDictionaryService dicService;
	@Resource
	private IResourcesService resourcesService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryImagesPaper")
	public ModelAndView queryImagesPaper(Page<Images> page,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		String pageNum = request.getParameter("pageNum");
		
		//值为'old'表示旧版广告，'news'表示新闻，'nav'表示导航，默认为null，表示图片管理列表
		String resource = request.getParameter("resource");
		
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		
		String type = request.getParameter("type");
		if(type==null){
			type="-1";
		}
		page = imagesService.queryPage(page,Integer.parseInt(type));
		String resId = request.getParameter("resId");
		Account acc = (Account) request.getSession().getAttribute("accountSession");
		if(acc==null){
			request.setAttribute("error","会话失效，重新登录。");
			model.setViewName("redirect");
			return model;
		}
		List<SysDictionary> typeList = dicService.getDictionaryByClsRef("images_type");
		List<Resources> optList = this.resourcesService.queryAccountOpt(acc.getId(),Integer.parseInt(resId));
		Resources res = this.resourcesService.selectById(Integer.parseInt(resId));
		model.addObject(page);
		model.addObject("typeList",typeList);
		model.addObject("resAction",res.getResUrl()+"?resId=" + resId);
		model.addObject("optList",optList);
		model.addObject("type",type);
		model.addObject("resKey",res.getResKey());
		model.addObject("resource",resource);
		
		String viewName = resource==null?"WEB-INF/jsp/resource/imagesList":"WEB-INF/jsp/resource/imagesSelectWindow";
		model.setViewName(viewName);
		logger.info("--------->查看图片素材列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addImagesView", method = RequestMethod.GET)
	public ModelAndView addImagesView(String resKey,String editType) {
		List<SysDictionary> typeList = dicService.getDictionaryByClsRef("images_type");
		ModelAndView model = new ModelAndView();
		model.addObject("typeList",typeList);
		model.addObject("editType",editType);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/resource/imagesUpload");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editImagesView", method = RequestMethod.GET)
	public ModelAndView editImagesView(String resKey,String editType,Images images) {
		Images i = imagesService.selectByExample(images);
		List<SysDictionary> typeList = dicService.getDictionaryByClsRef("images_type");
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("img",i);
		model.addObject("typeList",typeList);
		model.addObject("resKey",resKey);
		model.setViewName("WEB-INF/jsp/resource/imagesEdit");
		return model;
	}
	
	/**
	 * 保存上传的图片信息
	 * @param editType add:新增；edit:修改
	 */
	@RequestMapping(value = "/saveImages")
	public void saveImages(String resKey,String editType,int type,
			@RequestParam("images")MultipartFile[] images,
			HttpServletResponse response){
		ajaxObj = imagesService.saveImages(resKey,editType,images,type);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	/**
	 * 保存信息
	 * @param editType add:新增；edit:修改
	 */
	@RequestMapping(value = "/saveImagesInfo", method = RequestMethod.POST)
	public void saveImagesInfo(String resKey,String editType,Images images, HttpServletResponse response){
		ajaxObj = imagesService.saveImagesInfo(resKey,editType,images);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	/**
	 * 根据id删除(包含多行删除)
	 */
	@RequestMapping(value = "/deleteImages")
	public void deleteImages(String resKey,String ids,HttpServletResponse response){
		ajaxObj = this.imagesService.deleteImages(resKey,ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
