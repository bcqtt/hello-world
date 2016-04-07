package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.LifeServiceMapper;
import com.gionee.baserom.search.pojo.LifeService;
import com.gionee.baserom.search.pojo.LifeServiceExample;
import com.gionee.baserom.search.pojo.LifeServiceExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.ILifeServiceService;
import com.gionee.baserom.search.util.StringHelper;

@Service("lifeService")
public class LifeServiceServiceImpl implements ILifeServiceService {
	private final Logger logger = LoggerFactory.getLogger(LifeServiceServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private LifeServiceMapper lifeServiceMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveLife(String resKey,String editType,LifeService life) {
		int n=0;
		if(editType.equals("add")){
			n = lifeServiceMapper.insert(life);
			logger.info("保存生活服务信息-->" + life.getSiteName());
		}else if(editType.equals("update")){
			n = this.lifeServiceMapper.updateByPrimaryKey(life);
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
	public Page<LifeService> queryPage(Page<LifeService> page) {
		int totalCount = lifeServiceMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<LifeService> list = lifeServiceMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public LifeService selectByExample(LifeService life) {
		LifeServiceExample example = new LifeServiceExample();
		Criteria criteria = example.createCriteria();
		if(life.getSiteName()!=null && !StringHelper.isEmpty(life.getSiteName())){			
			criteria.andSiteNameEqualTo(life.getSiteName());
		}else if(life.getId() != null){
			criteria.andIdEqualTo(life.getId());
		}
		List<LifeService> list = this.lifeServiceMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(LifeService life) {
		return this.lifeServiceMapper.updateByPrimaryKey(life);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteLifeServices(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.lifeServiceMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 根据id修改showEnable
	 * @param id
	 * @param showEnable
	 * @return
	 */
	public DwzAjaxObject updateLifeService(String resKey,LifeService life) {
		int n= this.lifeServiceMapper.updateByPrimaryKeySelective(life);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
