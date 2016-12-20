package com.gionee.baserom.search.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.gionee.baserom.search.dao.AdBehaviorTodoMapper;
import com.gionee.baserom.search.pojo.AdBehaviorTodo;
import com.gionee.baserom.search.pojo.AdBehaviorTodoExample;
import com.gionee.baserom.search.pojo.AdBehaviorTodoExample.Criteria;
import com.gionee.baserom.search.pojo.AdInfo;
import com.gionee.baserom.search.service.IAdBehaviorTodoService;

@Service("adBehaviorTodoService")
public class AdBehaviorTodoServiceImpl implements IAdBehaviorTodoService {
	private final Logger logger = LoggerFactory.getLogger(AdBehaviorTodoServiceImpl.class);
	
	@Resource
	private AdBehaviorTodoMapper adBehaviorTodoMapper;


	/**
	 * 根据Example查询
	 * @param card
	 * @return
	 */
	public AdBehaviorTodo selectByExample(AdInfo ai) {
		AdBehaviorTodoExample example = new AdBehaviorTodoExample();
		Criteria criteria = example.createCriteria();
		if(ai.getAdBehaviorId()!=null){
			criteria.andAdBehaviorIdEqualTo(ai.getAdBehaviorId());
		}
		criteria.andAdIdEqualTo(ai.getId());
		List<AdBehaviorTodo> list = this.adBehaviorTodoMapper.selectByExample(example);
		return list.size()>0?list.get(0):null;
	}

	

}
