<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<style type="text/css">
.iconUrl{
	width:50px;
	height:50px;
	margin: 5px;
}
</style>
<script type="text/javascript">
function checkShowEnabled(obj){
	if($(obj).is(':checked')){
		$(obj).val(1);
	}else{
		$(obj).val(0);
	}
	var showEnabled = $(obj).val();
	var lifeId = $(obj).attr("lifeId");
	ajaxTodo("life/updateLifeService?id="+lifeId+"&resKey=${resKey}&showEnable=" + showEnabled
			,PublicUtils.ajaxTodoCallback());
}
</script>

<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%-- 
			<li><a class="add" href="life/addLifeServiceView?editType=add&resKey=${resKey}" target="dialog" width="445" height="330"><span>添加参数</span></a></li>
			<li><a class="edit" href="life/editLifeServiceView?editType=update&id={id_life}&resKey=${resKey}" target="dialog" warn="请选择一个分组!" width="445" height="330"><span>修改</span></a></li>
			<li><a class="delete" href="life/deleteLifeServices?id={id_life}&resKey=${resKey}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
				<th align="center" width="40"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>名称</th>
				<th align="center">图片</th>
				<th align="center">排序号</th>
				<th align="center">显示</th>
				<th style="word-break: break-all;">URL</th>
				<th>广告语</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="life" items="${page.list}">
			   <tr target="id_life" rel="${life.id}">
				<td><input name="ids" value="${life.id}" type="checkbox"></td>
				<td>${life.siteName}</td>
				<td><img class="iconUrl" src="${life.iconUrl}"></td>
				<td>${life.sortId}</td>
				<td>
					<input type="checkbox" value="${life.showEnable}" lifeId="${life.id}" <c:if test="${life.showEnable == 1}">checked="checked"</c:if> onchange="checkShowEnabled(this);"/>
				</td>
				<td>${life.siteUrl}</td>
				<td>${life.siteDes}</td>
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
