package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.HotkeySourceMapper;
import com.gionee.baserom.search.pojo.HotkeySource;
import com.gionee.baserom.search.pojo.HotkeySourceExample;
import com.gionee.baserom.search.pojo.HotkeySourceExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IHotkeySourceService;

@Service("hotkeySourceService")
public class HotkeySourceServiceImpl implements IHotkeySourceService {
	private final Logger logger = LoggerFactory.getLogger(HotkeySourceServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private HotkeySourceMapper hotkeySourceMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveHotkeySource(String resKey,String editType,HotkeySource source) {
		int n=0;
		if(editType.equals("add")){
			n = hotkeySourceMapper.insert(source);
			logger.info("保存采集源信息-->" + source.getSourceCode());
		}else if(editType.equals("update")){
			n = this.hotkeySourceMapper.updateByPrimaryKey(source);
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
	public Page<HotkeySource> queryPage(Page<HotkeySource> page,int type) {
		int totalCount = hotkeySourceMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		map.put("type", type);
		List<HotkeySource> list = hotkeySourceMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public HotkeySource selectByExample(HotkeySource source) {
		HotkeySourceExample example = new HotkeySourceExample();
		Criteria criteria = example.createCriteria();
		if(source.getId() != null){
			criteria.andIdEqualTo(source.getId());
		}
		List<HotkeySource> list = this.hotkeySourceMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(HotkeySource source) {
		return this.hotkeySourceMapper.updateByPrimaryKey(source);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteHotkeySources(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.hotkeySourceMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateHotkeySource(String resKey,HotkeySource source) {
		int n= this.hotkeySourceMapper.updateByPrimaryKeySelective(source);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
