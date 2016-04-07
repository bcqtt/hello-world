package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.GroupInfoMapper;
import com.gionee.baserom.search.pojo.GroupInfo;
import com.gionee.baserom.search.pojo.GroupInfoExample;
import com.gionee.baserom.search.pojo.GroupInfoExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IGroupService;
import com.gionee.baserom.search.util.StringHelper;

@Service("groupService")
public class GroupServiceImpl implements IGroupService {
	private final Logger logger = LoggerFactory.getLogger(GroupServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private GroupInfoMapper groupMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveGroupInfo(String editType,GroupInfo group) {
		int n=0;
		if(editType.equals("add")){
			n = groupMapper.insert(group);
			logger.info("保存分组信息-->" + group.getGroupName());
		}else if(editType.equals("update")){
			n = this.groupMapper.updateByPrimaryKey(group);
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,"group_list", "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<GroupInfo> queryPage(Page<GroupInfo> page) {
		int totalCount = groupMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<GroupInfo> list = groupMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public GroupInfo selectByExample(GroupInfo group) {
		GroupInfoExample example = new GroupInfoExample();
		Criteria criteria = example.createCriteria();
		if(group.getGroupName()!=null && !StringHelper.isEmpty(group.getGroupName())){			
			criteria.andGroupNameEqualTo(group.getGroupName());
		}else if(group.getId() != null){
			criteria.andIdEqualTo(group.getId());
		}
		List<GroupInfo> list = this.groupMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(GroupInfo group) {
		return this.groupMapper.updateByPrimaryKey(group);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteGroups(String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.groupMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,"group_list", "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 查询全部
	 */
	public List<GroupInfo> findAll() {
		return groupMapper.findAll();
	}

}
