package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AppUri;
import com.gionee.baserom.search.pojo.Card;
import com.gionee.baserom.search.pojo.Page;

public interface IAppUriService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveUri(String resKey,String editType,AppUri uri);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AppUri> queryPage(Page<AppUri> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AppUri selectByExample(AppUri au);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(AppUri au);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteUris(String resKey,String ids);

}
