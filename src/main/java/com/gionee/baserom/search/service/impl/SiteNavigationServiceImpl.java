package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.common.UpdateImagesRef;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.dao.SiteNavigationMapper;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.pojo.SiteNavigation;
import com.gionee.baserom.search.pojo.SiteNavigationExample;
import com.gionee.baserom.search.pojo.SiteNavigationExample.Criteria;
import com.gionee.baserom.search.service.ISiteNavigationService;
import com.gionee.baserom.search.util.StringHelper;

@Service("siteNavigationService")
public class SiteNavigationServiceImpl implements ISiteNavigationService {
	private final Logger logger = LoggerFactory.getLogger(SiteNavigationServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private SiteNavigationMapper siteNavigationMapper;
	@Resource
	private ImagesMapper imagesMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveSite(String resKey,String editType,SiteNavigation site) {
		int n=0;
		UpdateImagesRef.updateImgRef(editType,site,siteNavigationMapper,imagesMapper);
		if(editType.equals("add")){
			n = siteNavigationMapper.insert(site);
			logger.info("保存网址信息-->" + site.getSiteName());
		}else if(editType.equals("update")){
			n = this.siteNavigationMapper.updateByPrimaryKey(site);
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
	 * @param dataStatus : new:表示新版本数据列表，old:表示旧版本数据列表
	 * @return
	 */
	public Page<SiteNavigation> queryPage(Page<SiteNavigation> page,SiteNavigation site,String dataStatus) {
		if(site.getType()==null || site.getType().equals("")){
			site.setType(-1);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		map.put("dataStatus", dataStatus);
		map.put("site", site);
		int totalCount = siteNavigationMapper.queryCount(map);
		List<SiteNavigation> list = siteNavigationMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public SiteNavigation selectByExample(SiteNavigation site) {
		SiteNavigationExample example = new SiteNavigationExample();
		Criteria criteria = example.createCriteria();
		if(site.getSiteName()!=null && !StringHelper.isEmpty(site.getSiteName())){			
			criteria.andSiteNameEqualTo(site.getSiteName());
		}else if(site.getId() != null){
			criteria.andIdEqualTo(site.getId());
		}
		List<SiteNavigation> list = this.siteNavigationMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(SiteNavigation site) {
		return this.siteNavigationMapper.updateByPrimaryKey(site);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteSites(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			UpdateImagesRef.updateImgRefWhenDel(Integer.parseInt(idArray[i]),siteNavigationMapper,imagesMapper);
			n += this.siteNavigationMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateSite(String resKey,SiteNavigation site) {
		int n= this.siteNavigationMapper.updateByPrimaryKeySelective(site);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
