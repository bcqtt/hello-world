<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery.form.js" type="text/javascript"></script>

<style type="text/css">
.pageFormContent p {
    float: left;
    display: block;
    width: 100%;
    height: 21px;
    margin-top: 10px;
    padding: 5px 0;
    position: relative;
    text-align:center;
}
.pageFormContent p input,textarea {
	width:80%;
}
</style>

<div class="pageContent">
	<form method="post" action="images/saveImagesInfo?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<div style="width:100%; text-align:center;">
				<a href="${img.imgPath}" title="点我看原图" target="_blank"><img style="min-height:120px; max-width:300px;" src="${img.imgPath}" /></a>
			</div>
			<div style="width:100%; text-align:center;">
				<p>
					<label>标题：</label>
					<input name="title" type="text" value="${img.title}" />
				</p>
				<p>
					<label>类型：</label>
					<select name="type">
						<c:forEach var="t" items="${typeList}">
						   <option value="${t.id}" <c:if test="${t.id==img.type}">selected</c:if> >${t.dicValue}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label>描述：</label>
					<textarea name="description" rows="5" >${img.description}</textarea>
				</p>
			</div>
			
			<input type="hidden" name="id" value="${img.id}" />
			<input type="hidden" name="type" value="${img.type}" />
			<input type="hidden" name="imgPath" value="${img.imgPath}" />
			<input type="hidden" name="isRef" value="${img.isRef}" />
			<input type="hidden" name="isRef" value="${img.uploadDate}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="uploadBtn">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

