<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<link rel="stylesheet" href="framework/multiselect2side/css/jquery.multiselect2side.css" type="text/css" media="screen" />
<script type="text/javascript" src="framework/multiselect2side/js/jquery.multiselect2side.js" ></script>

<style type="text/css">
	.ms2side__div{
		clear: left;
	    width: 684px;
	    padding: 1px;
	    float: left;
	    background: url('') repeat-x;
	}
	.ms2side__div select {
		width: 314px;
		height: 330px;
    	float: left;
	}
	.ms2side__options, .ms2side__updown{
		float: left;
	    font-size: 10pt;
	    margin: 0;
	    padding: 0 8px;
	    width: 40px;
	    height:180px;
	    color: black;
	    text-align: center;
	    overflow: hidden;
	    padding-top: 145px;
	}
	.ms2side__options p, .ms2side__updown p{
		margin: 2px 0;
	    padding: 0;
	    cursor: pointer;
	    border: 1px solid #BFDEE6;
	    height: 25px;
	    font-size: 24px;
	}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var dickey = '${dickey}';
	var editType = '${editType}';
	
	$('#keywordsearchable').multiselect2side({
		search: '候选、 查找: ',
		moveOptions: false,
		labelsx: '候选：',
		labeldx: '已选：',
		autoSort: true,
		autoSortAvailable: true
	});
	
	$("#keywordSelectBtn").on("click",function(){
		var selected = $('#keywordsearchable').val();
		
		if(selected==null){
			
			//更新操作时，右边框中的值有变动的处理
			if(editType=='update'){
				var selected_ = [];
				$("#keywordsearchablems2side__dx option").each(function(){
					selected_.push($(this).val());
				});
				setValue(selected_);
			}
			
			//更新操作时，从初始值框（keywordArea）带到右边选择框
			selected = [];
			$("#searchablems2side__dx option").each(function(){
				selected.push($(this).val());
			});
		}else{
			setValue(selected);
		}

	});
	
	function setValue(selected){
		var existKeyword = $("#keywordArea").children();
		existKeyword.each(function(n,element){
			$(element).remove();
		});
		var ids='';
		var keys='';
		for (var i = 0; i < selected.length; i++) {
			var str = selected[i].split("-");
			if(i == selected.length-1){
				ids += str[0];
			}else{
				ids += str[0]+",";
			}
			$("#keywordArea").append('<option value="' + str + '">' + str[1] + '</option>');
		}
		$("input[name='keyword']").val(ids);
	}
});
</script>

<div class="pageContent">
	<div layoutH="40" style="width:100%;height:100%">
		<select name="keywordsearchable[]" id='keywordsearchable' multiple='multiple' >
			<c:forEach var="k" items="${kwList}">
				<option value="${k.id}-${k.keyword}" <c:if test="${fn:contains(keywordIds,k.id)}">SELECTED</c:if> >${k.keyword}</option>
			</c:forEach>
		</select>
	</div>
	
	<div class="formBar" style="text-align:center;">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button id="keywordSelectBtn">确定</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
			</li>
		</ul>
	</div>
	
	
</div>


