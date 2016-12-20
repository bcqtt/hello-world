<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<style type="text/css">
.adImg{
	width:150px;
	height:70px;
}
</style>
<script type="text/javascript">
function checkShowEnabled(obj){
	if($(obj).is(':checked')){
		$(obj).val(1);
	}else{
		$(obj).val(0);
	}
	var showFlag = $(obj).val();
	var adId = $(obj).attr("adId");
	ajaxTodo("ad/updateAd?id="+adId+"&resKey=${resKey}&showFlag=" + showFlag
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
			<li><a class="add" href="ad/addAdView?editType=add" target="dialog" width="460" height="370"><span>添加广告</span></a></li>
			<li><a class="edit" href="ad/editAdView?editType=update&id={id_ad}" target="dialog" warn="请选择一个分组!" width="460" height="370"><span>修改</span></a></li>
			<li><a class="delete" href="ad/deleteAds?id={id_ad}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
				<!-- <th align="center">ID</th> -->
				<th align="center">名称</th>
				<th align="center">广告位</th>
				<th align="center">广告图</th>
				<th width="800">URL</th>
				<th align="center">显示</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ad" items="${page.list}">
			   <tr target="id_ad" rel="${ad.id}">
				<td><input name="ids" value="${ad.id}" type="checkbox"></td>
				<!-- <td>${ad.id}</td> -->
				<td>${ad.name}</td>
				<td>${ad.positionId}</td>
				<td><a target="_blank" href="${ad.adUrl}"><img class="adImg" src="<c:if test="${empty ad.adImg}">framework/images/ad_default.png</c:if><c:if test="${!empty ad.adImg}">${ad.adImg}</c:if>"/></a></td>
				<td style="word-break: break-all;">${ad.adUrl}</td>
				<td>
					<input type="checkbox" value="${ad.showFlag}" adId="${ad.id}" <c:if test="${ad.showFlag == 1}">checked="checked"</c:if> onchange="checkShowEnabled(this);"/>
				</td>
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
