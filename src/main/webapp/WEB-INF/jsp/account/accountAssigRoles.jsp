<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<script type="text/javascript">
var accountId="${accountId}";
var roleId = "";
function saveAccountRole(){
	roleId = $("input[type=radio]:checked").val();
}
function rowClick(rowObj){
	var oldObj = rowObj;
	if(oldObj!=null){
		$(oldObj).removeAttr("checked");
	}
	roleId = $(rowObj).attr("rel");
	$(rowObj).find("input").attr("checked","checked");
}
function saveAccountRole(){
	ajaxTodo("accountRole/saveAccountRole?accountId=" + accountId + "&roleId="+roleId,
			PublicUtils.ajaxTodoCallback());
}


</script>
<div class="pageContent">
	<table class="table" width="100%" layoutH="55">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>角色名</th>
				<th>角色描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="role" items="${roleList}">
			   <tr target="id_role" rel="${role.id}" onclick="rowClick(this);">
				<td><input name="ids" value="${role.id}" type="radio"></td>
				<td>${role.name}</td>
				<td>${role.description}</td>
			  </tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button id="saveBtn" onclick="saveAccountRole();" type="button">保存</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
</div>

