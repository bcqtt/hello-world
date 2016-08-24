package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.HotKeys;
import com.gionee.baserom.search.pojo.Page;

public interface IHotkeyService {

	/**
	 * 保存自定义热词信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveHotkey(String resKey,String editType,HotKeys hotkey);

	/**
	 * 分页查询自定义热词信息
	 * @param page
	 * @return
	 */
	public Page<HotKeys> queryPage(Page<HotKeys> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public HotKeys selectByExample(HotKeys hotkey);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(HotKeys hk);

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteHotKeys(String resKey,String ids);

	public DwzAjaxObject updateHotkey(String resKey,HotKeys hk);

}
