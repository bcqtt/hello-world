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
import com.gionee.baserom.search.dao.AdControlMapper;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.pojo.AdControl;
import com.gionee.baserom.search.pojo.AdControlExample;
import com.gionee.baserom.search.pojo.AdControlExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdService;

@Service("adService")
public class AdServiceImpl implements IAdService {
	private final Logger logger = LoggerFactory.getLogger(AdServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdControlMapper adMapper;
	
	@Resource
	private ImagesMapper imagesMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAd(String resKey,String editType,AdControl ad) {
		int n=0;
		UpdateImagesRef.updateImgRef(editType,ad,adMapper,imagesMapper);
		if(editType.equals("add")){
			n = adMapper.insert(ad);
			logger.info("保存广告图信息-->" + ad.getAdImg());
		}else if(editType.equals("update")){
			n = this.adMapper.updateByPrimaryKey(ad);
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
	public Page<AdControl> queryPage(Page<AdControl> page) {
		int totalCount = adMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdControl> list = adMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public AdControl selectByExample(AdControl ad) {
		AdControlExample example = new AdControlExample();
		Criteria criteria = example.createCriteria();
		if(ad.getId() != null){
			criteria.andIdEqualTo(ad.getId());
		}
		List<AdControl> list = this.adMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(AdControl ad) {
		return this.adMapper.updateByPrimaryKey(ad);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAds(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			UpdateImagesRef.updateImgRefWhenDel(Integer.parseInt(idArray[i]), adMapper, imagesMapper);
			n += this.adMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateAd(String resKey,AdControl ad) {
		int n= this.adMapper.updateByPrimaryKeySelective(ad);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	@Override
	public List<AdControl> queryAdControlOfShow() {
		AdControlExample example = new AdControlExample();
		Criteria criteria = example.createCriteria();
		criteria.andShowFlagEqualTo(1);
		return this.adMapper.selectByExample(example);
	}

}
