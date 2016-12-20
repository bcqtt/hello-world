package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AdBehaviorMapper;
import com.gionee.baserom.search.pojo.AdBehavior;
import com.gionee.baserom.search.pojo.AdBehaviorExample;
import com.gionee.baserom.search.pojo.AdBehaviorExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdBehaviorService;
import com.gionee.baserom.search.util.StringHelper;

@Service("adBehaviorService")
public class AdBehaviorServiceImpl implements IAdBehaviorService {
	private final Logger logger = LoggerFactory.getLogger(AdBehaviorServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdBehaviorMapper adBehaviorMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdBehavior(String resKey,String editType,AdBehavior ab) {
		int n=0;
		if(editType.equals("add")){
			n = adBehaviorMapper.insert(ab);
			logger.info("保存广告行为信息-->" + ab.getBehavior());
		}else if(editType.equals("update")){
			n = this.adBehaviorMapper.updateByPrimaryKey(ab);
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
	public Page<AdBehavior> queryPage(Page<AdBehavior> page) {
		int totalCount = adBehaviorMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdBehavior> list = adBehaviorMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdBehavior selectByExample(AdBehavior ab) {
		AdBehaviorExample example = new AdBehaviorExample();
		Criteria criteria = example.createCriteria();
		if(ab.getBehavior()!=null && !StringHelper.isEmpty(ab.getBehavior())){	
			criteria.andBehaviorEqualTo(ab.getBehavior());
		}else if(ab.getId() != null){
			criteria.andIdEqualTo(ab.getId());
		}
		List<AdBehavior> list = this.adBehaviorMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AdBehavior ab) {
		return this.adBehaviorMapper.updateByPrimaryKey(ab);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAdBehavior(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.adBehaviorMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<AdBehavior> getAdBehaviorList() {
		List<AdBehavior> list = this.adBehaviorMapper.getAdBehaviorList();
		return list;
	}

}
