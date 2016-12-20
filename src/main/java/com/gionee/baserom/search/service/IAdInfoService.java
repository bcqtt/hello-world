package com.gionee.baserom.search.service;

import java.io.IOException;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AdBehaviorTodo;
import com.gionee.baserom.search.pojo.AdInfo;
import com.gionee.baserom.search.pojo.Page;

import jxl.read.biff.BiffException;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public interface IAdInfoService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 * @param abt 
	 */
	public DwzAjaxObject saveAdInfo(String resKey,String editType,AdInfo ai, AdBehaviorTodo abt);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @param searchType 
	 * @param resKey 
	 * @param classifyId 
	 * @return
	 */
	public Page<AdInfo> queryPage(Page<AdInfo> page, AdInfo ai, String searchType, String resKey);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AdInfo selectByExample(AdInfo ai);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AdInfo ai);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdInfo(String resKey,String ids);

	/**
	 * 导出Excel数据
	 * @param ai 
	 * @param resKey 
	 * @param host 
	 * @throws IOException 
	 * @throws BiffException 
	 * @throws WriteException 
	 */
	public String exportAdInfo(AdInfo ai, String resKey, String basePath) throws IOException, BiffException, WriteException;
}
