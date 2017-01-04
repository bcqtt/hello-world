package com.gionee.baserom.search.util;

import java.net.URL;
import java.util.Properties;
/**
 * 操作.properties文件的工具类
 */
public class PropertiesUtils {
	private static final String PATH_PROPERTIES_FILE = "search-config.properties";
	private static Properties prop = new Properties();

	static {
		try {
			ClassLoader loader = PropertiesUtils.class.getClassLoader();
			if (loader == null)
				loader = ClassLoader.getSystemClassLoader();
			URL url = loader.getResource(PATH_PROPERTIES_FILE);
			prop.load(url.openStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getPropertieByKey(String key) {
		String result = null;
		try {
			result = prop.getProperty(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		
	}
}
