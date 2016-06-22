package com.gionee.baserom.search.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gionee.baserom.search.service.ISearchService;
import com.gionee.baserom.search.util.ApplicationHelper;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/**
 * 系统启动时初始化采集源缓存，避免每次运行定时任务都访问数据库
 * @author gionee
 *
 */
public class InitSysCacheServlet extends HttpServlet {
	private static final long serialVersionUID = -4998426402351115124L;
	private final Logger logger = LoggerFactory.getLogger(InitSysCacheServlet.class);
	
	public void init() throws ServletException {
		ISearchService searchService = (ISearchService) ApplicationHelper.getApplicationContext().getBean("searchService");
		String hotkey_source_url = searchService.getHotkeySourceUrl();
		
		CacheManager cacheManager = CacheManager.create();
		Cache sourceUrlCache = cacheManager.getCache("sourceUrlCache");
		Element element = new Element("cache_hotkey_source_url", hotkey_source_url);
		sourceUrlCache.put(element);
		logger.info("----->系统初始化采集源缓存，数量为：" + sourceUrlCache.getSize());
		
//		Element result = sourceUrlCache.get("cache_hotkey_source_url");
//		logger.info("从缓存读取的数据为：" + result.getValue());
	}
}
