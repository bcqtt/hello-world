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
	ajaxTodo("hk/updateHotkey?id="+adId+"&resKey=${resKey}&showFlag=" + showFlag
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
			<li><a class="add" href="hk/addHotkeyView?editType=add" target="dialog" width="720" height="340"><span>添加</span></a></li>
			<li><a class="edit" href="hk/editHotkeyView?editType=update&id={id_hk}" target="dialog" warn="请选择一个热词记录!" width="720" height="340"><span>修改</span></a></li>
			<li><a class="delete" href="hk/deleteHotKeys?id={id_hk}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
				<th align="center" width="200">热词</th>
				<th align="center" width="50">排序</th>
				<th align="center" width="800">链接</th>
				<th align="center">状态</th>
				<th align="center">用处</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="hk" items="${page.list}">
			   <tr target="id_hk" rel="${hk.id}">
				<td><input name="ids" value="${hk.id}" type="checkbox"></td>
				<td>${hk.hotKey}</td>
				<td>${hk.sortId}</td>
				<td style="word-break: break-all;"><a href="${hk.url}" target="_blank">${hk.url}</a></td>
				<td>
					<c:if test="${hk.stats == 1}"><span style="color:red;">NEW</span></c:if>
					<c:if test="${hk.stats == 0}"><span style="color:#777777;">NOT NEW</span></c:if>
				</td>
				<td>
					<c:if test="${hk.type == 1}"><span style="color:#0000FF;">搜索框下</span></c:if>
					<c:if test="${hk.type == 2}"><span style="color:#990066;">大家都在搜</span></c:if>
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
