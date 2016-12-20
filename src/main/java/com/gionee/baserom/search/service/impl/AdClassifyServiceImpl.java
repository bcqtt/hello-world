package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AdClassifyMapper;
import com.gionee.baserom.search.pojo.AdClassify;
import com.gionee.baserom.search.pojo.AdClassifyExample;
import com.gionee.baserom.search.pojo.AdClassifyExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdClassifyService;
import com.gionee.baserom.search.util.StringHelper;

@Service("adClsService")
public class AdClassifyServiceImpl implements IAdClassifyService {
	private final Logger logger = LoggerFactory.getLogger(AdClassifyServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdClassifyMapper adClassifyMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdCls(String resKey,String editType,AdClassify adc) {
		int n=0;
		if(editType.equals("add")){
			n = adClassifyMapper.insert(adc);
			logger.info("保存广告分类信息-->" + adc.getCname());
		}else if(editType.equals("update")){
			n = this.adClassifyMapper.updateByPrimaryKey(adc);
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
	public Page<AdClassify> queryPage(Page<AdClassify> page) {
		int totalCount = adClassifyMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdClassify> list = adClassifyMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdClassify selectByExample(AdClassify adc) {
		AdClassifyExample example = new AdClassifyExample();
		Criteria criteria = example.createCriteria();
		if(adc.getCname()!=null && !StringHelper.isEmpty(adc.getCname())){			
			criteria.andCnameEqualTo(adc.getCname());
		}else if(adc.getCid() != null){
			criteria.andCidEqualTo(adc.getCid());
		}
		List<AdClassify> list = this.adClassifyMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AdClassify adc) {
		return this.adClassifyMapper.updateByPrimaryKey(adc);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAdCls(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.adClassifyMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<AdClassify> getAllClassify() {
		return adClassifyMapper.getAllClassify();
	}

}
