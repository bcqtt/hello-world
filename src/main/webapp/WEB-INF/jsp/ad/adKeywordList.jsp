<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="pagerForm" method="GET" action="adKeyword/queryAdKeywordPaper">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="adKeyword/uploadAdKeywordView?editType=upload" target="dialog" rel="ad_kw_upload" resizable="false" maxable="false" mask="true"><span>上传</span></a></li>
			<li><a class="add" href="adKeyword/addAdKeywordView?editType=add" target="dialog" rel="ad_kw_add"><span>添加</span></a></li>
			<li><a class="edit" href="adKeyword//editAdKeywordView?editType=update&id={id_k}" target="dialog" rel="ad_kw_edit" warn="请选择一个记录!"><span>修改</span></a></li>
			<li><a class="delete" href="adKeyword/deleteAdKeyword?resKey=ad_keyword_manage&id={id_k}" targetType="dialog" target="selectedTodo" callback="dialogAjaxDoneFather" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
	<table class="table" width="430" layoutH="75">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>关键字</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="k" items="${page.list}">
			   <tr target="id_k" rel="${k.id}">
				<td><input name="ids" value="${k.id}" type="checkbox"></td>
				<td>${k.keyword}</td>
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
