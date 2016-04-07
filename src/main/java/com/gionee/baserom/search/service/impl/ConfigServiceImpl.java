package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.ConfigMapper;
import com.gionee.baserom.search.pojo.Config;
import com.gionee.baserom.search.pojo.ConfigExample;
import com.gionee.baserom.search.pojo.ConfigExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IConfigService;
import com.gionee.baserom.search.util.StringHelper;

@Service("configService")
public class ConfigServiceImpl implements IConfigService {
	private final Logger logger = LoggerFactory.getLogger(ConfigServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private ConfigMapper configMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveConfig(String resKey,String editType,Config config) {
		int n=0;
		if(config.getStatus()==null){
			config.setStatus(0);
		}
		if(editType.equals("add")){
			n = configMapper.insert(config);
			logger.info("保存参数信息-->" + config.getName());
		}else if(editType.equals("update")){
			n = this.configMapper.updateByPrimaryKey(config);
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
	public Page<Config> queryPage(Page<Config> page) {
		int totalCount = configMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Config> list = configMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public Config selectByExample(Config config) {
		ConfigExample example = new ConfigExample();
		Criteria criteria = example.createCriteria();
		if(config.getName()!=null && !StringHelper.isEmpty(config.getName())){			
			criteria.andNameEqualTo(config.getName());
		}else if(config.getId() != null){
			criteria.andIdEqualTo(config.getId());
		}
		List<Config> list = this.configMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(Config config) {
		return this.configMapper.updateByPrimaryKey(config);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteConfigs(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.configMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}
}
