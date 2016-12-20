<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/authority.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#adInformation").loadUrl("adinfo/queryAdInfoPaper",null, function(message){
		$('#adInformation').parent().find("[layoutH]").layoutH();
	});
});
</script>

<div class="pageHeader">
	<div style="float:left; display:block; overflow:hidden; padding:0 10px; line-height:21px;">
		<a class="button" href="adCls/queryAdClsPaper" target="dialog" rel="ad_classify_manage" title="广告分类管理" width="550" height="480"><span>广告分类管理</span></a>
		<a class="button" href="adBehavior/queryAdBehaviorPaper" target="dialog" rel="ad_behavior_manage" width="550" height="480"><span>广告行为管理</span></a>
		<a class="button" href="adRule/queryAdRulePaper" target="dialog" rel="ad_rule_manage" width="550" height="480" fresh="false"><span>广告规则管理</span></a>
		<a class="button" href="adKeyword/queryAdKeywordPaper" target="dialog" rel="ad_keyword_manage" width="550" height="480" fresh="false"><span>关键字管理</span></a>
		<a class="button" href="adinfo/adPuttingManageView" target="dialog" rel="ad_putting_manage" width="1200" height="620" mask="true" fresh="false"><span>投放管理</span></a>
	</div>
</div>

<div class="pageContent" style="padding:5px">
	<div>
		<div layoutH="50"
			style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
			<ul class="tree treeFolder">
				<li ><a id="allAdList" href="adinfo/queryAdInfoPaper" target="ajax" rel="adInformation">广告位列表</a>
					<ul>
						<c:forEach var="rl" items="${adRuleList}">
							<li><a href="adinfo/queryAdInfoPaper?adRuleId=${rl.id}" target="ajax" rel="adInformation">${rl.adPosition}</a></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>

		<div id="adInformation" class="unitBox" style="margin-left: 246px;">
			<!--#include virtual="adInfoList.jsp" -->
		</div>

	</div>
</div>