package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.CardMapper;
import com.gionee.baserom.search.pojo.Card;
import com.gionee.baserom.search.pojo.CardExample;
import com.gionee.baserom.search.pojo.CardExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.ICardService;
import com.gionee.baserom.search.util.StringHelper;

@Service("cardService")
public class CardServiceImpl implements ICardService {
	private final Logger logger = LoggerFactory.getLogger(CardServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private CardMapper cardMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveCard(String resKey,String editType,Card card) {
		int n=0;
		if(editType.equals("add")){
			n = cardMapper.insert(card);
			logger.info("保存分组信息-->" + card.getName());
		}else if(editType.equals("update")){
			n = this.cardMapper.updateByPrimaryKey(card);
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
	public Page<Card> queryPage(Page<Card> page) {
		int totalCount = cardMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Card> list = cardMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public Card selectByExample(Card card) {
		CardExample example = new CardExample();
		Criteria criteria = example.createCriteria();
		if(card.getName()!=null && !StringHelper.isEmpty(card.getName())){			
			criteria.andNameEqualTo(card.getName());
		}else if(card.getId() != null){
			criteria.andIdEqualTo(card.getId());
		}
		List<Card> list = this.cardMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(Card card) {
		return this.cardMapper.updateByPrimaryKey(card);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteCards(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.cardMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 根据id修改showEnable
	 * @param id
	 * @param showEnable
	 * @return
	 */
	public DwzAjaxObject updateCardEnable(String resKey,int id, int showEnable) {
		int n= this.cardMapper.updateCardEnable(id,showEnable);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
