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
$("#dataStatusBtn").click(function(){
	var url = $(this).attr("url");
	$("select[name='dicId']").val(-1);
	$("#pagerForm").attr("action",url);
	$("#pagerForm").submit();
});
</script>

<div class="pageHeader">
	<form id="pagerForm"  onsubmit="return navTabSearch(this);" action="${resAction}" method="get">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					<label>选择机型：</label>
					<select name="dicId" class="combox" >
						<option value="-1" >选择机型..</option>
						<c:forEach var="ml" items="${mechineList}">
						   <option value="${ml.id}" <c:if test="${ml.id==siteParam.dicId}">selected</c:if> >${ml.dicValue}</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<label>选择网址类型：</label>
					<select id="selectType" name="type" class="combox" onchange="selectByType(this);" >
						<option value="-1" <c:if test="${siteParam.type == -1}">selected="selected"</c:if>>全部</option>
						<option value="0" <c:if test="${siteParam.type == 0}">selected="selected"</c:if>>常规网址</option>
						<option value="1" <c:if test="${siteParam.type == 1}">selected="selected"</c:if>>桌面widget网址</option>
					</select>
				</td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
				<td><a id="dataStatusBtn" class="button" url="${resAction}&numPerPage=${page.numPerPage}&dataStatus=old"><span>只看旧版网址</span></a></td>
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
	<table class="table" style="width:100%;" layoutH="110">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th align="center" width="80" >名称</th>
				<th align="center" width="80" >Logo</th>
				<th align="center" width="50">排序号</th>
				<th align="center" width="50">显示</th>
				<th align="center" width="80">类型</th>
				<th align="center" width="80">机型</th>
				<th width="280">URL</th>
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
   				<td>
   					${site.mechineType.dicValue}
   					<c:if test="${site.dicId == -1}">-</c:if>
   				</td>
				<td style="word-break: break-all;"><a href="${site.siteUrl}" target="_blank">${site.siteUrl}</td>
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
