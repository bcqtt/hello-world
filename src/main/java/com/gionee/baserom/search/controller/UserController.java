package com.gionee.baserom.search.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller  
@RequestMapping("user")
public class UserController {
	protected static Logger logger = Logger.getLogger(UserController.class);
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	 public ModelAndView admin() {
	 	 ModelAndView model = new ModelAndView();
	 	 model.addObject("title", "Spring Security Custom Login Form");
	     model.addObject("message", "This is protected page!");
	     model.setViewName("admin");
	     logger.info("Go to admin!");
	     return model;
	  
	 }
	  
   /** 
    * 指向登录页面 
    * 1. /login 登录页面的常规显示
    * 2. /login?error 登录验证失败的展示
    * 3. /login?logout 注销登录的处理
    */  
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {  
 
		ModelAndView model = new ModelAndView();
 
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login2");
		return model;
   }  

}
