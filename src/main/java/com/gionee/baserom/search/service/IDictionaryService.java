package com.gionee.baserom.search.service;

import java.util.List;
import java.util.Map;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.pojo.SysDictionaryClassify;

public interface IDictionaryService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveDic(String resKey,String editType,SysDictionary sdc);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @param clsId 
	 * @return
	 */
	public Page<SysDictionary> queryDicPage(Page<SysDictionary> page, String clsId);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public SysDictionary selectByExample(SysDictionary sdc);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(SysDictionary sdc);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteDic(String resKey,String ids);
	
	
	/*************以下是字典类型管理的部分************/
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveDicClassify(String resKey,String editType,SysDictionaryClassify sdc);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<SysDictionaryClassify> queryPage(Page<SysDictionaryClassify> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public SysDictionaryClassify selectByExample(SysDictionaryClassify sdc);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(SysDictionaryClassify sdc);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteDicClassify(String resKey,String ids);

	/**
	 * 查找出全部字典类型提供选择
	 * @return
	 */
	public List<SysDictionaryClassify> queryAllClassify();

	public Map<String,Object> getDictionary();

	/**
	 * 获取版本字典
	 * @return
	 */
	public Map<String, List<SysDictionary>> getDic();

	/**
	 * 根据字典id查询字典列表
	 * @param version
	 * @return
	 */
	public Map<String, List<SysDictionary>> getDictionaryByIds(String version, String mechineType);

	public List<SysDictionary> getDictionaryOfAdType();

}
