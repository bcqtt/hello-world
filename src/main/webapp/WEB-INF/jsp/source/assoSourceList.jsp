<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>

<script type="text/javascript">
 function doChangeAss(){
	var sourceCode = $("#sourceCodeAss").val();
	ajaxTodo("search/doChange?type=2&sourceCode=" + sourceCode
			,PublicUtils.ajaxTodoCallback());
}
 </script>
<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					 请选联想词数据源：
				</td>
				<td>
					<select id="sourceCodeAss" name="sourceCode"  >
						<c:forEach var="source" items="${dataSourceList}">
							<option value="${source.sourceCode}" <c:if test="${source.enableStatus == 1}">selected="selected"</c:if>>${source.sourceName}</option>
						</c:forEach>
					</select>
				</td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="doChangeAss();">提交</button></div></div></td>
			</tr>
		</table>
	</div>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			
			<li><a class="add" href="search/addHotkeySourceView?type=2&editType=add&resKey=${resKey}" target="dialog" width="600" height="280"><span>添加</span></a></li>
			<li><a class="edit" href="search/editHotkeySourceView?type=2&editType=update&id={id_source}&resKey=${resKey}" target="dialog" warn="请选择一个记录!" width="600" height="280"><span>修改</span></a></li>
			<li><a class="delete" href="search/deleteHotkeySources?id={id_source}&resKey=${resKey}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
	<table class="table" width="1200" layoutH="110">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>Code</th>
				<th align="center">名称</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="source" items="${page.list}">
			   <tr target="id_source" rel="${source.id}">
				<td><input name="ids" value="${source.id}" type="checkbox"></td>
				<td>${source.sourceCode}</td>
				<td>${source.sourceName}</td>
				<td>${source.url}</td>
			  </tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${page.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>

	</div>
</div>
