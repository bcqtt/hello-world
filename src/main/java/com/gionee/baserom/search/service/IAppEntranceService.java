package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AppEntrance;
import com.gionee.baserom.search.pojo.AppVersionEntranceKey;
import com.gionee.baserom.search.pojo.Page;

public interface IAppEntranceService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAppEntrance(String resKey,String editType,AppEntrance version);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AppEntrance> queryPage(Page<AppEntrance> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AppEntrance selectByExample(AppEntrance v);

	/**
	 * 根据id修改
	 * @return
	 */
	public int updateById(AppEntrance ae);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAppEntrance(String resKey,String ids);

	/**
	 * 查询全部入口
	 * @return
	 */
	public List<AppEntrance> queryAllEntrance();

	/**
	 * 保存版本-入口配置
	 * @param resKey
	 * @param editType
	 * @param aek
	 * @param targetIds 
	 * @param entrancesIds 
	 * @return
	 */
	public DwzAjaxObject saveAppVersionEntrance(String resKey, String editType, AppVersionEntranceKey aek, List<Integer> entrancesIds, List<String> targetIds);

	public DwzAjaxObject deleteAppVersionEntrance(String resKey, String ids);

}
