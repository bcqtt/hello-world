package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.HotKeysMapper;
import com.gionee.baserom.search.pojo.HotKeys;
import com.gionee.baserom.search.pojo.HotKeysExample;
import com.gionee.baserom.search.pojo.HotKeysExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IHotkeyService;

@Service("hotkeyService")
public class HotkeyServiceImpl implements IHotkeyService {
	private final Logger logger = LoggerFactory.getLogger(HotkeyServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private HotKeysMapper hotkeyMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveHotkey(String resKey,String editType,HotKeys hk) {
		int n=0;
		hk.setType(1);
		if(editType.equals("add")){
			n = hotkeyMapper.insert(hk);
			logger.info("保存自定义热词信息-->" + hk.getHotKey());
		}else if(editType.equals("update")){
			n = this.hotkeyMapper.updateByPrimaryKey(hk);
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<HotKeys> queryPage(Page<HotKeys> page) {
		HotKeysExample example = new HotKeysExample();
		Criteria criteria = example.createCriteria();
		criteria.andTypeEqualTo(1);
		int totalCount = hotkeyMapper.countByExample(example);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<HotKeys> list = hotkeyMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public HotKeys selectByExample(HotKeys hk) {
		HotKeysExample example = new HotKeysExample();
		Criteria criteria = example.createCriteria();
		if(hk.getId() != null){
			criteria.andIdEqualTo(hk.getId());
		}
		List<HotKeys> list = this.hotkeyMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(HotKeys hk) {
		return this.hotkeyMapper.updateByPrimaryKey(hk);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteHotKeys(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.hotkeyMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	@Override
	public DwzAjaxObject updateHotkey(String resKey,HotKeys hk) {
		int n= this.hotkeyMapper.updateByPrimaryKeySelective(hk);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
