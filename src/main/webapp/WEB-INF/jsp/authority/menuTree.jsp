<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="width:350px;height:550px;scroll-y:auto;">
<ul id="menuTree" class="tree treeFolder treeCheck expand" oncheck="kkk">
	<li><a >框架面板</a>
		<ul>
			<li><a tname="name" tvalue="value1" checked="true">我的主页</a></li>
			<li><a tname="name" tvalue="value2">页面一</a></li>
			<li><a tname="name" tvalue="value3">替换页面一</a></li>
			<li><a tname="name" tvalue="value4">页面二</a></li>
			<li><a tname="name" tvalue="value5">页面三</a></li>
		</ul>
	</li>

	<li><a tname="name" tvalue="test1">Test 1</a>
		<ul>
			<li><a tname="name" tvalue="test1.1">Test 1.1</a>
				<ul>
					<li><a tname="name" tvalue="test1.1.1" checked="true">Test 1.1.1</a></li>
					<li><a tname="name" tvalue="test1.1.2" checked="false">Test 1.1.2</a></li>
				</ul>
			</li>
			<li><a tname="name" tvalue="test1.2" checked="true">Test 1.2</a></li>
		</ul>
		<ul>
			<li><a tname="name" tvalue="test1.1">Test 1.1</a>
				<ul>
					<li><a tname="name" tvalue="test1.1.1" checked="true">Test 1.1.1</a></li>
					<li><a tname="name" tvalue="test1.1.2" checked="false">Test 1.1.2</a></li>
				</ul>
			</li>
			<li><a tname="name" tvalue="test1.2" checked="true">Test 1.2</a></li>
		</ul>
	</li>
	<li><a tname="name" tvalue="test2" checked="true">Test 2</a></li>
</ul>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
