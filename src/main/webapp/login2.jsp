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
<title>全局搜索后台管理-登录</title>
<link rel="shortcut icon" href="framework/images/favicon.ico" type="image/x-icon" />
<link href="framework/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="framework/bootstrap/css/signin.css" rel="stylesheet">

<script type="text/javascript">
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
<div class="banner">
		<div class="login-container">
		  <form class="form-signin" action="login/login" method="post">
			<h2 class="form-signin-heading">请登录</h2>
			<label for="inputAccountName" class="sr-only">登录名</label>
			<input type="text" name="accountName" id="inputAccountName" class="form-control" placeholder="登录名" required autofocus>
			<label for="inputPassword" class="sr-only">密码</label>
			<input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
			<div>
			  <input type="text" name="randCode" id="verificationCode" class="form-control" placeholder="验证码" required />
			  <img  id="vimg" title="点击更换" src="servlet/AuthImageServlet" onclick="changeCode();" alt="" width="75" height="24" />
			</div>

			<div class="checkbox">
			  <label>
				<!-- <input type="checkbox" value="remember-me"> 保存密码 -->
				<c:if test="${not empty error}">
                    <div style="color:red;margin-left:80px;">${error}</div>
         	    </c:if>
			  </label>
			</div>

			<input class="btn btn-lg btn-primary btn-block" type="submit" value="登录"/>
		  </form>
		</div> <!-- /login-container -->
		<div id="login_footer">
			Copyright &copy; 2016 www.gionee.com Inc. All Rights Reserved.
		</div>
	</div>

</body>
</html>