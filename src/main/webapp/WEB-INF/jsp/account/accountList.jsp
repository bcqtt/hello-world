<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<debug />
<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%--
			<li><a class="add" href="account/addAccountView?editType=add" target="dialog"><span>添加</span></a></li>
			<li><a class="edit" href="account/editAccountView?editType=update&id={id_account}" target="dialog" warn="请选择一个用户!"><span>修改</span></a></li>
			<!-- <li><a class="edit" href="account/assignRole?id={id_account}" target="dialog" warn="请选择一个用户" width="600" height="400"><span>分配角色</span></a></li> -->
			<li><a class="delete" href="account/deleteAccounts?id={id_account}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
			 --%>
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
		</ul>
	</div>
	<table class="table" width="1200" layoutH="75">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>账号名</th>
				<th>姓名</th>
				<th>电话号码</th>
				<th>电子邮件</th>
				<th align="center" >所在组</th>
				<th align="center">最后登录时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="account" items="${page.list}">
			   <tr target="id_account" rel="${account.id}">
				<td><input name="ids" value="${account.id}" type="checkbox"></td>
				<td>${account.accountName}</td>
				<td> ${account.name} </td>
				<td>${account.phoneNumber}</td>
				<td>${account.email}</td>
				<td>${account.role.roleName}</td>
				<td><fmt:formatDate value="${account.lastLoginTime}" type="both" /></td>
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
