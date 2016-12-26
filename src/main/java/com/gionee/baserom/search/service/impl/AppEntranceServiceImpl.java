package com.gionee.baserom.search.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AppEntranceMapper;
import com.gionee.baserom.search.dao.AppVersionEntranceMapper;
import com.gionee.baserom.search.pojo.AppEntrance;
import com.gionee.baserom.search.pojo.AppEntranceExample;
import com.gionee.baserom.search.pojo.AppEntranceExample.Criteria;
import com.gionee.baserom.search.pojo.AppVersionEntrance;
import com.gionee.baserom.search.pojo.AppVersionEntranceKey;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAppEntranceService;
import com.gionee.baserom.search.util.StringHelper;

@Service("appEntranceService")
public class AppEntranceServiceImpl implements IAppEntranceService {
	private final Logger logger = LoggerFactory.getLogger(AppEntranceServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AppEntranceMapper appEntranceMapper;
	
	@Resource
	private AppVersionEntranceMapper appVersionEntranceMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAppEntrance(String resKey,String editType,AppEntrance entrance) {
		int n=0;
		if(editType.equals("add")){
			n = appEntranceMapper.insert(entrance);
			logger.info("保存入口信息-->" + entrance.getEntrance());
		}else if(editType.equals("update")){
			n = this.appEntranceMapper.updateByPrimaryKey(entrance);
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
	public Page<AppEntrance> queryPage(Page<AppEntrance> page) {
		int totalCount = appEntranceMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AppEntrance> list = appEntranceMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AppEntrance selectByExample(AppEntrance entrance) {
		AppEntranceExample example = new AppEntranceExample();
		Criteria criteria = example.createCriteria();
		if(entrance.getEntrance()!=null && !StringHelper.isEmpty(entrance.getEntrance())){			
			criteria.andEntranceEqualTo(entrance.getEntrance());
		}else if(entrance.getEid() != null){
			criteria.andEidEqualTo(entrance.getEid());
		}
		List<AppEntrance> list = this.appEntranceMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AppEntrance entrance) {
		return appEntranceMapper.updateByPrimaryKey(entrance);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAppEntrance(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.appEntranceMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public List<AppEntrance> queryAllEntrance() {
		List<AppEntrance> list = appEntranceMapper.selectAllEntrance();
		return list;
	}

	@Override
	public DwzAjaxObject saveAppVersionEntrance(String resKey, String editType, AppVersionEntranceKey aek,
			List<Integer> entrancesIds, List<String> targetIds) {
		int num = 0;
		if(entrancesIds.size()==targetIds.size()){
			if(editType.equals("update")){
				int count = appVersionEntranceMapper.deleteByVersionId(aek.getAppVersionId());
			}
			for(int i=0; i<entrancesIds.size(); i++){
				AppVersionEntrance ave = new AppVersionEntrance();
				for(String targetStr:targetIds){
					String targetArray[] = targetStr.split("-");
					if(entrancesIds.get(i)==Integer.parseInt(targetArray[0])){
						ave.setAppVersionId(aek.getAppVersionId());
						ave.setAppEntranceId(entrancesIds.get(i));
						ave.setDicId(Integer.parseInt(targetArray[1]));
					}
				}
				try {
					int n = appVersionEntranceMapper.insert(ave);
					num += n;
				} catch (Exception e) {
					return new DwzAjaxObject("300", "该版本已经存在，不能再新增，可以选择修改。");
				}
			}
		}else{
			return new DwzAjaxObject("300", "入口和跳转页面数量不匹配，请检查！");
		}
		
		if(num>0){
			ajaxObj = new DwzAjaxObject("200", "操作成功！" ,resKey, "", "");
		}else{
			ajaxObj = new DwzAjaxObject("300", "操作失败！");
		}
		return ajaxObj;
	}

	@Override
	public DwzAjaxObject deleteAppVersionEntrance(String resKey, String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.appVersionEntranceMapper.deleteByVersionId(Integer.parseInt(idArray[i]));
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
