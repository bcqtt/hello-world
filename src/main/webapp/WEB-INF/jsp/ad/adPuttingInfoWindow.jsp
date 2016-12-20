<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#puttingAdInformation").loadUrl("adinfo/queryAdInfoPaper?searchType=putting_ad&resKey=puttingAdInformation",null, function(message){
		$('#puttingAdInformation').parent().find("[layoutH]").layoutH();
	});
});
</script>

<div class="pageContent">

	<div class="tabs" currentIndex="0" eventType="click">
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="adinfo/queryAdInfoPaper?searchType=putting_ad&resKey=puttingAdInformation" class="j-ajax"><span style="width:200px;text-align:center;">投放中</span></a></li>
					<li><a href="adinfo/queryAdInfoPaper?searchType=putting_ad&resKey=overdueAdInformation" class="j-ajax"><span style="width:200px;text-align:center;">投放完</span></a></li>
				</ul>
			</div>
		</div>
		<div class="tabsContent" >
			<div id="puttingAdInformation"></div>
			<div id="overdueAdInformation"></div>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
</div>

</div>
