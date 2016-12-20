<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/authority.js" type="text/javascript"></script>

<form id="pagerForm" method="GET" action="adRule/queryAdRulePaper">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="adRule/addAdRuleView?editType=add&resKey=ad_rule_manage" target="dialog" rel="ad_rule_add"><span>添加</span></a></li>
			<li><a class="edit" href="adRule/editAdRuleView?editType=update&resKey=ad_rule_manage&id={id_adr}" target="dialog" rel="ad_rule_edit" warn="请选择一个记录!"><span>修改</span></a></li>
			<li><a class="delete" href="adRule/deleteAdRule?resKey=ad_rule_manage&id={id_adr}" targetType="dialog" target="selectedTodo" callback="dialogAjaxDoneFather" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
	<table class="table" width="465" layoutH="75">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>广告位</th>
				<th>广告形式</th>
				<th align="center">有效权重范围</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="adr" items="${page.list}">
			   <tr target="id_adr" rel="${adr.id}">
				<td><input name="ids" value="${adr.id}" type="checkbox"></td>
				<td>${adr.adPosition}</td>
				<td>${adr.adTypeObj.dicValue}</td>
				<td>${adr.minWeight} - ${adr.maxWeight} </td>
			  </tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="dialogPageBreak({numPerPage:this.value})">
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
		
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="5" currentPage="${page.currentPage}"></div>

	</div>
</div>
