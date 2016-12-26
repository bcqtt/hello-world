<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<style type="text/css">
	.tdtype{
		height:35px;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#submitBtn").click(function(){
		
		//判断选择项是否配对
		if($("#appVersionId").val()==-1){
			alertMsg.warn('要选择版本。');
			return false;
		}
		var checkboxVal = $("input[type=checkbox]:checked");
		if(checkboxVal.length==0){
			alertMsg.warn('要选择入口，以及对应的跳转页面。');
			return false;
		}
		
		var checkFlag = true;
		
		for(var i=0;i<checkboxVal.length;i++){
			var objVal = $(checkboxVal[i]).val();
			var targetName = objVal + "-dicId";
			var radioCheck = $("input[name="+targetName+"]:checked");
			if(radioCheck.length==0){
				var checkLabel = $(checkboxVal[i]).parent().text();
				alertMsg.warn("【 " + checkLabel + '】 需要选择跳转页面。');
				checkFlag = false;
				break;
			}
		}
		
		if(!checkFlag){
			return false;
		}
		
		var appVersionId = $("#appVersionId").val();
		var entrancesIds = [];
		var targetIds = [];
		$('input[name=appEntranceId]:checked').each(function(){    
			entrancesIds.push($(this).val());
		 });    
		$('input[type=radio]:checked').each(function(){    
			targetIds.push($(this).val());
		 });  
		
		var url = "appEntrance/saveAppVersionEntrance?editType=${editType}&resKey=${resKey}";
		//有选择文件时采用带文件的form提交方式
		$.ajax({
			url: url,
			dataType:'json',
			type: "POST",
			data:{
				appVersionId: appVersionId,
				entrancesIds: entrancesIds,
				targetIds: targetIds
			},
			//timeout:10000,
			success:function(data,textStatus,jqXHR){
				DWZ.ajaxDone(data);
				dialogAjaxDoneFather(data);
		    },
		    error:function(xhr,textStatus){
		    }
		});
		
		return false;
	});
	
	$("#resetBtn").click(function(){
		$(':input', $("#versionEntranceConfigForm")).each(function() {
		    var type = this.type;
		    var tag = this.tagName.toLowerCase(); 
		    if (type == 'text' || type == 'password' || tag == 'textarea')
		        this.value = "";
		    else if (type == 'checkbox' || type == 'radio')
		        this.checked = false;
		    else if (tag == 'select')
		        this.selectedIndex = -1;
		  });
	});
	
});

function changeCheck(obj){
	if(!$(obj).is(':checked')){
		var objVal = $(obj).val();
		var targetName = objVal + "-dicId";
		$("input[name="+targetName+"]").each(function(){    
			this.checked = false;
		 });    
	}
}
</script>

<div class="pageContent">
	<form id="versionEntranceConfigForm" method="post" action="" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDoneFather);">
		<div class="pageFormContent" layoutH="56">
			<fieldset>
				<legend>版本选择</legend>
				<dl>
					<dd>
						<select id="appVersionId" name="appVersionId" class="combox" onchange="" >
							<option value="-1" >选择..</option>
							<c:forEach var="v" items="${versionList}">
								<option value="${v.vid}" <c:if test="${v.vid == version.vid}">selected="selected"</c:if> >${v.version}</option>
							</c:forEach>
						</select>
					</dd>
				</dl>
				
			</fieldset>
			<fieldset>
				<legend>入口-跳转页配置</legend>
				<table style="width:100%;">
					<c:forEach var="e" items="${entranceList}">
					<tr>
						<td class="tdtype">
							<label style="width: auto;font-weight: bold;font-size: 14;">
								<input name="appEntranceId" type="checkbox" value="${e.eid}" onchange="changeCheck(this);"
									<c:if test="${fn:contains(eids,e.eid)}">checked="checked"</c:if> />
									${e.entrance}
							</label>
						</td>
					</tr>
					<tr>
						<c:forEach var="t" items="${targetList}">
							<td class="tdtype">
								<label class="new-label">
									<input type="radio" name="${e.eid}-dicId" value="${e.eid}-${t.id}"
										<c:set var="eidDicid" value="${e.eid}-${t.id}"/>
										<c:if test="${fn:contains(targetIds,eidDicid)}">checked="checked"</c:if>/>
										${t.dicValue}
									</label>
								<div class="divider"></div>
							</td>
						</c:forEach>
					</tr>
					</c:forEach>
				</table>
				
			</fieldset>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" id="resetBtn" >重置</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button id="submitBtn">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

