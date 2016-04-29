<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/authority.js" ></script>
<div class="pageContent">
	<form method="post" action="search/saveHotkeySource?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>Code：</label>
				<input name="sourceCode" class="required" type="text" size="44" style="width:230px;" value="${source.sourceCode}" />
			</p>
			<p>
				<label>名称：</label>
				<input name="sourceName" class="required" type="text" size="44" style="width:230px;" value="${source.sourceName}" />
			</p>
			<p>
				<label>URL：</label>
				<input name="url" class="required" type="text" size="44" style="width:230px;" value="${source.url}" />
			</p>
			
			<input type="hidden" name="id" value="${source.id}" />
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

