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
import com.gionee.baserom.search.dao.AccountMapper;
import com.gionee.baserom.search.dao.AccountRoleMapper;
import com.gionee.baserom.search.pojo.Account;
import com.gionee.baserom.search.pojo.AccountExample;
import com.gionee.baserom.search.pojo.AccountExample.Criteria;
import com.gionee.baserom.search.pojo.AccountRoleKey;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAccountService;
import com.gionee.baserom.search.util.StringHelper;

@Service("accountService")
public class AccountServiceImpl implements IAccountService {
	private final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AccountMapper accountMapper;
	@Resource
	private AccountRoleMapper accountRoleMapper;

	/**
	 * 保存账号信息
	 */
	public DwzAjaxObject saveAccount(String resKey,String editType,Account account) {
		AccountExample example = new AccountExample();
		Criteria criteria = example.createCriteria();
		criteria.andAccountNameEqualTo(account.getAccountName());
		List<Account> list = accountMapper.selectByExample(example);
		if(list.size()>0){
			Account a = list.get(0);
			if(account.getId()==null || !account.getId().equals(a.getId())){
				ajaxObj = new DwzAjaxObject("300", "账号名："+account.getAccountName()+"，已经存在！");
				return ajaxObj;
			}
		}
		int n=0;
		if(editType.equals("add")){
			account.setPassword(StringHelper.md5(account.getPassword()));
			account.setCreateTime(new Date());
			n = accountMapper.insert(account);
			
			AccountRoleKey ark = new AccountRoleKey();
			ark.setAccountId(account.getId());
			ark.setRoleId(account.getGroupId());
			accountRoleMapper.insert(ark);
			logger.info("保存账号信息-->" + account.getAccountName());
		}else if(editType.equals("update")){
			AccountRoleKey ark = accountRoleMapper.queryByAccountId(account.getId());
			if(ark == null){
				AccountRoleKey ar = new AccountRoleKey();
				ar.setRoleId(account.getGroupId());
				ar.setAccountId(account.getId());
				accountRoleMapper.insert(ar);
			}else if(ark.getRoleId()!=account.getGroupId()){
				ark.setRoleId(account.getGroupId());
				accountRoleMapper.uppdateRoleId(ark);
			}
			if(account.getPassword().length()!=32){
				account.setPassword(StringHelper.md5(account.getPassword()));
			}
			n = this.accountMapper.updateByPrimaryKey(account);
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
	 * 分页查询账号信息
	 * @param page
	 * @return
	 */
	public Page<Account> queryPage(Page<Account> page) {
		int totalCount = accountMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<Account> list = accountMapper.queryByPage2(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param account
	 * @return
	 */
	public Account selectByExample(Account account) {
		AccountExample example = new AccountExample();
		Criteria criteria = example.createCriteria();
		if(account.getAccountName()!=null && !StringHelper.isEmpty(account.getAccountName())){			
			criteria.andAccountNameEqualTo(account.getAccountName());
		}else if(account.getId() != null){
			criteria.andIdEqualTo(account.getId());
		}
		List<Account> accountList = this.accountMapper.selectByExample(example);
		return accountList.size()>0?accountList.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param account
	 * @return
	 */
	public int updateById(Account account) {
		return this.accountMapper.updateByPrimaryKey(account);
	}

	/**
	 * 根据id删除account(包含多行删除)
	 */
	public DwzAjaxObject deleteAccounts(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			if(Integer.parseInt(idArray[i]) == 1){
				n = -1;
				break;
			}
			this.accountRoleMapper.deleteByAccountId(idArray[i]);
			n += this.accountMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
		}
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else if(n<0){
			ajaxObj = new DwzAjaxObject("300", "不能删除根账号，重新选择！");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		logger.info("----->删除"+n+"行记录");
		return ajaxObj;
	}

	/**
	 * 修改正好密码
	 */
	public DwzAjaxObject updatePassword(Account acc) {
		int n = this.accountMapper.updateByPrimaryKey(acc);
		if(n>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,"", "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

}
