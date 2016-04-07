package com.gionee.baserom.search.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.ResourcesRoleMapper;
import com.gionee.baserom.search.pojo.ResourcesRoleKey;
import com.gionee.baserom.search.service.IResourcesRoleService;

@Service("resourcesRoleService")
public class ResourcesRoleServiceImpl implements IResourcesRoleService {
	private final Logger logger = LoggerFactory.getLogger(ResourcesRoleServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ResourcesRoleMapper resourcesRoleMapper;

	/**
	 * 保存ResourcesRole
	 */
	public DwzAjaxObject saveResourcesRole(String ids,int roleId) {
		int n = 0;
		
		//删除该角色下已有的资源
		resourcesRoleMapper.deleteByRoleId(roleId);
		if(!ids.equals("")){
			//保存新配置的角色
			String[] idArray = ids.split(",");
			for(int i=0; i<idArray.length; i++){
				if(Integer.parseInt(idArray[i])==0){
					continue;
				}
				ResourcesRoleKey rr = new ResourcesRoleKey();
				rr.setResId(Integer.parseInt(idArray[i]));
				rr.setRoleId(roleId);
				n = resourcesRoleMapper.insert(rr);
			}
			if(n>0){
				ajaxObj = new DwzAjaxObject("200", "操作成功！");
			}else{
				ajaxObj = new DwzAjaxObject("300", "操作失败！");
			}
		}else{
			ajaxObj = new DwzAjaxObject("200", "操作成功！");
		}
		
		logger.info("----->角色分配权限。");
		return ajaxObj;
	}

	

}
