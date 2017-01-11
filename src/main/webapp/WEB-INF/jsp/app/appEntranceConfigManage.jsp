<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<script type="text/javascript">
function changeView(simpleDiv,detailDiv,obj){
	if($("#" + simpleDiv).css("display") == 'block'){
		$("#" + simpleDiv).css("display","none");
		$("#" + detailDiv).css("display","block");
		$(obj).text("收起");
	}else{
		$("#" + simpleDiv).css("display","block");
		$("#" + detailDiv).css("display","none");
		$(obj).text("详情");
	}
};

</script>

<form id="pagerForm" method="GET" action="${resAction}">
	<input type="hidden" name="pageNum" value="${page.currentPage}" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="appEntrance/addAppVersionEntranceView?editType=add&resKey=app_version_entrance_manage" target="dialog" rel="app_version_entrance_add" mask="true" width="450" height="540"><span>添加</span></a></li>
			<li><a class="edit" href="appEntrance/editAppVersionEntranceView?editType=update&resKey=app_version_entrance_manage&vid={id_version}" target="dialog" rel="app_version_entrance_edit" mask="true"  warn="请选择一个记录!" width="450" height="540"><span>修改</span></a></li>
			<li><a class="delete" href="appEntrance/deleteAppVersionEntrance?vid={id_version}&resKey=app_version_entrance_manage" targetType="dialog" target="selectedTodo" callback="dialogAjaxDoneFather" rel="ids" title="确实要删除所选记录吗?"  ><span>删除</span></a></li>
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
	<table class="table" width="1000" layoutH="75">
		<thead>
			<tr>
				<th align="center" width="40"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="120">应用版本</th>
				<th align="center">入口位置</th>
				<th align="center">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="version" items="${page.list}">
			   <tr target="id_version" rel="${version.vid}">
				<td><input name="ids" value="${version.vid}" type="checkbox"></td>
				<td>${version.version}</td>
				<td>
					<div id="simple-${version.vid}" style="display: block;height: 30px;line-height: 30px;">
						<c:forEach var="entrance" items="${version.entranceList}">
							<span style="margin-left:5px;padding:5px;height:30px;line-height:30px;background-color:#FF9933;color:#FFFFCC">${entrance.entrance}</span>
						</c:forEach>
					</div>
					<div id="detail-${version.vid}" style="display: none;height:auto;">
						<table style="width:100%;">
							<tr>
								<td style="width:120px;margin-left:5px;height:25px;line-height:25px;background-color:#FFCC99;">入口</td>
								<c:forEach var="entrance" items="${version.entranceList}">
									<td style="margin-left:5px;height:25px;line-height:25px;background-color:#FFCC66;font-weight:bold;">${entrance.entrance}</td>
								</c:forEach>
							</tr>
							<tr>
								<td style="width:120px;margin-left:5px;height:25px;line-height:25px;background-color:#FFCC99;">跳转页</td>
								<c:forEach var="target" items="${version.targetList}">
									<td style="margin-left:5px;height:25px;line-height:25px;background-color:#FFFFCC;">${target.dicValue}</td>
								</c:forEach>
							</tr>
						</table>
						
					</div>
				</td>
				<td>
					<a onclick="changeView('simple-${version.vid}','detail-${version.vid}',this);" style="color:blue;cursor:pointer;">详情</a>
				</td>
			  </tr>
			</c:forEach>
			
		</tbody>
	</table>
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
		
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="10" currentPage="${page.currentPage}"></div>

	</div>
</div>

