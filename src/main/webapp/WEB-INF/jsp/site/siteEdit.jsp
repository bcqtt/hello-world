<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<script type="text/javascript">
function showIcon(obj){
	if($(obj).val()==""){
		$("#urlLogo").attr("src","framework/images/icon_pic.png");
	}else{
		$("#urlLogo").attr("src",$(obj).val());
	}
}
</script>
<div class="pageContent">
	<form method="post" action="site/saveSite?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>网址类型：</label>
				<select name="type" class="combox">
					<option value="0" ${site.type == 0?"selected":"" }>常规网址</option>
					<option value="1" ${site.type == 1?"selected":"" }>桌面widget网址</option>
				</select>
			</p>
			<p>
				<label>名称：</label>
				<input name="siteName" class="required" type="text" size="30" style="width:220px;"; value="${site.siteName}" />
			</p>
			<p>
				<label>排序号：</label>
				<input name="sortId" class="digits" type="text" size="30" style="width:220px;" value="${site.sortId}" />
			</p>
			<p>
				<label>URL：</label>
				<input name="siteUrl" class="required url" type="text" size="30" style="width:220px;" value="${site.siteUrl}" />
			</p>
			<p>
				<label>Logo图片链接：</label>
				<input name="iconUrl" class="required url" type="text" size="30" style="width:200px;" value="${site.iconUrl}" onchange="showIcon(this);"/>
				<img id="urlLogo" src="${site.iconUrl eq null || site.iconUrl eq ''?'framework/images/icon_pic.png':site.iconUrl}" width="25" height="25">
			</p>
			<p>
				<label>是否显示：</label>
				<label><input name="showEnable" type="checkbox" value="${site.showEnable}" onclick="RoleUtils.onClickOfEnable(this);" <c:if test="${site.showEnable == 1}">checked="checked"</c:if> />显示在首页</label>
			</p>
			<input type="hidden" name="id" value="${site.id}" />
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

