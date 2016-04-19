<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="resources/saveResources?editType=add" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<fieldset>
				<dl class="nowrap">
					<dt>键名：</dt>
					<dd><input name="resKey" class="required" type="text" size="30" value="" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>资源名：</dt>
					<dd><input name="name" class="required" type="text" size="30" value="" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>访问URL：</dt>
					<dd><input name="resUrl" class="required" type="text" size="30" value="" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>资源描述：</dt>
					<dd><textarea name="description" cols="70" rows="2"/></dd>
				</dl>
			</fieldset>
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

