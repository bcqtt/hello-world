package com.gionee.baserom.search.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.service.IAccountService;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Controller  
@RequestMapping("login")
public class LoginController {
	protected static Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private IAccountService accountService;
	
	@Resource
	private IResourcesService resourcesService;
	
	@Autowired
	private AuthenticationManager gioneeAuthenticationManager;
	
	@RequestMapping(value = "/goToLogin", method = RequestMethod.GET)
	public ModelAndView goToLogin(HttpServletRequest request) {
	 	ModelAndView model = new ModelAndView();
	 	request.setAttribute("error","会话失效，重新登录！");
	    model.setViewName("redirect");
	    logger.info("Go to Login!");
	    return model;
	 }
	  
   /** 
    * 登陆验证
    */  
	@RequestMapping(value = "/login")
	public ModelAndView login(Account account,HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		
		String rand = (String) request.getSession().getAttribute("rand");
		String randCode = request.getParameter("randCode");
		String error = request.getParameter("error");
		if(error!=null){
			request.setAttribute("error",error);
			model.setViewName("login2");
			return model;
		}
		if(rand==null ||randCode==null){
			request.setAttribute("error","请登录。");
			model.setViewName("login2");
			return model;
		}
		if (StringHelper.isEmpty(account.getAccountName()) || StringHelper.isEmpty(account.getPassword())) {
			request.setAttribute("error","账号或密码不能为空！");
			model.setViewName("login2");
			return model;
		}
		if(!rand.toLowerCase().equals(randCode.toLowerCase())){
			request.setAttribute("error","验证码不对！");
			model.setViewName("login2");
			return model;
		}
		
		String password = StringHelper.md5(account.getPassword());
		
		if (!request.getMethod().equals("POST")) {
			request.setAttribute("error","支持POST方法提交！");
		}
		
		//查询出账号信息,验证账号名和密码是否正确
		Account acc = this.accountService.selectByExample(account);
		if (acc == null || !acc.getPassword().equals(password)) {
			request.setAttribute("error", "密码不正确！");
			model.setViewName("login2");
			return model;
		}
		
		try {
			Authentication authentication = gioneeAuthenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(acc.getAccountName(),acc.getPassword()));
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			HttpSession session = request.getSession(true);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			//验证都通过后,账号信息存入session,session的key:accountSession
			request.getSession().setAttribute("accountSession", acc);
			
			acc.setLastLoginTime(new Date());
			this.accountService.updateById(acc);
		} catch (AuthenticationException e) {
			request.setAttribute("error", "登录异常，请联系管理员。");
			model.setViewName("login2");
			e.printStackTrace();
			return model;
		}
		
		//读取账号可访问资源
		String menuHtml = resourcesService.queryAccountMenu(acc.getId());
		model.addObject("menuHtml", menuHtml);
		model.setViewName("admin");
		return model;
	}
	
	/**
	 * 登出
	 * @param account
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		Object o = request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		if(null != o){
			request.getSession().removeAttribute("SPRING_SECURITY_CONTEXT");
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("login2");
		return model;
	}

}
