package com.gionee.baserom.search.common;

/**
 * 返回dwz框架的操作状态提示，对象须转成JSON数据输出
 *
 */
public class DwzAjaxObject {
	
	/**
	 * 服务器状态码：200/300/301/400/403/404  ，等
	 */
	private String statusCode;
	
	/**
	 * 操作提示消息，给用户看的提示信息。
	 */
	private String message;
	
	/**
	 * 操作完成后需要刷新的Tab页面，比如删除、修改、添加之后，需要刷新页面的
	 */
	private String navTabId;
	
	/**
	 * 需要刷新的DIV的ID
	 */
	private String rel;
	
	/**
	 * 不需要时，值使用空字符串
	 * closeCurrent：关闭当前tab
	 * forward：使用forward时需要配置forwardUrl
	 */
	private String callbackType;
	
	/**
	 * 不需要时，值使用空字符串
	 * callbackType的值为forward时，配置相应的跳转页面
	 */
	private String forwardUrl;
	
	public DwzAjaxObject(){}
	
	/**
	 * 操作成功,需要返回200时使用
	 * @return
	 */
	public DwzAjaxObject(String statusCode,String message,String navTabId,
			String callbackType,String forwardUrl){
		this.statusCode = statusCode;
		this.message = message;
		this.navTabId = navTabId;
		this.callbackType = callbackType;
		this.forwardUrl = forwardUrl;
	}
	
	public static DwzAjaxObject getAjaxResult(String statusCode,String message,String rel,
			String callbackType,String forwardUrl){
		DwzAjaxObject dao = new DwzAjaxObject();
		dao.setStatusCode(statusCode);
		dao.setMessage(message);
		dao.setRel(rel);
		dao.setCallbackType(callbackType);
		dao.setForwardUrl(forwardUrl);
		return dao;
	}
	
	/**
	 * 操作失败,需要返回300、301时使用
	 * @return
	 */
	public DwzAjaxObject(String statusCode,String message){
		this.statusCode = statusCode;
		this.message = message;
	}
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNavTabId() {
		return navTabId;
	}
	public void setNavTabId(String navTabId) {
		this.navTabId = navTabId;
	}
	public String getCallbackType() {
		return callbackType;
	}
	public void setCallbackType(String callbackType) {
		this.callbackType = callbackType;
	}
	public String getForwardUrl() {
		return forwardUrl;
	}
	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}

	public String getRel() {
		return rel;
	}

	public void setRel(String rel) {
		this.rel = rel;
	}
	
}
