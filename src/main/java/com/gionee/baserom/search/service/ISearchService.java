package com.gionee.baserom.search.service;

import java.util.List;
import java.util.Map;

import com.gionee.baserom.search.pojo.HotkeySource;
 

public interface ISearchService {
 
	public Map<String, Object> getStatus();
	
	public String getUseredSourceCode();
	public HotkeySource getUseredSource();
	public List<HotkeySource> getAllDataSource();
	
	public void updateUseSource(String sourceCode);

	public String getHotkeySourceUrl();
}