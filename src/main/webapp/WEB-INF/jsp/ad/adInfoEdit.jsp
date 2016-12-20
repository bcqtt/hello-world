<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<script type="text/javascript">
var editType = '${editType}';
var startTime = '<fmt:formatDate value="${ai.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />'
var endTime = '<fmt:formatDate value="${ai.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />'
</script>
<script src="js/jquery.form.js" type="text/javascript"></script>
<script src="js/adInfo.js" type="text/javascript"></script>

<style type="text/css">
.attr-label{
	width: 95px;
	font-weight: bold;
	color: #CC6633;
}
.tagLabel{
	padding: 5px;
	float:left;
	height:16px;
	line-height:16px;
	background-color: #CC6633;
	color: #ffffff;
	border: 1px solid #ffffff;
	border-radius: 8px;
}
</style>

<h2 class="contentTitle">编辑广告信息</h2>
<div class="pageFormContent" layoutH="60" style="border-color: #BFDEE6;">
	<form id="adInfoForm" enctype="multipart/form-data" method="post" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<fieldset>
			<legend>广告属性</legend>
			<table id="form-table">
				<tr>
					<td width="650" height="50"><label class="attr-label">CP名称：</label>
						<input name="cpName" type="text" style="width:330px;" value="${ai.cpName}" />
					</td>
					<td>
						<label class="attr-label">广告标题：</label><input name="adTittle" type="text"  style="width:330px;" value="${ai.adTittle}" />
						<label style="width:60px;"><input name="showTittleFlag" type="checkbox" value="${ai.showTittleFlag}" onchange="checkShowFlag(this);" <c:if test="${ai.showTittleFlag == 1}">checked="checked"</c:if> />显示</label>
					</td>
				</tr>
				<tr>
					<td width="650" height="50" colspan="2"><label class="attr-label">广告规格：</label>
						<c:forEach var="spec" items="${dicMap.ad_specification}">
							<label style="width: auto;"><input type="radio" name="specification" value="${spec.id}" <c:if test="${ai.specification == spec.id}">checked="checked"</c:if>/>${spec.dicValue}</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td width="650" height="50"><label class="attr-label">广告图片：</label>
						<input name="adImage" type="file" style="background-color:#CCFF99" />
						
						<!-- <br/>
						<img id="ad_img" style="width:80px;height:80px;margin-left:130px;margin-top:10px;" src="framework/images/camera.png"/>
						 -->
					</td>
					<td width="650" height="50" colspan="2"><label class="attr-label">广告分类：</label>
						<select id="selectClassify" name="adClassifyId" class="combox" onchange="" >
							<c:forEach var="c" items="${classifyList}">
								<option value="${c.cid}" <c:if test="${c.cid == ai.adClassifyId}">selected="selected"</c:if> >${c.cname}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td width="650" height="50" colspan="2"><label class="attr-label">广告行为：</label>
						<c:forEach var="b" items="${behaviorList}">
							<label class="new-label">
							<input type="radio" name="adBehaviorId" value="${b.id}" 
								<c:if test="${b.id== abt.adBehaviorId}">todoUrl="${abt.url}" todoApp="${abt.appName}"</c:if> 
								<c:if test="${b.id== ai.adBehaviorId}">checked="checked"</c:if> 
								<c:if test="${b.isDownloadApp==1}">downloadApp="${b.isDownloadApp==1}"</c:if> />${b.behavior}</label>
						</c:forEach>
					</td>
				</tr>
				<tr id="webAddress" style="display:none;background-color:#CCFF99" >
					<td width="650" height="50" colspan="2"><label class="attr-label">URL：</label>
						
					</td>
				</tr>
				<tr id="downAddress" style="display:none; background-color:#CCFF99"">
					<td width="650" height="50"><label class="attr-label">下载地址：</label>
						
					</td>
					<td style="width:650px;"><label class="attr-label">应用名称：</label>
						
					</td>
				</tr>
				<tr>
					<td width="650" height="50">
						<label class="attr-label">开始-结束时间：</label>
						<input type="text" style="width:120px;background-color: #ffffff;" value="" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="startTime" value="">
						<label style="width: auto;">--</label>
						<input type="text" style="width:120px;background-color: #ffffff;" value="" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="endTime" value="">
						<span class="info">开始时间&nbsp;&lt;&nbsp;结束时间</span>
					</td>
					<td>
						<label class="attr-label">权重值：</label>
						<input name="weight" type="text"   value="${ai.weight}"/>
					</td>
				</tr>
				<tr>
					<td width="650" height="50" colspan="2">
						<label class="attr-label">关键字设置：</label>
						<label class="new-label"><input type="radio" name="keywordSetting" value="0" <c:if test="${ai.keywordSetting==0}">checked="checked"</c:if> />不限</label>
						<label class="new-label"><input type="radio" name="keywordSetting" value="1" <c:if test="${ai.keywordSetting==1}">checked="checked"</c:if>/>自定义</label>
						<a id="keywordWinBtn" class="button" href="adKeyword/selectKeywordView?editType=${editType}&keywordIds=${ai.keyword}" target="dialog" rel="toKeywordView" resizable="false" maxable="false" mask="true" width="700" height="450" style="display:none;"><span>选择关键字</span></a>
						<br/><br/><br/>
						<input name="keyword" type="hidden"   value="${ai.keyword}"/>
						<select id="keywordArea" name="keywordArea" multiple="multiple" style="width:330px;margin-left:130px;display:none;" >
							<c:forEach var="key" items="${keywordList}">
								<option value="${key.id}-${key.keyword}" >${key.keyword}</option>
							</c:forEach>
						</select>
					</td>
					
				</tr>
				
				<tr>
					<td width="650" height="50">
						<label class="attr-label">计费方式：</label>
						<select id="selectBillingType" name="billingType" class="combox" onchange="" >
							<c:forEach var="bill" items="${dicMap.billing_type}">
								<option value="${bill.id}" <c:if test="${bill.id==ai.billingType}">selected="selected"</c:if> >${bill.dicValue}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label class="attr-label">计费单价：</label>
						<input name="unitPrice" type="text" class="number" value="${ai.unitPrice}"/>
						<span class="info">小数，如:1.0、0.83</span>
					</td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>投放定向</legend>
			<table>
				<tr>
					<td width="650" height="50">
						<label class="attr-label">版本：</label>
						<div id="selectedVersionDiv">
							<c:forEach var="v" items="${dicmap.version}">
								<div class="tagLabel" optid="${v.dicValue}">${v.dicValue}</div>
							</c:forEach>
						</div>
						<input name="version" type="hidden" value="${ai.version}"/>
						<a id="versionWinBtn" class="button" href="adinfo/selectWindow?dickey=version" target="dialog" rel="toVersionView" resizable="false" maxable="false" mask="true" width="700" height="450" ><span>选择..</span></a>
					</td>
					<td width="650" height="50">
						<label class="attr-label">机型：</label>
						<div id="selectedMechineDiv">
							<c:forEach var="m" items="${dicmap.mechineType}">
								<div class="tagLabel" optid="${m.dicValue}">${m.dicValue}</div>
							</c:forEach>
						</div>
						<input name="mechineType" type="hidden" value="${ai.mechineType}"/>
						<a id="mechineWinBtn" class="button" href="adinfo/selectWindow?dickey=mechineType" target="dialog" rel="toVersionView" resizable="false" maxable="false" mask="true" width="700" height="450" ><span>选择..</span></a>
					</td>
				</tr>
				<!-- 
				<td width="650" height="50" colspan="2">
					<label class="attr-label">地域：</label>
					<input name="adTittle" type="text" disabled="disabled" value="暂不支持"/>
				</td>
				 -->
			</table>
		</fieldset>
		
		<fieldset>
			<legend>广告信息</legend>
			<table>
				<tr><td colspan="2" style="font-weight:bold;">确认广告信息</td></tr>
				<tr>
					<td width="120" height="30">广告标题：</td width="30%"><td><div id="preview_adtittle"></div></td>
					<td colspan="2" rowspan="9" width="30%">
						<c:if test="${ai.adImagePath != null}">
							<a href="<%=path %>/${ai.adImagePath}"><img src="<%=path %>/${ai.adImagePath}" style="width:300px;float:right;margin-right:80px;"/></a>
						</c:if>
					</td>
				</tr>
				<tr><td width="120" height="30">CP名称：</td><td><div id="preview_cpname"></div></td></tr>
				<tr><td width="120" height="30">投放日期：</td><td><div id="preview_starttime"></div>-<div id="preview_endtime"></div></td></tr>
				<tr><td width="120" height="30">出价：</td><td><div id="preview_price"></div></td></tr>
				<tr><td colspan="2" style="font-weight:bold;">确认其它定向条件</td></tr>
				<tr><td width="120" height="30">投放版本：</td><td><div id="preview_version"></div></td></tr>
				<tr><td width="120" height="30">投放机型：</td><td><div id="preview_mechine"></div></td></tr>
			</table>
		</fieldset>
		<input type="hidden" name="id" value="${ai.id}" />
		<input type="hidden" name="adRuleId" value="<c:if test="${ai.adRuleId==null}">${adRuleId}</c:if><c:if test="${ai.adRuleId!=null}">${ai.adRuleId}</c:if>" />
		<input type="hidden" name="adImagePath" value="${ai.adImagePath}" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="formBar" style="text-align:center;">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button id="adInfoSubmitBtn">提交广告</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

