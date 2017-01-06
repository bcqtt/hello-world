package com.gionee.baserom.search.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AppVersionMapper;
import com.gionee.baserom.search.dao.SysDictionaryClassifyMapper;
import com.gionee.baserom.search.dao.SysDictionaryMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SysDictionary;
import com.gionee.baserom.search.pojo.SysDictionaryClassify;
import com.gionee.baserom.search.pojo.SysDictionaryClassifyExample;
import com.gionee.baserom.search.pojo.SysDictionaryClassifyExample.Criteria;
import com.gionee.baserom.search.pojo.SysDictionaryExample;
import com.gionee.baserom.search.service.IDictionaryService;
import com.gionee.baserom.search.util.StringHelper;

@Service("dicService")
public class DictionaryServiceImpl implements IDictionaryService {
	private final Logger logger = LoggerFactory.getLogger(DictionaryServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private SysDictionaryClassifyMapper dicClassifyMapper;
	@Resource
	private SysDictionaryMapper dicMapper;
	@Resource
	private AppVersionMapper appVersionMapper;
	
	/**
	 * 保存信息
	 */
	public DwzAjaxObject saveDic(String resKey,String editType,SysDictionary dic) {
		int n=0;
		dic.setClsId(dic.getClassify().getId());
		if(editType.equals("add")){
			n = dicMapper.insert(dic);
			logger.info("保存字典分类信息-->" + dic.getDicValue());
		}else if(editType.equals("update")){
			n = this.dicMapper.updateByPrimaryKey(dic);
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
	public Page<SysDictionary> queryDicPage(Page<SysDictionary> page,String clsId) {
		SysDictionaryExample example = new SysDictionaryExample();
		com.gionee.baserom.search.pojo.SysDictionaryExample.Criteria criteria = example.createCriteria();
		criteria.andClsIdEqualTo(Integer.parseInt(clsId));
		int totalCount = dicMapper.countByExample(Integer.parseInt(clsId)==-1?null:example);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		map.put("clsId", Integer.parseInt(clsId));
		List<SysDictionary> list = dicMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param dic
	 * @return
	 */
	public SysDictionary selectByExample(SysDictionary dic) {
		SysDictionaryExample example = new SysDictionaryExample();
		com.gionee.baserom.search.pojo.SysDictionaryExample.Criteria criteria = example.createCriteria();
		if(dic.getDicValue()!=null && !StringHelper.isEmpty(dic.getDicValue())){			
			criteria.andDicValueEqualTo(dic.getDicValue());
		}else if(dic.getId() != null){
			criteria.andIdEqualTo(dic.getId());
		}
		List<SysDictionary> list = this.dicMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(SysDictionary dic) {
		return this.dicMapper.updateByPrimaryKey(dic);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteDic(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.dicMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	
	/*************以下是字典类型管理的部分************/

	/**
	 * 保存信息
	 */
	public DwzAjaxObject saveDicClassify(String resKey,String editType,SysDictionaryClassify sdc) {
		int n=0;
		if(editType.equals("add")){
			n = dicClassifyMapper.insert(sdc);
			logger.info("保存字典分类信息-->" + sdc.getName());
		}else if(editType.equals("update")){
			n = this.dicClassifyMapper.updateByPrimaryKey(sdc);
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
	public Page<SysDictionaryClassify> queryPage(Page<SysDictionaryClassify> page) {
		int totalCount = dicClassifyMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<SysDictionaryClassify> list = dicClassifyMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public SysDictionaryClassify selectByExample(SysDictionaryClassify dic) {
		SysDictionaryClassifyExample example = new SysDictionaryClassifyExample();
		Criteria criteria = example.createCriteria();
		if(dic.getName()!=null && !StringHelper.isEmpty(dic.getName())){			
			criteria.andNameEqualTo(dic.getName());
		}else if(dic.getId() != null){
			criteria.andIdEqualTo(dic.getId());
		}
		List<SysDictionaryClassify> list = this.dicClassifyMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(SysDictionaryClassify sdc) {
		return this.dicClassifyMapper.updateByPrimaryKey(sdc);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteDicClassify(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.dicClassifyMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<SysDictionaryClassify> queryAllClassify() {
		return this.dicClassifyMapper.queryAllClassify();
	}

	@Override
	public Map<String, Object> getDictionary() {
		List<SysDictionary> specificationList = dicMapper.selectByClassifyRef("ad_specification");
		List<SysDictionary> billingTypeList = dicMapper.selectByClassifyRef("billing_type");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("ad_specification", specificationList);
		map.put("billing_type", billingTypeList);
		return map;
	}

	@Override
	public Map<String, Object> getVersionAndDic() {
		Map<String, Object> dicmap = new HashMap<String, Object>();
		dicmap.put("version", appVersionMapper.selectAllVersion());
		dicmap.put("mechineType", dicMapper.queryByDicKeyMechineType());
		return dicmap;
	}

	@Override
	public Map<String, Object> getDataByIds(String version, String mechineType) {
		Map<String,Object> dicmap = new HashMap<String, Object>();
		dicmap.put("version", appVersionMapper.selectByIds(Arrays.asList(version.split(","))));
		dicmap.put("mechineType", dicMapper.selectByIds(Arrays.asList(mechineType.split(","))));
		return dicmap;
	}

	@Override
	public List<SysDictionary> getDictionaryOfAdType() {
		return dicMapper.selectByClassifyRef("ad_modality");
	}

	@Override
	public List<SysDictionary> getDictionaryByClsRef(String target) {
		return dicMapper.selectByClassifyRef(target);
	}


}
