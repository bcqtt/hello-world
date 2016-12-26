package com.gionee.baserom.search.service;

import java.util.List;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.AppVersionEntrance;
import com.gionee.baserom.search.pojo.AppVersionEntranceKey;
import com.gionee.baserom.search.pojo.Page;

public interface IAppVersionService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveAppVersion(String resKey,String editType,AppVersion version);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<AppVersion> queryPage(Page<AppVersion> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public AppVersion selectByExample(AppVersion v);

	/**
	 * 根据id修改
	 * @return
	 */
	public int updateById(AppVersion av);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAppVersion(String resKey,String ids);

	/**
	 * 查询版本-入口配置管理列表
	 * @param page 
	 * @return
	 */
	public Page<AppVersion> queryVersionEntranceList(Page<AppVersion> page);

	/**
	 * 查询全部版本信息提供选择
	 * @return
	 */
	public List<AppVersion> queryAllVersion();

	public AppVersion selectVersionEntranceByVid(Integer appVersionId);

	public AppVersion selectByVid(Integer vid);

	public List<AppVersionEntrance> getVersionEntranceKeyByVid(Integer vid);

}
