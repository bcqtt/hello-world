package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.ResourcesRoleMapper;
import com.gionee.baserom.search.dao.RoleMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Role;
import com.gionee.baserom.search.pojo.RoleExample;
import com.gionee.baserom.search.pojo.RoleExample.Criteria;
import com.gionee.baserom.search.service.IRoleService;
import com.gionee.baserom.search.util.StringHelper;

@Service("roleService")
public class RoleServiceImpl implements IRoleService {
	private final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
	
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private RoleMapper roleMapper;
	
	@Resource
	private  ResourcesRoleMapper resourcesRoleMapper;
	/**
	 * 保存角色信息
	 * @param account
	 */
	public DwzAjaxObject saveRole(String resKey,String editType, Role role) {
		int n=0;
		if(editType.equals("add")){
			n = roleMapper.insert(role);
			logger.info("保存角色信息-->" + role.getRoleName());
		}else if(editType.equals("update")){
			if(role.getEnable()==null){
				role.setEnable(0);
			}
			n = this.roleMapper.updateByPrimaryKey(role);
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	/**
	 * 分页查询角色信息
	 * @param page
	 * @return
	 */
	public Page<Role> queryPage(Page<Role> page) {
		int totalCount = roleMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Role> list = roleMapper.queryByPage(map);
		page.setTotalCount(totalCount-1);
		page.setList(list);
		return page;
	}

	/**
	 * 根据id删除role(包含多行删除)
	 */
	public DwzAjaxObject deleteRoles(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			int roleId = Integer.parseInt(idArray[i]);
			if(roleId == 1){
				n = -1;
				break;
			}
			this.resourcesRoleMapper.deleteByRoleId(roleId);
			n += this.roleMapper.deleteByPrimaryKey(roleId);
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else if(n<0){
			ajaxObj = new DwzAjaxObject("300", "不能删除根管理员，重新选择！");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 根据Example查询
	 */
	public Role selectByExample(Role role) {
		RoleExample example = new RoleExample();
		Criteria criteria = example.createCriteria();
		if(role.getRoleName()!=null && !StringHelper.isEmpty(role.getRoleName())){
			criteria.andRoleNameEqualTo(role.getRoleName());
		}else if(role.getId() != null){
			criteria.andIdEqualTo(role.getId());
		}
		List<Role> list = this.roleMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 查询全部角色
	 */
	public List<Role> findAll(Integer groupId) {
		return this.roleMapper.findAll(groupId);
	}
}
