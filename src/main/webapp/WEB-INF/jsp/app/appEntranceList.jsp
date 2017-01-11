<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="appEntrance/addAppEntranceView?editType=add" target="dialog" rel="app_entrance_add"><span>添加</span></a></li>
			<li><a class="edit" href="appEntrance/editAppEntranceView?editType=update&id={id_entrance}" target="dialog" rel="app_entrance_edit" warn="请选择一个记录!"><span>修改</span></a></li>
			<li><a class="delete" href="appEntrance/deleteAppEntrance?id={id_entrance}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
			<li><a class="edit" href="appEntrance/appEntranceConfigManage" target="dialog" width="1000" height="600" rel="app_version_entrance_manage" mask="true" ><span>版本-入口配置</span></a></li>
			<%--
			<c:forEach var="opt" items="${optList}">
				<c:if test="${opt.type==3}">
					<c:if test="${opt.cssClass == 'add'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
					</c:if>
					<c:if test="${opt.cssClass == 'edit'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" warn="${opt.warn}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
					</c:if>
					<c:if test="${opt.cssClass == 'delete'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" rel="ids" title="${opt.tittle}" ><span>${opt.name}</span></a></li>
					</c:if>
				</c:if>
			</c:forEach>
			 --%>
		</ul>
	</div>
	<table class="table" width="1200" layoutH="75">
		<thead>
			<tr>
				<th align="center" width="40"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>版本号</th>
				<th>版本描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="entrance" items="${page.list}">
			   <tr target="id_entrance" rel="${entrance.eid}">
				<td><input name="ids" value="${entrance.eid}" type="checkbox"></td>
				<td>${entrance.entrance}</td>
				<td>${entrance.description}</td>
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
