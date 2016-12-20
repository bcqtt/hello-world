package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdClassify;
import com.gionee.baserom.search.pojo.Page;

public interface IAdClassifyService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAdCls(String resKey,String editType,AdClassify adc);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AdClassify> queryPage(Page<AdClassify> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdClassify selectByExample(AdClassify adc);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdClassify adc);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdCls(String resKey,String ids);

	/**
	 * 查询全部广告分类
	 * @return
	 */
	public List<AdClassify> getAllClassify();
}
