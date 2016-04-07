<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>

<div class="pageContent">
	<form method="post" action="role/saveRole?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<fieldset>
				<input name="roleKey" class="required" type="hidden" size="30" readonly="readonly" value="ROLE_ADMIN" />
				<dl class="nowrap">
					<dt>分组名：</dt>
					<dd><input name="roleName" class="required" type="text" size="30" value="${role.roleName}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>是否启用：</dt>
					<dd>
						<label><input name="enable" type="checkbox" value="${role.enable}" onclick="RoleUtils.onClickOfEnable(this);" <c:if test="${role.enable == 1}">checked="checked"</c:if> />启用</label>
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>分组描述：</dt>
					<dd><textarea name="description" cols="70" rows="2" >${role.description}</textarea></dd>
				</dl>
			</fieldset>
			<input type="hidden" name="id" value="${role.id}" />
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

