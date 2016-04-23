<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="framework/zTreeV3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="framework/zTreeV3/js/jquery.ztree.all.js" ></script>
<script type="text/javascript">
var pIdList_="${pIdList}";
</script>
<script type="text/javascript" src="js/resources.js" ></script>
<div id="resourcesListDiv" class="pageContent">

	<div style="width:16%;height:100%;float:left; border-right: 1px solid #b8d0d6">
		<ul id="resTree" class="ztree" layoutH="10" style="margin-top:0; width:198px;overflow-y:auto;"></ul>
	</div>
	
	<div style="width:83%;float:right; border-left:1px solid #b8d0d6">
	<form id="pagerForm" name="menuPaperForm" method="POST" onsubmit="return divSearch(this, 'resourcesListDiv');" action="${resAction}">
		<input type="hidden" name="pageNum" value="${page.currentPage}" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<input type="hidden" name="pIdList" value="${pIdList}" />
	</form>
	
	<div class="panelBar">
		<ul class="toolBar">
			<%--
			<li><a id="resAdd" class="add" href="resources/addResourcesView?editType=add" target="dialog" width="750" height="490"><span>添加</span></a></li>
			<li><a id="resEdit" class="edit" href="resources/editResourcesView?editType=update&id={id_res}" target="dialog" warn="请选择一个资源!" width="750" height="490"><span>修改</span></a></li>
			<li><a id="resDele" class="delete" href="resources/deleteResources?id={id_res}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
			 --%>
			<c:forEach var="opt" items="${optList}">
				<c:if test="${opt.type==3}">
					<c:if test="${opt.cssClass == 'add'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&menuKey=${menuKey}" target="${opt.target}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
						<input id="addHref" type="hidden" value="${opt.resUrl}&menuKey=${menuKey}" />
					</c:if>
					<c:if test="${opt.cssClass == 'edit'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&menuKey=${menuKey}" target="${opt.target}" warn="${opt.warn}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
					</c:if>
					<c:if test="${opt.cssClass == 'delete'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&menuKey=${menuKey}" target="${opt.target}" rel="ids" title="${opt.tittle}" ><span>${opt.name}</span></a></li>
					</c:if>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="75">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>资源名</th>
				<th>资源编码</th>
				<th>URL</th>
				<th align="center">类型</th>
				<th>资源描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="res" items="${page.list}">
			   <tr target="id_res" rel="${res.id}">
				<td><input name="ids" value="${res.id}" type="checkbox"></td>
				<td>${res.name}</td>
				<td>${res.resKey}</td>
				<td>${res.resUrl}</td>
				<td>
					<c:if test="${res.type == 0}"><div style="color:#1616CE;">模块</div></c:if>
					<c:if test="${res.type == 1}"><div style="color:#FFAA00;">目录</div></c:if>
   					<c:if test="${res.type == 2}"><div style="color:#11B100;">菜单</div></c:if>
   					<c:if test="${res.type == 3}"><div style="color:#00DAC3;">按钮</div></c:if>
				</td>
				<td>${res.description}</td>
			  </tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<script>
		        $("select[name='numPerPage']").val('${page.numPerPage}');
		    </script>
			<span>条，共${page.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>

	</div>
</div>
</div>
