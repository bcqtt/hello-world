<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript" />

<div class="pageContent">
	<form method="post" action="adKeyword/saveAdKeyword?editType=${editType}&resKey=ad_keyword_manage" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDoneFather)">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>关键字：</label>
				<input name="keyword" class="required" type="text" size="44" style="width:230px;" value="${key.keyword}" />
			</p>
			
			<input type="hidden" name="id" value="${key.id}" />
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

