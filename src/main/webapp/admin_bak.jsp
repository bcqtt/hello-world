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
<title>全局搜索配置系统</title>
<link href="http://baseromcdn.gionee.com/libs/dwz1.5.2/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="http://baseromcdn.gionee.com/libs/dwz1.5.2/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="http://baseromcdn.gionee.com/libs/dwz1.5.2/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="http://baseromcdn.gionee.com/libs/dwz1.5.2/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lt IE 9]><script src="js/speedup.js" type="text/javascript"></script><script src="js/jquery-1.11.3.min.js" type="text/javascript"></script><![endif]-->
<!--[if gte IE 9]><!--><script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/jquery-2.1.4.min.js" type="text/javascript"></script><!--<![endif]-->

<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/jquery.cookie.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/jquery.validate.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/xheditor/xheditor-1.2.2.min.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/raphael.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/g.raphael.js" type="text/javascript" ></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/g.bar.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/g.line.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/g.pie.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/g.dot.js" type="text/javascript"></script>

<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.core.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.util.date.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.drag.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.tree.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.accordion.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.ui.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.theme.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.tab.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.resize.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.dialog.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.pagination.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.effects.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.panel.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.history.js" type="text/javascript"></script>
<script src="framework/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.print.js" type="text/javascript"></script>

<!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换时下面dwz.regional.zh.js还需要引入)
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="http://baseromcdn.gionee.com/libs/dwz1.5.2/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("framework/dwz/dwz.frag.xml", {
		loginUrl:"framework/dwz/login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		keys: {statusCode:"statusCode", message:"message"}, //【可选】
		ui:{hideMode:'offsets'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
		debug:false,	// 调试模式 【true|false】
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
					<div class="accordionHeader">
						<h2><span>Folder</span>全局搜索管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="card/queryCardPaper" target="navTab" rel="card_list">卡片管理</a></li>
							<li><a href="site/querySitePaper" target="navTab" rel="site_list">网址导航管理</a></li>
							<li><a href="config/queryConfigPaper" target="navTab" rel="config_list">参数管理</a></li>
							<li><a href="life/queryLifeServicePaper" target="navTab" rel="life_list">生活服务管理</a></li>
							<li><a href="ad/queryAdPaper" target="navTab" rel="ad_list" >广告位管理</a></li>
						</ul>
					</div>
					
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="account/queryAccountPaper" target="navTab" rel="account_list" fresh="true">账号管理</a></li>
							<!-- <li><a href="group/queryGroupPaper" target="navTab" rel="group_list" fresh="true">分组管理</a></li> -->
							<li><a href="role/queryRolePaper" target="navTab" rel="role_list" fresh="true">分组管理</a></li>
							<li><a href="resources/queryResourcesPaper" target="navTab" rel="menu_list" fresh="true">菜单按钮管理</a></li>
						</ul>
					</div>
				
				    <!-- 以下是UI框架的DEMO,用作参考，开发到相关功能拷贝UI到上面来开发
					<div class="accordionHeader">
						<h2><span>Folder</span>界面组件</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="tabsPage.html" target="navTab">主框架面板</a>
								<ul>
									<li><a href="main.html" target="navTab" rel="main">我的主页</a></li>
									<li><a href="http://www.baidu.com" target="navTab" rel="page1">页面一(外部链接)</a></li>
									<li><a href="framework/dwz/demo/baidu_map.html" target="navTab" rel="external" external="true" title="需要设置external属性为true">地图(external="true")</a></li>
									<li><a href="framework/dwz/demo_page1.html" target="navTab" rel="page1" fresh="false">替换页面一</a></li>
									<li><a href="framework/dwz/demo_page2.html" target="navTab" rel="page2">页面二</a></li>
									<li><a href="framework/dwz/demo_page4.html" target="navTab" rel="page3" title="页面三（自定义标签名）">页面三</a></li>
									<li><a href="framework/dwz/demo_page4.html" target="navTab" rel="page4" fresh="false">测试页面(fresh="false")</a></li>
									<li><a href="framework/dwz/w_editor.html" target="navTab">表单提交会话超时</a></li>
									<li><a href="framework/dwz/demo/common/ajaxTimeout.html" target="navTab">navTab会话超时</a></li>
									<li><a href="framework/dwz/demo/common/ajaxTimeout.html" target="dialog">dialog会话超时</a></li>
									<li><a href="framework/dwz/index_menu.html" target="_blank">横向导航条</a></li>
								</ul>
							</li>
							
							<li><a>常用组件</a>
								<ul>
									<li><a href="framework/dwz/w_panel.html" target="navTab" rel="w_panel">面板</a></li>
									<li><a href="framework/dwz/w_tabs.html" target="navTab" rel="w_tabs">选项卡面板</a></li>
									<li><a href="framework/dwz/w_dialog.html" target="navTab" rel="w_dialog">弹出窗口</a></li>
									<li><a href="framework/dwz/w_alert.html" target="navTab" rel="w_alert">提示窗口</a></li>
									<li><a href="framework/dwz/w_list.html" target="navTab" rel="w_list">CSS表格容器</a></li>
									<li><a href="framework/dwz/demo_page1.html" target="navTab" rel="w_table">表格容器</a></li>
									<li><a href="framework/dwz/w_removeSelected.html" target="navTab" rel="w_table">表格数据库排序+批量删除</a></li>
									<li><a href="framework/dwz/w_tree.html" target="navTab" rel="w_tree">树形菜单</a></li>
									<li><a href="framework/dwz/w_accordion.html" target="navTab" rel="w_accordion">滑动菜单</a></li>
									<li><a href="framework/dwz/w_editor.html" target="navTab" rel="w_editor">编辑器</a></li>
									<li><a href="framework/dwz/w_datepicker.html" target="navTab" rel="w_datepicker">日期控件</a></li>
									<li><a href="framework/dwz/demo/database/db_widget.html" target="navTab" rel="db">suggest+lookup+主从结构</a></li>
									<li><a href="framework/dwz/demo/database/treeBringBack.html" target="navTab" rel="db">tree查找带回</a></li>
									<li><a href="framework/dwz/demo/sortDrag/1.html" target="navTab" rel="sortDrag">单个sortDrag示例</a></li>
									<li><a href="framework/dwz/demo/sortDrag/2.html" target="navTab" rel="sortDrag">多个sortDrag示例</a></li>
									<li><a href="framework/dwz/demo/sortDrag/form.html" target="navTab" rel="sortDrag">可拖动表单示例</a></li>
								</ul>
							</li>
									
							<li><a>表单组件</a>
								<ul>
									<li><a href="framework/dwz/w_validation.html" target="navTab" rel="w_validation">表单验证</a></li>
									<li><a href="framework/dwz/w_button.html" target="navTab" rel="w_button">按钮</a></li>
									<li><a href="framework/dwz/w_textInput.html" target="navTab" rel="w_textInput">文本框/文本域</a></li>
									<li><a href="framework/dwz/w_combox.html" target="navTab" rel="w_combox">下拉菜单</a></li>
									<li><a href="framework/dwz/w_checkbox.html" target="navTab" rel="w_checkbox">多选框/单选框</a></li>
									<li><a href="framework/dwz/demo_upload.html" target="navTab" rel="demo_upload">iframeCallback表单提交</a></li>
									<li><a href="framework/dwz/w_uploadify.html" target="navTab" rel="w_uploadify">uploadify多文件上传</a></li>
								</ul>
							</li>
							<li><a>组合应用</a>
								<ul>
									<li><a href="framework/dwz/demo/pagination/layout1.html" target="navTab" rel="pagination1">局部刷新分页1</a></li>
									<li><a href="framework/dwz/demo/pagination/layout2.html" target="navTab" rel="pagination2">局部刷新分页2</a></li>
								</ul>
							</li>
							<li><a>图表</a>
								<ul>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/barchart.html" target="navTab" rel="chart">柱状图(垂直)</a></li>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/hbarchart.html" target="navTab" rel="chart">柱状图(水平)</a></li>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/linechart.html" target="navTab" rel="chart">折线图</a></li>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/linechart2.html" target="navTab" rel="chart">曲线图</a></li>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/linechart3.html" target="navTab" rel="chart">曲线图(自定义X坐标)</a></li>
									<li><a href="http://baseromcdn.gionee.com/libs/dwz1.5.2/chart/test/piechart.html" target="navTab" rel="chart">饼图</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					<div class="accordionHeader">
						<h2><span>Folder</span>典型页面</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder treeCheck">
							<li><a href="framework/dwz/demo_page1.html" target="navTab" rel="demo_page1">查询我的客户</a></li>
							<li><a href="framework/dwz/demo_page1.html" target="navTab" rel="demo_page2">表单查询页面</a></li>
							<li><a href="framework/dwz/demo_page4.html" target="navTab" rel="demo_page4">表单录入页面</a></li>
							<li><a href="framework/dwz/demo_page5.html" target="navTab" rel="demo_page5">有文本输入的表单</a></li>
							<li><a href="javascript:;">有提示的表单输入页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形的页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
							<li><a href="javascript:;">选项卡和图形切换的页面</a></li>
							<li><a href="javascript:;">左右两个互动的页面</a></li>
							<li><a href="javascript:;">列表输入的页面</a></li>
							<li><a href="javascript:;">双层栏目列表的页面</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>流程演示</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree">
							<li><a href="framework/dwz/newPage1.html" target="dialog" rel="dlg_page">列表</a></li>
							<li><a href="framework/dwz/newPage1.html" target="dialog" rel="dlg_page2">列表</a></li>
						</ul>
					</div>
					-->
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
						
						<div style="width:230px;position: absolute;top:60px;right:0" layoutH="80">
							<iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
						</div>
					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2016 <a href="demo_page2.html" target="dialog">Gionee ROM软件团队</a></div>
</body>
</html>