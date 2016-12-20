package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AppUriMapper;
import com.gionee.baserom.search.pojo.AppUri;
import com.gionee.baserom.search.pojo.AppUriExample;
import com.gionee.baserom.search.pojo.AppUriExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAppUriService;

@Service("uriService")
public class AppUriServiceImpl implements IAppUriService {
	private final Logger logger = LoggerFactory.getLogger(AppUriServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AppUriMapper uriMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveUri(String resKey,String editType,AppUri uri) {
		int n=0;
		String uri_ = uri.getUri();
		String type = uri_.substring(0, uri_.indexOf(":"));
		uri.setType(type);
		if(editType.equals("add")){
			n = uriMapper.insert(uri);
			logger.info("保存信息-->" + uri.getUri());
		}else if(editType.equals("update")){
			n = this.uriMapper.updateByPrimaryKey(uri);
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
	public Page<AppUri> queryPage(Page<AppUri> page) {
		int totalCount = uriMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AppUri> list = uriMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AppUri selectByExample(AppUri uri) {
		AppUriExample example = new AppUriExample();
		Criteria criteria = example.createCriteria();
		if(uri.getId() != null){
			criteria.andIdEqualTo(uri.getId());
		}
		List<AppUri> list = this.uriMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @return
	 */
	public int updateById(AppUri uri) {
		return this.uriMapper.updateByPrimaryKey(uri);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteUris(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.uriMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
