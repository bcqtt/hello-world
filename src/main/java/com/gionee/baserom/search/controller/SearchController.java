package com.gionee.baserom.search.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.HotkeySource;
import com.gionee.baserom.search.service.ISearchService;
import com.gionee.baserom.search.util.StringHelper; 

@Controller
@RequestMapping("/search")
public class SearchController {
    private final Logger logger = LoggerFactory.getLogger(SearchController.class);

    @Resource
    private ISearchService searchService;
 
    @RequestMapping("/changeSource")
    public String changeSource(HttpServletRequest request, Model model) {
        String sourceCode = (String)request.getParameter("sourceCode");
        logger.info("request para sourceCode ----> " + sourceCode);
        if (sourceCode != null && sourceCode.endsWith("")) {
            searchService.updateUseSource(sourceCode);
        }
        HotkeySource hotkeySource = searchService.getUseredSource();
        List<HotkeySource> dataSourceList = this.searchService.getAllDataSource();
        if (hotkeySource != null) {
            model.addAttribute("hotkeySource", hotkeySource);
        } 
        model.addAttribute("dataSourceList", dataSourceList);
        return "/WEB-INF/jsp/authority/changeSource";
    }
    
    @RequestMapping("/doChange")
    public void doChange(HttpServletRequest request,HttpServletResponse response){
    	String jsonResult = "";
    	DwzAjaxObject ajaxObj = null;
    	String sourceCode = (String)request.getParameter("sourceCode");
        logger.info("切换采集源 - request para sourceCode ----> " + sourceCode);
        if (sourceCode != null && sourceCode.endsWith("")) {
            searchService.updateUseSource(sourceCode);
            ajaxObj = new DwzAjaxObject("200", "操作成功！" ,"", "", "");
        }
        jsonResult = JSONObject.toJSONString(ajaxObj);
		StringHelper.outputJsonString(jsonResult, response);
    }

}
