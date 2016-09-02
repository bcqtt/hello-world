package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.VersionMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Version;
import com.gionee.baserom.search.pojo.VersionExample;
import com.gionee.baserom.search.pojo.VersionExample.Criteria;
import com.gionee.baserom.search.service.IVersionService;

@Service("versionService")
public class VersionServiceImpl implements IVersionService {
	private final Logger logger = LoggerFactory.getLogger(VersionServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private VersionMapper versionMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveVersion(String resKey,String editType,Version version) {
		int n=0;
		if(editType.equals("add")){
			n = versionMapper.insert(version);
			logger.info("保存版本信息信息-->" + version.getVersion());
		}else if(editType.equals("update")){
			n = this.versionMapper.updateByPrimaryKey(version);
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
	public Page<Version> queryPage(Page<Version> page) {
		int totalCount = versionMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Version> list = versionMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public Version selectByExample(Version v) {
		VersionExample example = new VersionExample();
		Criteria criteria = example.createCriteria();
		if(v.getId() != null){
			criteria.andIdEqualTo(v.getId());
		}
		List<Version> list = this.versionMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(Version v) {
		return this.versionMapper.updateByPrimaryKey(v);
	}

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteVersion(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.versionMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateVersion(String resKey,Version v) {
		int n= this.versionMapper.updateByPrimaryKeySelective(v);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	@Override
	public List<Version> queryUsertypeList() {
		List<Version> vlist = this.versionMapper.queryUsertypeList();
		return vlist;
	}

}
