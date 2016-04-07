package com.gionee.baserom.search.controller;

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
import com.gionee.baserom.search.pojo.GroupInfo;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IGroupService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("group")
public class GroupController {
	protected static Logger logger = Logger.getLogger(GroupController.class);
	private String jsonResult = "";
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private IGroupService groupService;
	
	/**
	 * 查询并展示账号信息列表界面
	 * @return
	 */
	@RequestMapping(value = "/queryGroupPaper", method = RequestMethod.GET)
	public ModelAndView queryGroupPaper(Page<GroupInfo> page,HttpServletRequest request) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum != null){
			page.setCurrentPage(Integer.parseInt(pageNum));
		}
		page = groupService.queryPage(page);
		ModelAndView model = new ModelAndView();
		model.addObject(page);
		model.setViewName("WEB-INF/jsp/authority/groupList");
		logger.info("--------->查看分组列表。");
		return model;
	}
	
	/**
	 * 打开新增页面
	 * @return
	 */
	@RequestMapping(value = "/addGroupView", method = RequestMethod.GET)
	public ModelAndView addGroupView(String editType) {
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.setViewName("WEB-INF/jsp/authority/groupEdit");
		return model;
	}
	
	/**
	 * 打开编辑界面
	 * @return
	 */
	@RequestMapping(value = "/editGroupView", method = RequestMethod.GET)
	public ModelAndView editGroupView(String editType,GroupInfo group) {
		GroupInfo g = groupService.selectByExample(group);
		ModelAndView model = new ModelAndView();
		model.addObject("editType",editType);
		model.addObject("group",g);
		model.setViewName("WEB-INF/jsp/authority/groupEdit");
		return model;
	}
	
	/**
	 * 保存分组信息
	 * @param editType add:新增；edit:修改
	 * @param account
	 */
	@RequestMapping(value = "/saveGroupInfo", method = RequestMethod.POST)
	public void saveGroupInfo(String editType,GroupInfo group,HttpServletResponse response){
		ajaxObj = groupService.saveGroupInfo(editType,group);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
	
	/**
	 * 根据id删除group(包含多行删除)
	 */
	@RequestMapping(value = "/deleteGroups", method = RequestMethod.POST)
	public void deleteGroups(String ids,HttpServletResponse response){
		ajaxObj = this.groupService.deleteGroups(ids);
		jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
	}
}
