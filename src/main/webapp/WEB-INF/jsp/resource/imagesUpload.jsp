<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery.form.js" type="text/javascript"></script>

<script type="text/javascript">
$("#uploadBtn").click(function(){
	//有选择文件时采用带文件的form提交方式
	$('#uploadForm').ajaxSubmit({
		type: "POST",
		dataType: "json",
		url: "images/saveImages?editType=${editType}&resKey=${resKey}",
		success: function (data) {
			DWZ.ajaxDone(data);
			divSearch($("#pagerForm"), "${resKey}");
		},
		error: DWZ.ajaxError
	});
	
	return false;
});
</script>

<div class="pageContent">
	<form id="uploadForm" method="post" enctype="multipart/form-data" class="pageForm required-validate">
		<div class="pageFormContent" layoutH="56">
			
			<label>选择图片类型：</label>
			<select name="type" class="combox" >
				<c:forEach var="type" items="${typeList}">
				   <option value="${type.id}" >${type.dicValue}</option>
				</c:forEach>
			</select>
			
			<div class="unit">
				<label>可上传多个文件：</label>
				<ul id="upload-preview" class="upload-preview"></ul>
				<div class="upload-wrap" rel="#upload-preview">
					<input type="file" name="images" accept="image/*" multiple="multiple">
				</div>
			</div>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="uploadBtn">上传</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

