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
	ajaxTodo("version/updateVersion?id="+adId+"&resKey=${resKey}&showFlag=" + showFlag
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
			<li><a class="add" href="version/addVersionView?editType=add" target="dialog" width="720" height="340"><span>添加</span></a></li>
			<li><a class="edit" href="version/editVersionView?editType=update&id={id_v}" target="dialog" warn="请选择一个热词记录!" width="720" height="340"><span>修改</span></a></li>
			<li><a class="delete" href="version/deleteVersion?id={id_v}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
				<th align="center" >用户类型</th>
				<th align="center" >版本号</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="v" items="${page.list}">
			   <tr target="id_v" rel="${v.id}">
				<td><input name="ids" value="${v.id}" type="checkbox"></td>
				<td>${v.usertype}</td>
				<td>${v.version}</td>
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
