<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="framework/zTreeV3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="framework/zTreeV3/js/jquery.ztree.all.js" ></script>
<script src="js/authority.js" type="text/javascript"></script>
<script type="text/javascript">
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
		chkboxType: { "Y": "ps", "N": "ps" }
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
	zTree.selectNode(treeNode,true);
	nodes = zTree.getCheckedNodes();
	console.log(nodes);
} 
function saveAccountRole(){
	alert("@#@#@#@##%$#%#$");
}

</script>
<div class="pageContent">
	<div>
		<div style="float:left; display:block; overflow-y:auto; width:280px;height:89%; border:solid 1px #CCC; line-height:21px; background:#fff">
		    <ul id="treeMenu" class="ztree" style="margin-top:0; width:90%;height:97%;overflow-y:auto"></ul>
		</div>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="buttonActive"><div class="buttonContent"><button>保存</button></div></div></li>
			<li>
				<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
			</li>
		</ul>
	</div>
</div>

