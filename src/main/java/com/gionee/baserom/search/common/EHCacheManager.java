package com.gionee.baserom.search.common;

import net.sf.ehcache.CacheManager;

public class EHCacheManager {
	private static CacheManager cacheManager = null;

	static {
		EHCacheManager.initCacheManager();
	}

	/**
	 * 
	 * 初始化缓存管理容器
	 */
	public static CacheManager initCacheManager() {
		try {
			if (cacheManager == null)
				cacheManager = CacheManager.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cacheManager;
	}

}
