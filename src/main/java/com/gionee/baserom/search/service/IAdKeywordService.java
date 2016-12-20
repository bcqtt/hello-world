package com.gionee.baserom.search.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdKeyword;
import com.gionee.baserom.search.pojo.Page;

public interface IAdKeywordService {
	
	/**
	 * 保存信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAdKeyword(String resKey,String editType,AdKeyword keyword);
	
	/**
	 * 上传信息
	 * @param keyList 
	 * @param inputStream 
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject uploadAdKeyword(String resKey, List<String> keyList);

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<AdKeyword> queryPage(Page<AdKeyword> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdKeyword selectByExample(AdKeyword card);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdKeyword card);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdKeyword(String resKey,String ids);

	/**
	 * 获取全部广告关键字提供选择
	 * @return
	 */
	public List<AdKeyword> getAllKeyword();

	/**
	 * 根据多个id查询关键词
	 * @param keys
	 * @return
	 */
	public List<AdKeyword> getSelectedKeyword(String[] keys);

}
