<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="framework/zTreeV3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="framework/zTreeV3/js/jquery.ztree.all.js" ></script>
<script src="js/authority.js" type="text/javascript"></script>
<script type="text/javascript">
var roleId = "${roleId}";
var zNodes =JSON.parse('${resList}'); 
var setting = {
	sync:{
		enable: true,
		type:"post",
		dataType:"json",
		autoParam:["id"],
		url:"resources/menuTree"
	},
	check:{
		enable: true ,
		chkboxType: { "Y": "p", "N": "" }
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
		onClick: onClick
	}
}; 
var treeObj = $.fn.zTree.init($("#treeMenu"), setting,zNodes);
treeObj.expandAll(true);
function onClick(e, treeId, treeNode) { 
	var zTree = $.fn.zTree.getZTreeObj("treeMenu");
	if(treeNode.checked==true){
		zTree.checkNode(treeNode,false,false,false);
	}else{
		zTree.checkNode(treeNode,true,false,false);
	}
} 
function saveAuthority(){
	var zTree = $.fn.zTree.getZTreeObj("treeMenu");
	var nodes = zTree.getCheckedNodes();
	var ids = "";
	for(var i=0;i<nodes.length;i++){
		ids += nodes[i].id + ",";
	}
	ajaxTodo("resourcesRole/saveResourcesRole?ids=" + ids + "&roleId="+roleId,
			PublicUtils.ajaxTodoCallback());
}

</script>
<div class="pageContent">
	<div>
		<div style="float:left; display:block; width:280px;height:89%; border:solid 1px #CCC; line-height:21px; background:#fff">
		    <ul id="treeMenu" class="ztree" layoutH="49" style="margin-top:0; width:275px;overflow-y:auto;"></ul>
		</div>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button onclick="saveAuthority();">保存</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
</div>

