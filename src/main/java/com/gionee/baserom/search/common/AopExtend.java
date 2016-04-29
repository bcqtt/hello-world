package com.gionee.baserom.search.common;


import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.gionee.baserom.search.service.ISearchService;
import com.gionee.baserom.search.util.ApplicationHelper;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

/**
 * AOP扩展
 * @author laizhiwen
 */
@Aspect  
@Component 
public class AopExtend {
	private final Logger logger = LoggerFactory.getLogger(AopExtend.class);
	
	@Before("execution(public void com.gionee.baserom.search.job.impl.*.*DataExtract.execute(..))")  
	public void beforeMethod() {
		logger.info("定时任务执行前切入要做的事情！");
	}
	
	/**
	 * 切换采集源源之后更新缓存
	 */
	@AfterReturning("execution(public void com.gionee.baserom.search.service.impl.SearchServiceImpl.updateUseSource(..))")
	public void afterReturnning() {
		ISearchService searchService = (ISearchService) ApplicationHelper.getApplicationContext().getBean("searchService");
		String hotkey_source_url = searchService.getHotkeySourceUrl();
		Cache cache = EHCacheManager.initCacheManager().getCache("sourceUrlCache");
		cache.removeAll();
		Element element = new Element("cache_hotkey_source_url", hotkey_source_url);
		cache.put(element);
		logger.info("----->切换采集源，更新采集源缓存为:" + hotkey_source_url);
	}
}
