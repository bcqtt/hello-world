<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="card/saveCard?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>名称：</label>
				<input name="name" class="required" type="text" size="30" style="width:230px" value="${card.name}" />
			</p>
			<p>
				<label>排序号：</label>
				<input name="orderId" class="digits" type="text" size="30" style="width:230px" value="${card.orderId}"/>
			</p>
			<p>
				<label>是否显示在首页：</label>
				<label><input name="showEnable" type="checkbox" value="${card.showEnable}" onclick="RoleUtils.onClickOfEnable(this);" <c:if test="${card.showEnable == 1}">checked="checked"</c:if> />显示在首页</label>
			</p>
			<input type="hidden" name="id" value="${card.id}" />
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

