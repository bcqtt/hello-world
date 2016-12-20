<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="dic/saveDicClassify?editType=${editType}&resKey=dic_cls_manage_dialog" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDoneFather);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>字典类型名：</label>
				<input name="name" class="required" type="text" size="30" style="width:230px" value="${classify.name}" />
			</p>
			<p>
				<label>引用键：</label>
				<input name="dicKey" class="required" type="text" size="30" style="width:230px" value="${classify.dicKey}"/>
			</p>
			<input type="hidden" name="id" value="${classify.id}" />
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

