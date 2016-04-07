package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.GroupInfo;
import com.gionee.baserom.search.pojo.Page;

public interface IGroupService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveGroupInfo(String editType,GroupInfo group);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<GroupInfo> queryPage(Page<GroupInfo> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public GroupInfo selectByExample(GroupInfo group);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(GroupInfo group);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteGroups(String ids);

	/**
	 * 查询全部分组
	 * @return
	 */
	public List<GroupInfo> findAll();

}
