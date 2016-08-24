<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="hk/saveHotKey?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>热词：</label>
				<input name="hotKey" class="required" type="text" size="44" style="width:230px;" value="${hk.hotKey}" />
			</p>
			<p>
				<label>排序号：</label>
				<input name="sortId" class="required digits" type="text" size="44" style="width:230px;" value="${hk.sortId}" />
			</p>
			<p>
				<label>链接：</label>
				<input name="url" class="required" type="text" size="44" style="width:230px;" value="${hk.url}" />
			</p>
			<dl class="nowrap">
				<dt>状态：</dt>
				<dd>
					<label><input id="model" type="radio" readonly="readonly" name="stats" value="1" ${hk.type == 1?"checked":""}/>NEW</label>
					<label><input id="menu" type="radio" readonly="readonly" name="stats" value="0" ${hk.type == 0?"checked":""}/>NOT NEW</label>
				</dd>
			</dl>
			<input type="hidden" name="id" value="${hk.id}" />
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

