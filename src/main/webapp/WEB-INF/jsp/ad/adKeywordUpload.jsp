<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script src="js/jquery.form.js" type="text/javascript"></script>

<div class="pageContent">
	<form id="adKeywordForm" enctype="multipart/form-data" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDoneFather)">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>TXT文件：</label>
				<input name="txtFile" class="required" type="file" />
			</p>
			<br/><br/><br/>
			<div style="color:#7F7F7F;margin-left: 130px; margin-top: 15px;;width: 355px;">
				注意：txt文件中的内容需为一行一词，多个词在一行的视为一个词处理。英文不区分大小写，
				关键字在库中是唯一的，若全匹配到已存在的关键字会被过滤掉。
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="adKeywordSubmitBtn">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	//异步提交上传关键字表单
	$("#adKeywordSubmitBtn").click(function(){
		var url = "adKeyword/uploadAdKeyword?editType=${editType}&resKey=ad_keyword_manage";
		//有选择文件时采用带文件的form提交方式
		$('#adKeywordForm').ajaxSubmit({
			type: "POST",
			dataType: "json",
			url: url,
			success: function (data) {
				dialogAjaxDoneFather(data)
			},
			error: DWZ.ajaxError
		});
		
		return false;
	});
	
});
</script>

