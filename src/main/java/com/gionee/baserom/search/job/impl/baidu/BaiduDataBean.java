package com.gionee.baserom.search.job.impl.baidu;

import java.util.Map;

public class BaiduDataBean {
	public String word;
	public int isnew;
	public int srchs;
	public String change;
	public String detailurl;
	public String m_detailurl;
	public Map<String,String[]> links;
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getIsnew() {
		return isnew;
	}
	public void setIsnew(int isnew) {
		this.isnew = isnew;
	}
	public int getSrchs() {
		return srchs;
	}
	public void setSrchs(int srchs) {
		this.srchs = srchs;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getDetailurl() {
		return detailurl;
	}
	public void setDetailurl(String detailurl) {
		this.detailurl = detailurl;
	}
	public String getM_detailurl() {
		return m_detailurl;
	}
	public void setM_detailurl(String m_detailurl) {
		this.m_detailurl = m_detailurl;
	}
	public Map<String, String[]> getLinks() {
		return links;
	}
	public void setLinks(Map<String, String[]> links) {
		this.links = links;
	}


}
