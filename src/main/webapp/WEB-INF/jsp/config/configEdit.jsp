<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>

<div class="pageContent">
	<form method="post" action="config/saveConfig?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>参数代码：</label>
				<input name="code" class="required" type="text" size="40" value="${config.code}" />
			</p>
			<p>
				<label>参数名：</label>
				<input name="name" class="required" type="text" size="40" value="${config.name}" />
			</p>
			<p>
				<label>参数值：</label>
				<input name="value" class="required" type="text" size="40" value="${config.value}" />
			</p>
			<p>
				<label>是否启用：</label>
				<label><input name="status" type="checkbox" value="${config.status}" onchange="RoleUtils.onClickOfEnable(this);" <c:if test="${config.status == 1}">checked="checked"</c:if> />启用</label>
			</p>
			<p>
				<table><tr>
					<td align="left" valign="top"><label>参数说明：</label></td>
					<td><textarea name="description" cols="33" rows="2">${config.description}</textarea></td>
				</tr></table>
			</p>
			<input type="hidden" name="id" value="${config.id}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

