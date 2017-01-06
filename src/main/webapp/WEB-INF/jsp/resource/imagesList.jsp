<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="framework/gallery/css/zoom.css" rel="stylesheet" type="text/css" />
<%-- <script src="framework/gallery/js/zoom.min.js" type="text/javascript"></script> --%>
<style type="text/css">
#checkList:hover{
	background: #DDE4F4;
}
#checkList select{
	margin-top: 2px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$('.listimg').hover(function() {
		$(".summary", this).stop().animate({
			top : '110px'
		}, {
			queue : false,
			duration : 180
		});
	}, function() {
		$(".summary", this).stop().animate({
			top : '165px'
		}, {
			queue : false,
			duration : 180
		});
	});
	
	$(".listbox").hover(function(){
        $(this).find(".editBtn").show();  
    },function(){
    	$(this).find(".editBtn").hide();
    });
});

function showCheckbox(obj){
	$("input[type=checkbox]").show();
	$("#checkAllBtn").show();
	$("#hideCheckboxBtn").show();
	$("#deleteBtn").show();
}

function checkAll(obj){
	$("input[type=checkbox]").each(function(){
		this.checked = true;
	});
}

function hideCheckbox(obj){
	$("input[type=checkbox]:checked").each(function(){
		this.checked = false;
	});
	$("input[type=checkbox]").hide();
	$("#hideCheckboxBtn").hide();
	$("#checkAllBtn").hide();
	$("#deleteBtn").hide();
}

function checkChange(obj){
	$("input[name=type]").val($("#selectType").val());
	var data = {
			pageNum: '${page.currentPage}',
			numPerPage: '${page.numPerPage}',
			type: $("#selectType").val()
		};
	$("#${resKey}").loadUrl("${resAction}",data, function(message){
		$('#${resKey}').parent().find("[layoutH]").layoutH();
	});
}
</script>

<form id="pagerForm" class="imagesForm" method="GET" action="${resAction}" onsubmit="return divSearch(this,'${resKey}');">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="type" value="${type}" />
</form>

<div id="${resKey}" class="pageContent" style="background-color:#DDE4F4;">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="upload" href="images/addImagesView?editType=add&resKey=${resKey}" target="dialog" width="900" height="400"><span>上传素材</span></a></li>
			<li><a class="manage" id="showCheckboxBtn" onclick="showCheckbox(this);"><span>批量管理</span></a></li>
			<li id="checkAllBtn" style="display:none;"><a class="checkall" onclick="checkAll(this);" ><span>全选</span></a></li>
			<li id="hideCheckboxBtn" style="display:none;"><a class="uncheck" onclick="hideCheckbox(this);" ><span>取消</span></a></li>
			<li id="deleteBtn" style="display:none;" ><a class="cloud-delete" href="images/deleteImages?id={id_image}&resKey=${resKey}" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?" ><span>删除</span></a></li>
			<li id="checkList">
				<select id="selectType" name="type" onchange="checkChange(this);">
					<option value="-1" >全部</option>
					<c:forEach var="t" items="${typeList}">
					   <option value="${t.id}" <c:if test="${t.id==type}">selected</c:if> >${t.dicValue}</option>
					</c:forEach>
				</select>
			</li>
			<%--
			<c:forEach var="opt" items="${optList}">
				<c:if test="${opt.type==3}">
					<c:if test="${opt.cssClass == 'add'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
					</c:if>
					<c:if test="${opt.cssClass == 'edit'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" warn="${opt.warn}" width="${opt.winWidth}" height="${opt.winHeight}" ><span>${opt.name}</span></a></li>
					</c:if>
					<c:if test="${opt.cssClass == 'delete'}">
						<li><a class="${opt.cssClass}" href="${opt.resUrl}&resKey=${resKey}" target="${opt.target}" rel="ids" title="${opt.tittle}" ><span>${opt.name}</span></a></li>
					</c:if>
				</c:if>
			</c:forEach>
			 --%>
		</ul>
	</div>
	
	<div layoutH="53" class="common" >
		<ul class="gallery">
		    <c:forEach var="img" items="${page.list}">
			     <li class="listbox">
				      <div class="listimg"> 
					      <a href="${img.imgPath}" title="${img.title}" target="_blank">
					      	  <img src="${img.imgPath}" class="attachment-thumbnail wp-post-image" alt="${img.title}" />
					      </a>
				          <div class="summary">
				              <div class="summarytxt">
				                <p>${img.description}</p>
				              </div>
				          </div>
			          	  <input name="ids" type="checkbox" class="checkbox" id="imgId-${img.id}" value="${img.id}" />
				      </div>
				      <div class="listinfo">
				          <div class="listtitle">
        	          	    <a href="images/editImagesView?editType=update&id=${img.id}&resKey=${resKey}"  class="editBtn" target="dialog" width="900" height="400" resizable="false" maxable="false" mask="true">编辑</a>
				          	[${img.typeObj.dicValue}]
				          	<c:set var="end" value="${fn:length(img.fileName)}" ></c:set>
				          	<c:if test="${img.title == null}">${fn:substring(img.fileName,33,end)}</c:if>
				          	<c:if test="${img.title != null}">${img.title} </c:if>
				          </div>
				          <c:if test="${img.isRef == 1}"><div class="isRef"></div></c:if>
				      </div>
			    </li>
			     
			</c:forEach>
		 </ul>
	</div>
	
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<script>
		        $("select[name='numPerPage']").val('${page.numPerPage}');
		    </script>
			<span>条，共${page.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>

	</div>
</div>
