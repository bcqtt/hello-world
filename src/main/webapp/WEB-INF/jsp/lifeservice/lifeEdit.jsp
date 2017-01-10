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
			<p>
				<label>名称：</label>
				<input name="siteName" class="required" type="text" size="40"style="width:220px;" value="${life.siteName}" />
			</p>
			<p>
				<label>排序号：</label>
				<input name="sortId" class="required" type="text" size="40" style="width:220px;" value="${life.sortId}" />
			</p>
			<p>
				<label>URL：</label>
				<input name="siteUrl" class="required" type="text" size="40" style="width:220px;" value="${life.siteUrl}" />
			</p>
			<p>
				<label>是否显示：</label>
				<label><input name="showEnable" type="checkbox" value="${life.showEnable}" onchange="RoleUtils.onClickOfEnable(this);" <c:if test="${life.showEnable == 1}">checked="checked"</c:if> />显示<label>
			</p>
			<p>
				<label>图标：</label>
				<a id="imagesWinBtn" class="button" href="images/queryImagesPaper?resId=68&type=32&resource=life" target="dialog" rel="toImagesView4Site" resizable="false" maxable="false" mask="true" width="1220" height="660" ><span>选择..</span></a>
				<input name="iconUrl" class="required url" type="hidden" size="30" style="width:200px;" value="${life.iconUrl}" onchange="showIcon(this);"/>
			</p>
			<p class="p-height">
				<label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<img id="lifeIcon" src="${site.iconUrl eq null || site.iconUrl eq ''?'framework/images/logo_default.jpg':site.iconUrl}" width="68" height="68">
			</p>
			<p>
				<label>广告语：</label>
				<textarea name="siteDes" cols="33" rows="3" style="width:220px;">${life.siteDes}</textarea>
			</p>
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

