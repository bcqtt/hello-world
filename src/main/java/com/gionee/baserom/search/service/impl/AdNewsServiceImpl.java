package com.gionee.baserom.search.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.common.UpdateImagesRef;
import com.gionee.baserom.search.dao.AdNewsMapper;
import com.gionee.baserom.search.dao.ImagesMapper;
import com.gionee.baserom.search.pojo.AdNews;
import com.gionee.baserom.search.pojo.AdNewsExample;
import com.gionee.baserom.search.pojo.AdNewsExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAdNewsService;

@Service("adNewsService")
public class AdNewsServiceImpl implements IAdNewsService {
	private final Logger logger = LoggerFactory.getLogger(AdNewsServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AdNewsMapper adNewsMapper;
	@Resource
	private ImagesMapper imagesMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAdNews(String resKey,String editType,AdNews an) {
		int n=0;
		if(an.getPos()==null) an.setPos(0);
		UpdateImagesRef.updateImgRef(editType,an,adNewsMapper,imagesMapper);
		if(editType.equals("add")){
			an.setCreateTime(new Date());
			an.setType(0);//0：手动添加的。1：从第三方接口获取的
			n = adNewsMapper.insert(an);
			logger.info("保存广告新闻-->" + an.getName());
		}else if(editType.equals("update")){
			n = this.adNewsMapper.updateByPrimaryKey(an);
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
	public Page<AdNews> queryPage(Page<AdNews> page) {
		int totalCount = adNewsMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AdNews> list = adNewsMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public AdNews selectByExample(AdNews an) {
		AdNewsExample example = new AdNewsExample();
		Criteria criteria = example.createCriteria();
		if(an.getId() != null){
			criteria.andIdEqualTo(an.getId());
		}else if(an.getName() != null){
			criteria.andNameEqualTo(an.getName());
		}else if(an.getLink() != null ){
			criteria.andLinkEqualTo(an.getLink());
		}else if(an.getImg() != null){
			criteria.andImgEqualTo(an.getImg());
		}
		List<AdNews> list = this.adNewsMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(AdNews an) {
		return this.adNewsMapper.updateByPrimaryKey(an);
	}

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteAdNews(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			UpdateImagesRef.updateImgRefWhenDel(Integer.parseInt(idArray[i]), adNewsMapper, imagesMapper);
			n += this.adNewsMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public DwzAjaxObject updateAdNews(String resKey,AdNews an) {
		int n= this.adNewsMapper.updateByPrimaryKeySelective(an);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	@Override
	public List<AdNews> queryAdNewsOfShow() {
		AdNewsExample example = new AdNewsExample();
		Criteria criteria = example.createCriteria();
		criteria.andEnableEqualTo(1);
		return this.adNewsMapper.selectByExample(example);
	}

	@Override
	public int addAdNews(AdNews ad) {
		return adNewsMapper.insert(ad);
	}

	@Override
	public void deleteByType(int type) {
		adNewsMapper.deleteByType(type);
	}

}
