<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<div class="pageContent">
	<form method="post" action="dic/saveDic?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>选择字典类型：</label>
				<select id="selectCls" name="classify.id" class="combox" >
					<c:forEach var="cls" items="${clslist}">
						<option value="${cls.id}" <c:if test="${cls.id == dic.clsId}">selected="selected"</c:if>>${cls.name}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>字典值：</label>
				<input name="dicValue" class="required" type="text" size="30" style="width:230px" value="${dic.dicValue}"/>
			</p>
			<input type="hidden" name="id" value="${dic.id}" />
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

