<%@ page language="java" contentType="application/x-msdownload" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<script src="js/jquery.form.js" type="text/javascript" />
<script type="text/javascript">
function exportData(obj){
	var url = $(obj).attr("url");
	$('#pagerForm').ajaxSubmit({
			type: "POST",
			dataType: "json",
			url: url,
			success: function (data) {
				location.href = data.filePath;
			},
			error: DWZ.ajaxError
		});
		
}
</script>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form id="pagerForm" onsubmit="return divSearch(this, '${resKey}');" action="adinfo/queryAdInfoPaper?searchType=putting_ad&resKey=${resKey}" method="post" style="width:90%;">
		<input type="hidden" name="pageNum" value="${page.currentPage}" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td class="dateRange">
						起始日期:
						<input type="text" style="width:120px;background-color: #ffffff;" value="<fmt:formatDate value="${ai.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="startTime">
						<span class="limit">-</span>
						<input type="text" style="width:120px;background-color: #ffffff;" value="<fmt:formatDate value="${ai.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="endTime">
					</td>
					<td>
						CP名称： <input type="text" name="cpName" value="${ai.cpName}" />
					</td>
					<td style="width:auto;">
						<label style="width:60px;">广告位：</label> 
						<select id="adRuleId" name="adRuleId" class="combox" onchange="">
							<option value="-1">选择..</option>
							<c:forEach var="r" items="${ruleList}">
								<option value="${r.id}" <c:if test="${r.id==ai.adRuleId}">selected</c:if> >${r.adPosition}</option>
							</c:forEach>
						</select>
						</td>
					<td>
						<label style="width:60px;">广告分类：</label> 
						<select id="selectClassify" name="adClassifyId" class="combox" onchange="">
							<option value="-1">选择..</option>
							<c:forEach var="c" items="${classifyList}">
								<option value="${c.cid}" <c:if test="${c.cid==ai.adClassifyId}">selected</c:if>>${c.cname}</option>
							</c:forEach>
						</select>
						</td>
					<td>
						<div class="buttonActive"><div class="buttonContent"><button id="searchBtn">查询</button></div></div>
					</td>
					<td>
						<a class="button" url="adinfo/exportAdInfo?resKey=${resKey}" onclick="exportData(this)"><span>导出Excel</span></a>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>

<div class="pageContent">
	<table class="table" width="1150" layoutH="125">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th >广告标题</th>
				<th >CP名称</th>
				<th >广告位</th>
				<th width="65">广告分类</th>
				<th width="280" align="center">开始/结束时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="adi" items="${page.list}">
			   <tr target="id_adinfo" rel="${adi.id}">
				<td><input name="ids" value="${adi.id}" type="checkbox"></td>
				<td>${adi.adTittle}</td>
				<td>${adi.cpName}</td>
				<td>${adi.rule.adPosition}</td>
				<td>${adi.classify.cname}</td>
				<td>
					<fmt:formatDate value="${adi.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;-&nbsp;
					<fmt:formatDate value="${adi.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
			  </tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="dialogPageBreak({numPerPage:this.value},'${resKey}')">
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
		
		<div class="pagination" targetType="dialog" rel="${resKey}" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>
	</div>

</div>
