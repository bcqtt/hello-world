package com.gionee.baserom.search.service;

import java.util.List;
import java.util.Map;

import com.gionee.baserom.search.pojo.HotkeySource;
 

public interface ISearchService {
 
	public Map<String, Object> getStatus();
	
	public String getUseredSourceCode();
	public HotkeySource getUseredSource();
	
	/**
	 * @param i 1：热词采集源。2：联想词采集源
	 * @return
	 */
	public List<HotkeySource> getAllDataSource(int i);
	
	public void updateUseSource(String sourceCode, int type);

	public String getHotkeySourceUrl();

	public List<HotkeySource> getAllAssoSource();
}