<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>全局搜索配置系统</title>

<link href="framework/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="framework/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="framework/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="framework/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="framework/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lt IE 9]><script src="framework/dwz/js/speedup.js" type="text/javascript"></script><script src="framework/dwz/js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
<!--[if gte IE 9]><!--><script src="framework/dwz/js/jquery-2.1.4.min.js" type="text/javascript"></script><!--<![endif]-->

<script src="framework/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="framework/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="framework/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="framework/dwz/xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="framework/dwz/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="framework/dwz/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svgÃ¥ÂÂ¾Ã¨Â¡Â¨  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="framework/dwz/text/javascript" src="chart/raphael.js"></script>
<script type="framework/dwz/text/javascript" src="chart/g.raphael.js"></script>
<script type="framework/dwz/text/javascript" src="chart/g.bar.js"></script>
<script type="framework/dwz/text/javascript" src="chart/g.line.js"></script>
<script type="framework/dwz/text/javascript" src="chart/g.pie.js"></script>
<script type="framework/dwz/text/javascript" src="chart/g.dot.js"></script>

<script src="framework/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.print.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换时下面dwz.regional.zh.js还需要引入)
<script src="framework/dwz/bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="framework/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("framework/dwz/dwz.frag.xml", {
		loginUrl:"login/goToLogin", loginTitle:"登录",
		statusCode:{ok:200, error:300, timeout:301},
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"},
		keys: {statusCode:"statusCode", message:"message"},
		ui:{hideMode:'offsets'},
		debug:false,
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
</script>
</head>

<body>
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="http://www.gionee.com">标志</a>
				<ul class="nav">
					<li>您好，<span>${accountSession.name}</span> </li>
					<li><a href="login/logout">退出</a></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					${menuHtml}
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">

						</div>
					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2016 <a href="demo_page2.html" target="dialog">Gionee ROM软件团队</a></div>

</body>
</html>