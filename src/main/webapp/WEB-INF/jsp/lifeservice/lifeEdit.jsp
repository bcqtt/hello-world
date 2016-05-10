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
	<form method="post" action="life/saveLifeService?editType=${editType}&resKey=${resKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<fieldset>
				<legend>生活服务信息</legend>
				<dl class="nowrap">
					<dt>名称：</dt>
					<dd><input name="siteName" class="required" type="text" size="40"style="width:220px;" value="${life.siteName}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>排序号：</dt>
					<dd><input name="sortId" class="required" type="text" size="40" style="width:220px;" value="${life.sortId}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>URL：</dt>
					<dd><input name="siteUrl" class="required" type="text" size="40" style="width:220px;" value="${life.siteUrl}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>图片链接：</dt>
					<dd>
						<input name="iconUrl" class="required url" type="text" size="36" style="width:200px;" value="${life.iconUrl}" onchange="showIcon(this);"/>
						<img id="urlLogo" src="${life.iconUrl eq null || life.iconUrl eq ''?'framework/images/icon_pic.png':life.iconUrl}" width="25" height="25">
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>是否显示：</dt>
					<dd><input name="showEnable" type="checkbox" value="${life.showEnable}" onchange="RoleUtils.onClickOfEnable(this);" <c:if test="${life.showEnable == 1}">checked="checked"</c:if> />显示</dd>
				</dl>
				<dl class="nowrap">
					<dt>广告语：</dt>
					<dd><textarea name="siteDes" cols="33" rows="3" style="width:220px;">${life.siteDes}</textarea></dd>
				</dl>
			</fieldset>
			<input type="hidden" name="id" value="${life.id}" />
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

