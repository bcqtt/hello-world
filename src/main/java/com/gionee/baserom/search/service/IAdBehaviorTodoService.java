package com.gionee.baserom.search.service;

import com.gionee.baserom.search.pojo.AdBehaviorTodo;
import com.gionee.baserom.search.pojo.AdInfo;

public interface IAdBehaviorTodoService {

	AdBehaviorTodo selectByExample(AdInfo ai);

}
