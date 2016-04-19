package com.gionee.baserom.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 请求响应提示类，用于页面提示
 * @author gionee
 *
 */
@Controller  
@RequestMapping("result")
public class ResultController {
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public ModelAndView success() {
		ModelAndView model = new ModelAndView();
		model.setViewName("WEB-INF/jsp/result/200.html");
		return model;
	} 
	
	@RequestMapping(value = "/fail", method = RequestMethod.GET)
	public ModelAndView fail() {
		ModelAndView model = new ModelAndView();
		model.setViewName("WEB-INF/jsp/result/300.html");
		return model;
	} 
	
	@RequestMapping(value = "/timeout", method = RequestMethod.GET)
	public ModelAndView timeout() {
		ModelAndView model = new ModelAndView();
		model.setViewName("WEB-INF/jsp/result/301.html");
		return model;
	} 

}
