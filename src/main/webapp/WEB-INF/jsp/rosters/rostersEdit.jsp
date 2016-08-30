<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="rosters/saveRosters?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>用户类型：</label>
				<input name="usertype" class="required" type="text" size="44" style="width:230px;" value="${rosters.usertype}" />
			</p>
			<p>
				<label>包名：</label>
				<input name="packagename" class="required" type="text" size="44" style="width:230px;" value="${rosters.packagename}" />
			</p>
			<p>
				<label>状态：</label>
				<input name="status" type="text" size="44" style="width:230px;" value="${rosters.status}" />
			</p>
			<input type="hidden" name="id" value="${rosters.id}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

