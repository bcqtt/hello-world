<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全局搜索配置系统登陆</title>
<link rel="shortcut icon" href="framework/images/g_logo.png" type="image/x-icon" />
<link href="framework/dwz/themes/css/login.css" rel="stylesheet" type="text/css" />
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/jquery-1.11.3.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(function(){
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1;
		if(userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
		    //判断是否为IE浏览器
		    $(".loginForm").css("width","280px");
		    $("input[name='password']").attr("size",21);
		}else if(userAgent.indexOf("Chrome") > -1){
			$(".loginForm").css("width","280px");
			$(".loginForm").css("right","10px");
		};
	});
	function changeCode() {
		var imgNode = document.getElementById("vimg");
		imgNode.src = "servlet/AuthImageServlet?t=" + Math.random();
	}
	$(document).ready(function(){
		changeCode();
	});
</script>
</head>
<body>
<div id="login">
		<div id="login_header">
			<h1 class="login_logo">
				<a href="http://www.gionee.com/"><img src="framework/dwz/themes/default/images/login_logo.png" /></a>
			</h1>
			<div class="login_headerContent">
				<div class="navList">
					<ul>
						<li></li>
					</ul>
				</div>
				<h2 class="login_title"></h2>
			</div>
		</div>
		<div id="login_content">
			<div class="loginForm">
			    <c:if test="${not empty error}">
                    <div style="color:red;margin-left:80px;">${error}</div>
         	    </c:if>
				<form name="loginform" action="login/login" method="post">
					<p>
						<label>用户名：</label>
						<input type="text" name="accountName" size="20" style="width:150px" class="login_input" />
					</p>
					<p>
						<label>密码：</label>
						<input type="password" name="password" size="20" style="width:150px" class="login_input" />
					</p>
					<p>
						<label>验证码：</label>
						<input name="randCode" class="code" type="text" size="5" style="width:70px" value="" />
						<span><img  id="vimg" title="点击更换" src="servlet/AuthImageServlet" onclick="changeCode();" alt="" width="75" height="24" /></span>
					</p>
					<div class="login_bar">
						<input class="sub" type="submit" value=" " />
					</div>
					<!-- 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					 -->
				</form>
			</div>
			<div class="login_banner"><img src="framework/dwz/themes/default/images/login_banner.jpg" /></div>
		</div>
		<div id="login_footer">
			Copyright &copy; 2016 www.gionee.com Inc. All Rights Reserved.
		</div>
	</div>
</body>
</html>