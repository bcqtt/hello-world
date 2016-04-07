package com.gionee.baserom.search.service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.Page;

public interface IAccountService {
	
	/**
	 * 保存账号信息
	 * @param account
	 */
	public DwzAjaxObject saveAccount(String resKey,String editType,Account account);

	/**
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<Account> queryPage(Page<Account> page);
	
	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public Account selectByExample(Account account);

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(Account account);

	/**
	 * 根据id删除account(包含多行删除)
	 */
	public DwzAjaxObject deleteAccounts(String resKey,String ids);

}
