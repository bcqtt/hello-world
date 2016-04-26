<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<style type="text/css">
.iconUrl{
	width:25px;
	height:25px;
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
	var siteId = $(obj).attr("siteId");
	ajaxTodo("site/updateSite?id="+siteId+"&resKey=${resKey}&showEnable=" + showEnabled
			,PublicUtils.ajaxTodoCallback());
}
function selectByType(obj){
	$("#siteType").val($(obj).val());
}
function updateType(obj){
	var siteId = $(obj).attr("siteId");
	var type = $(obj).val();
	ajaxTodo("site/updateSite?id="+siteId+"&type=" + type
			,PublicUtils.ajaxTodoCallback());
}
</script>

<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="type" value="${type}" id="siteType"/>
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${resAction}&numPerPage=${page.numPerPage}" method="get">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					选择网址类型：
				</td>
				<td>
					<select id="selectType" name="type" class="combox" onchange="selectByType(this);" >
						<option value="-1" <c:if test="${type == -1}">selected="selected"</c:if>>全部</option>
						<option value="0" <c:if test="${type == 0}">selected="selected"</c:if>>常规网址</option>
						<option value="1" <c:if test="${type == 1}">selected="selected"</c:if>>桌面widget网址</option>
					</select>
				</td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
			</tr>
		</table>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<%-- 
			<li><a class="add" href="site/addSiteView?editType=add" target="dialog" width="600" height="280"><span>添加网址</span></a></li>
			<li><a class="edit" href="site/editSiteView?editType=update&id={id_site}" target="dialog" warn="请选择一个记录!" width="600" height="280"><span>修改</span></a></li>
			<li><a class="delete" href="site/deleteSites?id={id_site}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
	<table class="table" width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th align="center">名称</th>
				<th align="center">Logo</th>
				<th align="center">排序号</th>
				<th align="center">显示</th>
				<th align="center">类型</th>
				<th>URL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="site" items="${page.list}">
			   <tr target="id_site" rel="${site.id}">
				<td><input name="ids" value="${site.id}" type="checkbox"></td>
				<td>${site.siteName}</td>
				<td><img class="iconUrl" src="${site.iconUrl}"/></td>
				<td>${site.sortId}</td>
				<td>
					<input type="checkbox" value="${site.showEnable}" siteId="${site.id}" <c:if test="${site.showEnable == 1}">checked="checked"</c:if> onchange="checkShowEnabled(this);"/>
				</td>
				<td>
   					<%--
   					<select name="type" onchange="updateType(this);" siteId="${site.id}">
						<option value="0" <c:if test="${site.type == 0}">selected="selected"</c:if>>常规网址</option>
						<option value="1" <c:if test="${site.type == 1}">selected="selected"</c:if>>桌面widget网址</option>
					</select>
					 --%>
					 <c:if test="${site.type == 0}">常规网址</c:if>
					 <c:if test="${site.type == 1}">桌面widget网址</c:if>
   				</td>
				<td>${site.siteUrl}</td>
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
