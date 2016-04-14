<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>

<script type="text/javascript">
 function doChange(){
	var sourceCode = $("#sourceCode").val();
	ajaxTodo("search/doChange?sourceCode=" + sourceCode
			,PublicUtils.ajaxTodoCallback());
}
 </script>
<div class="pageHeader">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					 请选择数据采集源：
				</td>
				<td>
					<select id="sourceCode" name="sourceCode"  >
						<c:forEach var="source" items="${dataSourceList}">
							<option value="${source.sourceCode}" <c:if test="${source.enableStatus == 1}">selected="selected"</c:if>>${source.sourceName}</option>
						</c:forEach>
					</select>
				</td>
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit" onclick="doChange();">提交</button></div></div></td>
			</tr>
		</table>
	</div>
</div>
