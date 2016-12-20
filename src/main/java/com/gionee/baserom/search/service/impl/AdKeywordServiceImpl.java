package com.gionee.baserom.search.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AdKeywordMapper;
import com.gionee.baserom.search.pojo.AdKeyword;
import com.gionee.baserom.search.pojo.AdKeywordExample;
import com.gionee.baserom.search.pojo.AdKeywordExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdKeywordService;
import com.gionee.baserom.search.util.StringHelper;

@Service("adKeywordService")
public class AdKeywordServiceImpl implements IAdKeywordService {
	private final Logger logger = LoggerFactory.getLogger(AdKeywordServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdKeywordMapper adKeywordMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdKeyword(String resKey,String editType,AdKeyword keyword) {
		int n=0;
		if(editType.equals("add")){
			if(checkExist(keyword.getKeyword())){
				return new DwzAjaxObject("300", "已经存在：<span style=\"color:red;\">" + keyword.getKeyword() + "</span>");
			}
			keyword.setKeyword(keyword.getKeyword().toLowerCase());
			n = adKeywordMapper.insert(keyword);
			logger.info("保存关键字信息-->" + keyword.getKeyword());
		}else if(editType.equals("update")){
			try {
				n = this.adKeywordMapper.updateByPrimaryKey(keyword);
			} catch (Exception e) {
				return new DwzAjaxObject("300", "已经存在：<span style=\"color:red;\">" + keyword.getKeyword() + "</span>");
			}
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
	 * 上传txt文本信息
	 */
	public DwzAjaxObject uploadAdKeyword(String resKey,List<String> list) {
		int number = 0;
		List<String> keyList = StringHelper.filtrationDuplicate(list);
		List<String> newlist = new ArrayList<String>();
		for (int i = 0; i < keyList.size(); i++) {
			if(checkExist(keyList.get(i))){
				continue ;
			}else{
				number++;
				newlist.add(keyList.get(i));
			}
		}
		
		int n = 0;
		if(newlist.size()>0){
			n = adKeywordMapper.saveBatchKeyword(newlist);
		}else{
			return new DwzAjaxObject("300", "全部关键字都已存在。" );
		}
		if(n == number && n!=0){
			ajaxObj = new DwzAjaxObject("200", "成功保存 "+n+" 个关键字" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		
		return ajaxObj;
	}
	
	
	/**
	 * 判断输入的关键字是否存在
	 * @param keyword
	 * @return true:存在  ； false:不存在
	 */
	private boolean checkExist(String keyword){
		AdKeywordExample example = new AdKeywordExample();
		Criteria c = example.createCriteria();
		c.andKeywordEqualTo(keyword.toLowerCase());
		List<AdKeyword> akList = adKeywordMapper.selectByExample(example);
		return akList.size()>0?true:false;
	}

	/**
	 * 分页查询信息
	 * @param page
	 * @return
	 */
	public Page<AdKeyword> queryPage(Page<AdKeyword> page) {
		int totalCount = adKeywordMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdKeyword> list = adKeywordMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdKeyword selectByExample(AdKeyword keyword) {
		AdKeywordExample example = new AdKeywordExample();
		Criteria criteria = example.createCriteria();
		if(keyword.getKeyword()!=null && !StringHelper.isEmpty(keyword.getKeyword())){			
			criteria.andKeywordEqualTo(keyword.getKeyword());
		}else if(keyword.getId() != null){
			criteria.andIdEqualTo(keyword.getId());
		}
		List<AdKeyword> list = this.adKeywordMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AdKeyword keyword) {
		return this.adKeywordMapper.updateByPrimaryKey(keyword);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAdKeyword(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.adKeywordMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<AdKeyword> getAllKeyword() {
		return adKeywordMapper.selectAllKeyword();
	}


	@Override
	public List<AdKeyword> getSelectedKeyword(String[] ids) {
		if(ids.length==0){
			return null;
		}else{
			return adKeywordMapper.getSelectedKeyword(Arrays.asList(ids));
		}
	}
}
