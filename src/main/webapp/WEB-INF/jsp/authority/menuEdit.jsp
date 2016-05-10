<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="framework/zTreeV3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="framework/zTreeV3/js/jquery.ztree.core.js" ></script>
<script type="text/javascript" src="js/authority.js"></script>
<script type="text/javascript">
var zNodes =JSON.parse('${resList}'); 
var settings = {
	async:{
		enable: true,
		type:"post",
		dataType:"json",
		autoParam:["id"],
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
		onClick: onClick
	}
}; 

function onClick(e, treeId, treeNode) { 
	var zTree = $.fn.zTree.getZTreeObj("treeMenu");
	nodes = zTree.getSelectedNodes();
	$("#parentName").val( nodes[0].name); 
	$("#parentId").val(nodes[0].id); 
	$("#parentIdList").val(nodes[0].parentIdList + "${res.id}" + "*"); 
} 

function showTree(){
	var treeObj = $.fn.zTree.init($("#treeMenu"), settings);
	treeObj.expandAll(true);
	$("#menuContent").slideDown("fast"); 
}

function hideTree(){
	$("#menuContent").hide(); 
}

</script>
<div class="pageContent">
	<form method="post" action="resources/saveResources?editType=${editType}&menuKey=${menuKey}" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div id="pageFormContent" class="pageFormContent" layoutH="56">
			<fieldset>
				<dl class="nowrap">
					<dt>父级资源：</dt>
					<dd>
						<input id="parentName" type="text" name="parentName" class="required"  size="30" value="${pRes.name eq null ? resName : pRes.name}" lookupGroup="orgLookup" />
						<input id="parentId" type="hidden" name="parentId" value="${res.parentId eq null ? resId : res.parentId}"/>
						<input id="parentIdList"  name="parentIdList" value="${res.parentIdList eq null?pIdList : res.parentIdList}"/>
						<div id="menuBtn" class="button" onclick="showTree();" style="margin-left:5px;">
							<div class="buttonContent"><button type="button">选择资源</button></div>
						</div>
						<div id="menuContent" class="menuContent" style="border:1px solid #b8d0d6;display:none; position: absolute;left:130px;top:26px;z-index:999;background-color:#ECF1FF;"> 
							<ul id="treeMenu" class="ztree" style="margin-top:0; width:200px;height:250px;overflow-y:auto"></ul>
							<ul style="float: right; width: 80px;">
								<li>
									<div class="buttonActive">
										<div class="buttonContent">
											<button type="button" onclick="hideTree();">确定</button>
										</div>
									</div>
								</li>
								<li>
									<div class="button">
										<div class="buttonContent">
											<button type="button" onclick="hideTree();">取消</button>
										</div>
									</div>
								</li>
							</ul>
						</div> 
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>键名：</dt>
					<dd>
						<input name="resKey" class="required" type="text" size="30" value="${res.resKey}" /><br/>
						<div style="color:#AAAAAA">格式：[model/menu/button]_菜单英文名_[manage/add/edit/del]，如：<br/>"系统管理"模块：model_system,<br/>"账号管理"菜单：menu_account_manage,<br/>"添加账号"按钮：button_account_add。<br/></div>
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>资源名：</dt>
					<dd><input name="name" class="required" type="text" size="30" value="${res.name}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>访问URL：</dt>
					<dd><input name="resUrl" type="text" size="30" value="${res.resUrl}" /></dd>
				</dl>
				<dl class="nowrap">
					<dt>资源类型：</dt>
					<dd>
						<label><input id="model" type="radio" readonly="readonly" name="type" value="0" ${res.type == 0?"checked":""}/>模块</label>
						<!-- <label><input id="folder" type="radio" readonly="readonly" name="type" value="1" ${res.type == 1?"checked":""}/>目录</label>  -->
						<label><input id="menu" type="radio" readonly="readonly" name="type" value="2" ${res.type == 2?"checked":""}/>菜单</label>
						<label><input id="button" type="radio" readonly="readonly" name="type" value="3" ${res.type == 3?"checked":""}/>按钮</label>
					</dd>
				</dl>
				<dl class="nowrap">
					<dt>资源描述：</dt>
					<dd><textarea name="description" cols="70" rows="8">${res.description}</textarea></dd>
				</dl>
			</fieldset>
			<input type="hidden" name="id" value="${res.id}" />
			<input type="hidden" name="cssClass" value="${res.cssClass}" />
			<input type="hidden" name="target" value="${res.target}" />
			<input type="hidden" name="winWidth" value="${res.winWidth}" />
			<input type="hidden" name="winHeight" value="${res.winHeight}" />
			<input type="hidden" name="warn" value="${res.warn}" />
			<input type="hidden" name="tittle" value="${res.tittle}" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

