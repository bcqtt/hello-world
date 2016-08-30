package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.RostersMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.Rosters;
import com.gionee.baserom.search.pojo.RostersExample;
import com.gionee.baserom.search.pojo.RostersExample.Criteria;
import com.gionee.baserom.search.service.IRostersService;

@Service("rostersService")
public class RostersServiceImpl implements IRostersService {
	private final Logger logger = LoggerFactory.getLogger(RostersServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private RostersMapper rostersMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveRosters(String resKey,String editType,Rosters rosters) {
		int n=0;
		if(editType.equals("add")){
			n = rostersMapper.insert(rosters);
			logger.info("保存自定义热词信息-->" + rosters.getPackagename());
		}else if(editType.equals("update")){
			n = this.rostersMapper.updateByPrimaryKey(rosters);
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
	public Page<Rosters> queryPage(Page<Rosters> page) {
		int totalCount = rostersMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Rosters> list = rostersMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public Rosters selectByExample(Rosters r) {
		RostersExample example = new RostersExample();
		Criteria criteria = example.createCriteria();
		if(r.getId() != null){
			criteria.andIdEqualTo(r.getId());
		}
		List<Rosters> list = this.rostersMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(Rosters r) {
		return this.rostersMapper.updateByPrimaryKey(r);
	}

	/**
	 * 根据id删除(包含多行删除)
	 */
	public DwzAjaxObject deleteRosters(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.rostersMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateRosters(String resKey,Rosters r) {
		int n= this.rostersMapper.updateByPrimaryKeySelective(r);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
