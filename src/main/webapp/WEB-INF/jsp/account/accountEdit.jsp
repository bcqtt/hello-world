<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageContent">
	<form method="post" action="account/saveAccount?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>账号名：</label>
				<input name="accountName" class="required" type="text" size="30" style="width:230px" value="${account.accountName}" />
			</p>
			<p>
				<label>姓名：</label>
				<input name="name" class="required" type="text" size="30" style="width:230px" value="${account.name}" />
			</p>
			<p>
				<label>密码：</label>
				<input name="password" class="required" type="password" size="30" style="width:230px" value="${account.password}" />
			</p>
			<p>
				<label>电话号码：</label>
				<input name="phoneNumber" type="text" size="30" style="width:230px" value="${account.phoneNumber}"/>
			</p>
			<p>
				<label>电子邮件：</label>
				<input name="email" type="text" size="30" style="width:230px" value="${account.email}"/>
			</p>
			<p>
				<label>${account.groupId }分组：</label>
				<select value="" name="groupId" class="combox">
					<option value="">请选择...</option>
					<c:forEach var="role" items="${roleList}">
						<option value="${role.id}" <c:if test="${account.groupId == role.id}">selected="selected"</c:if>>${role.roleName}</option>
					</c:forEach>
					<script>
				        $("select[name='groupId']").change(function(){
				        	$("select[name='groupId']").val($(this).val());
				        });
				    </script>
				</select>
			</p>
			<input type="hidden" name="id" value="${account.id}" />
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

