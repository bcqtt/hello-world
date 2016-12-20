package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AdDisplayRuleMapper;
import com.gionee.baserom.search.pojo.AdDisplayRule;
import com.gionee.baserom.search.pojo.AdDisplayRuleExample;
import com.gionee.baserom.search.pojo.AdDisplayRuleExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdDisplayRuleService;
import com.gionee.baserom.search.util.StringHelper;

@Service("adDisplayRuleService")
public class AdDisplayRuleServiceImpl implements IAdDisplayRuleService {
	private final Logger logger = LoggerFactory.getLogger(AdDisplayRuleServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdDisplayRuleMapper adDisplayRuleMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdRule(String resKey,String editType,AdDisplayRule adr) {
		int n=0;
		if(editType.equals("add")){
			n = adDisplayRuleMapper.insert(adr);
			logger.info("保存广告规则信息-->" + adr.getAdPosition());
		}else if(editType.equals("update")){
			n = this.adDisplayRuleMapper.updateByPrimaryKey(adr);
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
	public Page<AdDisplayRule> queryPage(Page<AdDisplayRule> page) {
		int totalCount = adDisplayRuleMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdDisplayRule> list = adDisplayRuleMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdDisplayRule selectByExample(AdDisplayRule adr) {
		AdDisplayRuleExample example = new AdDisplayRuleExample();
		Criteria criteria = example.createCriteria();
		if(adr.getAdPosition()!=null && !StringHelper.isEmpty(adr.getAdPosition())){			
			criteria.andAdPositionEqualTo(adr.getAdPosition());
		}else if(adr.getId() != null){
			criteria.andIdEqualTo(adr.getId());
		}
		List<AdDisplayRule> list = this.adDisplayRuleMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AdDisplayRule adr) {
		return this.adDisplayRuleMapper.updateByPrimaryKey(adr);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAdRule(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.adDisplayRuleMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<AdDisplayRule> queryAllAdRule() {
		return adDisplayRuleMapper.queryAllAdRule();
	}

}
