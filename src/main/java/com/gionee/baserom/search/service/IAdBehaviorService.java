package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdBehavior;
import com.gionee.baserom.search.pojo.Page;

public interface IAdBehaviorService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAdBehavior(String resKey,String editType,AdBehavior ab);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AdBehavior> queryPage(Page<AdBehavior> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdBehavior selectByExample(AdBehavior adc);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdBehavior adc);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdBehavior(String resKey,String ids);

	public List<AdBehavior> getAdBehaviorList();
}
