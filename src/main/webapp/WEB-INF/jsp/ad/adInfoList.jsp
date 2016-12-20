<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
var adRuleId = '${ai.adRuleId}';
</script>

<!-- 
<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form> -->

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form id="pagerForm" onsubmit="return divSearch(this, 'adInformation');" action="adinfo/queryAdInfoPaper?resKey=adInformation&adRuleId=${ai.adRuleId}" method="post">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td class="dateRange">
					起始日期:
					<input type="text" style="width:120px;background-color: #ffffff;" value="<fmt:formatDate value="${ai.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="start_time">
					<span class="limit">-</span>
					<input type="text" style="width:120px;background-color: #ffffff;" value="<fmt:formatDate value="${ai.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" name="end_time">
				</td>
				<td>
					CP名称： <input type="text" name="cpName" value="${ai.cpName}" />
				</td>
				<td>
					<label style="width:60px;">广告行为：</label> 
					<select id="adBehaviorId" name="adBehaviorId" class="combox" onchange="">
						<option value="-1">选择..</option>
						<c:forEach var="b" items="${behaviorList}">
							<option value="${b.id}" <c:if test="${b.id==ai.adBehaviorId}">selected</c:if> >${b.behavior}</option>
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
				<td><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></td>
			</tr>
		</table>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="adinfo/addAdInfoView?editType=add&resKey=adInformation&adRuleId=${ai.adRuleId}" target="dialog" max="true" width="1110" height="615"><span>添加广告</span></a></li>
			<li><a class="edit" href="adinfo/editAdInfoView?editType=update&id={id_adinfo}&resKey=adInformation&adRuleId=${ai.adRuleId}" target="dialog" max="true" warn="请选择一个记录!" width="1110" height="615"><span>修改</span></a></li>
			<li><a class="delete" href="adinfo/deleteAdInfo?id={id_adinfo}&resKey=adInformation" target="selectedTodo" rel="ids" title="确实要删除所选记录吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="1200" layoutH="165">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th >广告标题</th>
				<th >CP名称</th>
				<th >广告行为</th>
				<th width="65">广告分类</th>
				<th >投放定向</th>
				<th width="280" align="center">开始/结束时间</th>
				<th >计费方式</th>
				<th >计费单价</th>
				<th >权重值</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="adi" items="${page.list}">
			   <tr target="id_adinfo" rel="${adi.id}">
				<td><input name="ids" value="${adi.id}" type="checkbox"></td>
				<td>${adi.adTittle}</td>
				<td>${adi.cpName}</td>
				<td>${adi.behavior.behavior}</td>
				<td>${adi.classify.cname}</td>
				<td>定向投放</td>
				<td>
					<fmt:formatDate value="${adi.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;-&nbsp;
					<fmt:formatDate value="${adi.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>${adi.billingTypeObj.dicValue}</td>
				<td>${adi.unitPrice}</td>
				<td>${adi.weight}</td>
			  </tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value},'adInformation')">
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
		
		<div class="pagination" targetType="navTab" rel="adInformation" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>

	</div>
</div>
