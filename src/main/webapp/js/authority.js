/**
 * 权限管理，公共工具
 */
var PublicUtils= {
		ajaxTodoCallback : function(){
			return false;
		}
};

/**
 * 权限管理:角色js工具
 */
var RoleUtils = {
	onClickOfEnable: function(obj){
		if($(obj).is(':checked')){
			$(obj).val(1);
		}else{
			$(obj).val(0);
		}
	}
};