package com.gionee.baserom.search.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gionee.baserom.search.common.DwzAjaxObject;
import com.gionee.baserom.search.dao.AppVersionEntranceMapper;
import com.gionee.baserom.search.dao.AppVersionMapper;
import com.gionee.baserom.search.pojo.AppVersion;
import com.gionee.baserom.search.pojo.AppVersionEntrance;
import com.gionee.baserom.search.pojo.AppVersionEntranceKey;
import com.gionee.baserom.search.pojo.AppVersionExample;
import com.gionee.baserom.search.pojo.AppVersionExample.Criteria;
import com.gionee.baserom.search.pojo.Page;
import com.gionee.baserom.search.service.IAppVersionService;
import com.gionee.baserom.search.util.StringHelper;

@Service("appVersionService")
public class AppVersionServiceImpl implements IAppVersionService {
	private final Logger logger = LoggerFactory.getLogger(AppVersionServiceImpl.class);
	private DwzAjaxObject ajaxObj = null;
	
	@Resource
	private AppVersionMapper appVersionMapper;
	
	@Resource
	private AppVersionEntranceMapper appVersionEntranceMapper;

	/**
	 * 保存账信息
	 */
	public DwzAjaxObject saveAppVersion(String resKey,String editType,AppVersion version) {
		int n=0;
		if(editType.equals("add")){
			n = appVersionMapper.insert(version);
			logger.info("保存版本信息-->" + version.getVersion());
		}else if(editType.equals("update")){
			n = this.appVersionMapper.updateByPrimaryKey(version);
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
	public Page<AppVersion> queryPage(Page<AppVersion> page) {
		int totalCount = appVersionMapper.countByExample(null);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AppVersion> list = appVersionMapper.queryByPage(map);
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AppVersion selectByExample(AppVersion version) {
		AppVersionExample example = new AppVersionExample();
		Criteria criteria = example.createCriteria();
		if(version.getVersion()!=null && !StringHelper.isEmpty(version.getVersion())){			
			criteria.andVersionEqualTo(version.getVersion());
		}else if(version.getVid() != null){
			criteria.andVidEqualTo(version.getVid());
		}
		List<AppVersion> list = this.appVersionMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	/**
	 * 根据id修改
	 * @param card
	 * @return
	 */
	public int updateById(AppVersion version) {
		return appVersionMapper.updateByPrimaryKey(version);
	}

	/**
	 * 根据id删除card(包含多行删除)
	 */
	public DwzAjaxObject deleteAppVersion(String resKey,String ids) {
		String[] idArray = ids.split(",");
		int n = 0;
		for(int i=0; i<idArray.length; i++ ){
			n += this.appVersionMapper.deleteByPrimaryKey(Integer.parseInt(idArray[i]));
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
	public Page<AppVersion> queryVersionEntranceList(Page<AppVersion> page) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startIndex", page.getStartIndex());
		map.put("numPerPage", page.getNumPerPage());
		List<AppVersion> list = appVersionMapper.queryVersionEntranceList(map);
		int totalCount = appVersionMapper.queryVersionEntranceCount();
		page.setTotalCount(totalCount);
		page.setList(list);
		return page;
	}

	@Override
	public List<AppVersion> queryAllVersion() {
		return appVersionMapper.selectAllVersion();
	}

	@Override
	public AppVersion selectVersionEntranceByVid(Integer appVersionId) {
		return appVersionMapper.selectVersionEntranceByVid(appVersionId);
	}

	@Override
	public AppVersion selectByVid(Integer vid) {
		return appVersionMapper.selectByPrimaryKey(vid);
	}

	@Override
	public List<AppVersionEntrance> getVersionEntranceKeyByVid(Integer vid) {
		return appVersionEntranceMapper.getVersionEntranceKeyByVid(vid);
	}

}
