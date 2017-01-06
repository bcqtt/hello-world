//点击标题显示复选框，置换其值
function checkShowFlag(obj){
	if($(obj).is(':checked')){
		$(obj).val(1);
	}else{
		$(obj).val(0);
	}
}

$(document).ready(function(){
	
	
	$("input[name='startTime']").val(startTime);
	$("input[name='endTime']").val(endTime);
	
	$("input[name='adBehaviorId']").on('click',function(){
		var inputUrl = $(this).attr('todourl')==undefined?"":$(this).attr('todourl');
		var inputApp = $(this).attr('todourl')==undefined?"":$(this).attr('todoapp');
		if($(this).attr('downloadApp') == undefined){
			$("#webAddress").css("display","block");
			$("#downAddress").css("display","none");
			var td = $("#webAddress").children()[0];
			$(td).find("input").remove();
			$(td).append('<input name="url" type="text" value="' + inputUrl + '"/>');
			var tds = $("#downAddress").children();
			for(var i=0;i<tds.length;i++){
				if($(tds[i]).find("input").length != 0){
					$(tds[i]).find("input").remove();
				}
			}
			
		}else{
			$("#webAddress").css("display","none");
			$("#downAddress").css("display","block");
			var td = $("#webAddress").children()[0];
			if($(td).find("input").length != 0){
				$(td).find("input").remove();
			}
			var tds = $("#downAddress").find("td");
			if($(tds[0]).find("input").length == 0){
				$(tds[0]).append('<input name="url" type="text" value="' + inputUrl + '"/>');
			}
			if($(tds[1]).find("input").length == 0){
				$(tds[1]).append('<input name="appName" type="text" value="' + inputApp + '" />');
			}
		}
	});
	
	$("input[name='keywordSetting']").on('click',function(){
		if($(this).val()==1){
			$("#keywordArea").css("display","block");
			$("#keywordWinBtn").css("display","block");
		}else{
			$("#keywordWinBtn").css("display","none");
			$("#keywordArea").css("display","none");
			var selected = $("#keywordArea").children();
			selected.each(function(n,element){
				$(element).remove();
			});
		}
	});
	
	// TODO 预览选择图片
	$("input[name='adImage']").on('change',function(){
		var file = $(this).val();
		$("#ad_img").attr("src",file);
	});
	
	//异步提交广告表单
	$("#adInfoSubmitBtn").click(function(){
		var url = "adinfo/saveAdInfo?editType="+ editType +"&resKey=";
		if($("input[name='adImage']").val()==""){
			//不选择文件时，采用普通form提交方式
			url = "adinfo/updateAdInfo?editType="+ editType +"&resKey=";
		}
		//有选择文件时采用带文件的form提交方式
		$('#adInfoForm').ajaxSubmit({
			type: "POST",
			dataType: "json",
			url: url,
			success: function (data) {
				DWZ.ajaxDone(data);
				divSearch($(".adPagerForm"), "adInformation"); //刷新指定DIV
			},
			error: DWZ.ajaxError
		});
		
		return false;
	});

	
	//置换选择窗的URL(adInfoEdit.jsp)
	var optidsOfVersion='';
	var optidsOfMechineType='';
	$("#selectedVersionDiv").children().each(function(index) {
		if(index == $("#selectedVersionDiv").children().length-1){
			optidsOfVersion += $(this).attr("optid")
		}else{
		    optidsOfVersion += $(this).attr("optid") + ",";
		}
	});
	$("#selectedMechineDiv").children().each(function(index) {
		if(index == $("#selectedMechineDiv").children().length-1){
			optidsOfMechineType += $(this).attr("optid")
		}else{
			optidsOfMechineType += $(this).attr("optid") + ",";
		}
	});
	$("#versionWinBtn").attr("href","adinfo/selectWindow?dickey=version&optid=" + optidsOfVersion);
	$("#mechineWinBtn").attr("href","adinfo/selectWindow?dickey=mechineType&optid=" + optidsOfMechineType);
	
});