package com.gionee.baserom.search.job.impl.baidu;

import java.util.Map;

public class BaiduDataResult {
	public String boardname;
	public String boarddesc;
	public String boardurl;
	public String updatetime;
	public Map<String,BaiduDataBean> data;
	
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public String getBoarddesc() {
		return boarddesc;
	}
	public void setBoarddesc(String boarddesc) {
		this.boarddesc = boarddesc;
	}
	public String getBoardurl() {
		return boardurl;
	}
	public void setBoardurl(String boardurl) {
		this.boardurl = boardurl;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public Map<String, BaiduDataBean> getData() {
		return data;
	}
	public void setData(Map<String, BaiduDataBean> data) {
		this.data = data;
	}	
}
