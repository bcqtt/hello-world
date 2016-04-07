package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Card;
import com.gionee.baserom.search.pojo.Page;

public interface ICardService {
	
	/**
	 * 保存分组信息
	 * @param group
	 * @param editType
	 */
	public DwzAjaxObject saveCard(String resKey,String editType,Card card);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<Card> queryPage(Page<Card> page);
	
	/**
	 * 根据Example查询
	 * @param group
	 * @return
	 */
	public Card selectByExample(Card card);

	/**
	 * 根据id修改
	 * @param group
	 * @return
	 */
	public int updateById(Card card);

	/**
	 * 根据id删除group(包含多行删除)
	 */
	public DwzAjaxObject deleteCards(String resKey,String ids);

	/**
	 * 根据id修改showEnable
	 * @param id
	 * @param showEnable
	 * @return
	 */
	public DwzAjaxObject updateCardEnable(String resKey,int id, int showEnable);

}
