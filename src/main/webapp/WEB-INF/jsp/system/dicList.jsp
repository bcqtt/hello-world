<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/authority.js" type="text/javascript"></script>

<script type="text/javascript">
function selectByType(obj){
	$("#dicType").val($(obj).val());
}
</script>

<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="clsId" value="${type}" id="dicType"/>
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${resAction}&numPerPage=${page.numPerPage}" method="get">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					选择字典类型：
				</td>
				<td>
					<select id="selectDicType" name="clsId" class="combox" onchange="selectByType(this);" >
						<option value="-1">全部</option>
						<c:forEach var="type" items="${dicTypeList}">
							<option value="${type.id}" <c:if test="${type.id == clsId}">selected="selected"</c:if>>${type.name}</option>
						</c:forEach>
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
			<li><a class="add" href="dic/addDicView?editType=add" target="dialog" rel="dic_add_dialog"><span>添加</span></a></li>
			<li><a class="edit" href="dic/editDicView?editType=update&id={id_dic}" target="dialog" rel="dic_edit_dialog" warn="请选择一个记录!"><span>修改</span></a></li>
			<li><a class="delete" href="dic/deleteDic?id={id_dic}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
			<li><a class="edit" href="dic/queryDicClassifyPaper" target="dialog" width="710" height="450" rel="dic_cls_manage_dialog"><span>字典类型管理</span></a></li>
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
				<th>字典类型</th>
				<th>字典引用键</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dic" items="${page.list}">
			   <tr target="id_dic" rel="${dic.id}">
				<td><input name="ids" value="${dic.id}" type="checkbox"></td>
				<td>${dic.classify.name}</td>
				<td>${dic.dicValue}</td>
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
		
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="20" currentPage="${page.currentPage}"></div>

	</div>
</div>
