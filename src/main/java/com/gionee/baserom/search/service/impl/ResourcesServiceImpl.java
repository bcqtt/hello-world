package com.gionee.baserom.search.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.common.ResourcesExt;
import com.gionee.baserom.search.dao.ResourcesMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Resources;
import com.gionee.baserom.search.pojo.ResourcesExample;
import com.gionee.baserom.search.pojo.ResourcesExample.Criteria;
import com.gionee.baserom.search.service.IResourcesService;
import com.gionee.baserom.search.util.StringHelper;

@Service("resourcesService")
public class ResourcesServiceImpl implements IResourcesService {
	private final Logger logger = LoggerFactory.getLogger(ResourcesServiceImpl.class);
	
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ResourcesMapper resourcesMapper;
	/**
	 * 保存角色信息
	 * @param account
	 */
	public DwzAjaxObject saveResources(String menuKey,String editType,Resources res) {
		int n=0;
		int type = res.getType();
		if(type==0){
			res.setIcon("framework/images/model.png");
		}else if(type==2){
			res.setIcon("framework/images/menu.png");
			res.setTarget("navTab");
		}else if(type==3){
			res.setIcon("framework/images/button.png");
			String[] str = res.getResKey().split("_");
			if(str[2].equals("add")){
				res.setCssClass("add");
				res.setTarget("dialog");
			}else if(str[2].equals("edit")){
				res.setCssClass("edit");
				res.setTarget("dialog");
				res.setWinWidth(700);
				res.setWinHeight(380);
				res.setWarn("请选择一个记录!");
			}else if(str[2].equals("del")){
				res.setCssClass("delete");
				res.setTarget("selectedTodo");
				res.setTittle("确实要删除所选记录吗?");
			}
		}
		if(editType.equals("add")){
			n = resourcesMapper.insert(res);
			String parentIdList = res.getParentIdList()+res.getId()+"*";
			res.setParentIdList(parentIdList);
			n = this.resourcesMapper.updateByPrimaryKey(res);
			logger.info("保存资源信息-->" + res.getName());
		}else if(editType.equals("update")){
			n = this.resourcesMapper.updateByPrimaryKey(res);
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,menuKey, "", "");
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
	public Page<Resources> queryPage(Page<Resources> page,String pIdList) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pIdList", pIdList);
		int totalCount = resourcesMapper.selectTotalCount(map);
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Resources> list = resourcesMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 */
	public Resources selectByExample(Resources res) {
		ResourcesExample example = new ResourcesExample();
		Criteria criteria = example.createCriteria();
		if(res.getName()!=null && !StringHelper.isEmpty(res.getName())){
			criteria.andNameEqualTo(res.getName());
		}else if(res.getId() != null){
			criteria.andIdEqualTo(res.getId());
		}
		List<Resources> list = this.resourcesMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}
	
	/**
	 * 根据id删除resources(包含多行删除)
	 */
	public DwzAjaxObject deleteResources(String menuKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			if(Integer.parseInt(idArray[i]) == 0){
				n = -1;
				break;
			}
			n += this.resourcesMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,menuKey, "", "");
		}else if(n<0){
			ajaxObj = new DwzAjaxObject("300", "不能删除根目录，重新选择！");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 根据登陆账号的id查询相关可访问资源
	 * @param accountId：预留条件，为了以后系统做大菜单增多时，根据用户id查询显示其可管理的菜单
	 * @return
	 */
	public List<Resources> queryResourcesByAccountId(String accountId) {
		return this.resourcesMapper.findAll();
	}

	/**
	 * 根据id查询Resources
	 */
	public Resources selectById(Integer parentId) {
		return resourcesMapper.selectByPrimaryKey(parentId);
	}

	/**
	 * 配置权限时的菜单树
	 */
	public List<ResourcesExt> queryResources(String accountId, int roleId) {
		List<Resources> list = this.resourcesMapper.findAll();
		List<Resources> checkedList = this.resourcesMapper.queryByRoleId(roleId);
		List<ResourcesExt> listExt = new ArrayList<ResourcesExt>();
		for(Resources r : list){
			ResourcesExt re = new ResourcesExt();
			BeanUtils.copyProperties(r, re);
			for(Resources cl : checkedList){
				if(re.getId() == cl.getId()){
					re.setChecked(true);
				}
			}
			listExt.add(re);
		}
		return listExt;
	}

	/**
	 * 根据账号id查询该账号下的可访问资源
	 * @param id
	 * @return
	 */
	public String queryAccountMenu(Integer id) {
		List<Resources> list = this.resourcesMapper.queryAccountMenu(id);
		StringBuffer sb = new StringBuffer();
		List<Resources> folderList = new ArrayList<Resources>();
		List<Resources> menuList = new ArrayList<Resources>();
		for(Resources r : list){
			if(r.getType()==0){
				folderList.add(r);
			}else if(r.getType()==2){
				menuList.add(r);
			}
		}
		for(Resources res : folderList){
			sb.append("<div class=\"accordionHeader\"><h2><span>Folder</span>" + res.getName() + "</h2></div>");
			sb.append("<div class=\"accordionContent\"><ul class=\"tree treeFolder\">");
			for(Resources menu : menuList){
				if(menu.getParentId() == res.getId()){
					String href = menu.getResUrl() + "?resId=" + menu.getId();
					sb.append("<li><a href=\"" + href + "\" target=\""+menu.getTarget()+"\" rel=\""+menu.getResKey()+"\">" + menu.getName() + "</a></li>");
				}
			}
			sb.append("</ul></div>");
		}
		return sb.toString();
	}

	/**
	 * 根据账号id查询该账号下对应该菜单的按钮
	 * @param id
	 * @return
	 */
	public List<Resources> queryAccountOpt(int accId, int resId) {
		List<Resources> optList = this.resourcesMapper.queryAccountOpt(accId,resId);
		return optList;
	}

}
