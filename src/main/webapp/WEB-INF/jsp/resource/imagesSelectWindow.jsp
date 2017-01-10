<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="framework/gallery/css/zoom.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#checkList:hover{
	background: #DDE4F4;
}
#checkList select{
	margin-top: 2px;
}
.common ul li:hover{
	cursor: pointer;
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
	
});
function checkImage(obj){
	var resource = '${resource}';
	$(".common ul li").css("background","#f6f6f6");
	$(obj).css("background","#FFCC66");
	
	var imgPath = $(obj).find("img").attr("src");
	if(resource == 'old'){
		$("input[name='adImg']").val(imgPath);
		$("#adImg").attr("src",imgPath);
	}else if(resource == 'news'){
		$("input[name='img']").val(imgPath);
		$("#adImg").attr("src",imgPath);
	}else if(resource == 'nav'){
		$("input[name='iconUrl']").val(imgPath);
		$("#urlLogo").attr("src",imgPath);
	}else if(resource == 'life'){
		$("input[name='iconUrl']").val(imgPath);
		$("#lifeIcon").attr("src",imgPath);
	}
}

</script>

<form id="pagerForm" method="GET" action="images/queryImagesPaper?resId=68&resource=${resource}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<input type="hidden" name="type" value="${type}" />
</form>

<div id="${resKey}" class="pageContent" style="background-color:#DDE4F4;">
	<div layoutH="27" class="common" >
		<ul class="gallery">
		    <c:forEach var="img" items="${page.list}">
			     <li class="listbox" onclick="checkImage(this);">
				      <div class="listimg"> 
					      <a title="${img.title}" >
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
			<select class="combox" name="numPerPage" onchange="dialogPageBreak({numPerPage:this.value})">
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
		
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}" style="float:left;"></div>
		<ul class="toolBar float-right">
			<li><a class="checkall close" id="checkBtn" onclick="$.pdialog.closeCurrent();"><span>确定</span></a></li>
		</ul>
	</div>
</div>
