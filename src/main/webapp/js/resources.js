var setting = {
	async:{
		enable: true,
		type:"post",
		dataType:"json",
		autoParam:["id","name"],
		url:"resources/menuTree"
	},
	view: { 
		dblClickExpand: true 
	}, 
	data: { 
		simpleData: { 
			enable: true,
			idKey:'id',
			pIdKey:'parentId',
			rootPid:null
		} 
	}, 
	callback: {
		onClick: nodeClick,
		onDblClick: reloadList,
		onAsyncSuccess: expandAll
	}
};

function nodeClick(e, treeId, treeNode){
	var resId = treeNode.id;
	var resName = treeNode.name;
	var pIdList = treeNode.parentIdList;
	var addhref = $("#addHref").val() + "&resId=" + resId + "&resName=" + resName + "&pIdList="+ pIdList;
	var edithref = $(".edit").attr("href").replace("{id_res}",resId);
	var delehref = $(".delete").attr("href").replace("{id_res}",resId);
	$(".add").attr("href",addhref);
	$(".edit").attr("href",edithref);
	$(".delete").attr("href",delehref);
}
function reloadList(event, treeId, treeNode){
	var pIdList = treeNode.parentIdList;
	var temp = $("form[name='menuPaperForm']").attr("action");
	var action = $("form[name='menuPaperForm']").attr("action")+"&pIdList="+pIdList;
	$("form[name='menuPaperForm']").attr("action",action);
	$("form[name='menuPaperForm']").submit();
	$("form[name='menuPaperForm']").attr("action",temp);
}
var goAsync = false;
function expandAll() {
	var zTree = $.fn.zTree.getZTreeObj("resTree");
	expandNodes(zTree.getNodes());
}
function expandNodes(nodes) {
	if (!nodes) return;
	var zTree = $.fn.zTree.getZTreeObj("resTree");
	for (var i=0, l=nodes.length; i<l; i++) {
		if(nodes[i].type==2) continue;
		zTree.expandNode(nodes[i], true, false, false);
		if (nodes[i].isParent && nodes[i].zAsync) {
			expandNodes(nodes[i].children);
		} else {
			goAsync = true;
		}
	}
}


$(document).ready(function(){
	var treeObj = $.fn.zTree.init($("#resTree"),setting);
	treeObj.expandAll(true);
});