package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.HotkeySource;
import com.gionee.baserom.search.pojo.Page;

public interface IHotkeySourceService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveHotkeySource(String resKey,String editType,HotkeySource source);

	/**
	 * 分页查询采集源信息
	 * @param page
	 * @param i 
	 * @return
	 */
	public Page<HotkeySource> queryPage(Page<HotkeySource> page, int i);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public HotkeySource selectByExample(HotkeySource source);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(HotkeySource source);

	/**
	 * 根据id删除hotkey_source(包含多行删除)
	 */
	public DwzAjaxObject deleteHotkeySources(String resKey,String ids);
	
	public DwzAjaxObject updateHotkeySource(String resKey,HotkeySource source);


}
