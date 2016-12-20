package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdDisplayRule;
import com.gionee.baserom.search.pojo.Page;

public interface IAdDisplayRuleService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAdRule(String resKey,String editType,AdDisplayRule adr);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AdDisplayRule> queryPage(Page<AdDisplayRule> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdDisplayRule selectByExample(AdDisplayRule adr);

	/**
	 * 根据id修改
	 * @return
	 */
	public int updateById(AdDisplayRule adr);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdRule(String resKey,String ids);

	/**
	 * 查询全部广告规则
	 * @return
	 */
	public List<AdDisplayRule> queryAllAdRule();
}
