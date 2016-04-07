package com.gionee.baserom.search.pojo;

import java.util.List;

/**
 * 分页实体类
 * @author gionee
 *
 */
public class Page<T> {
	
	/** 需要分页的对象集  **/
	List<T> list;
	
	/**
	 * navTab或dialog，用来标记是navTab上的分页还是dialog上的分页
	 */
	private String targetType;
	
	/** 总条数 **/
	private int totalCount;
	
	/** 每页记录条数 **/
	private int numPerPage=10;
	
	/** 页标数字多少个 **/
	private int pageNumShown;
	
	/** 当前第几页 **/
	private int currentPage=1;
	
	private int startIndex;

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public String getTargetType() {
		return targetType;
	}

	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPageNumShown() {
		return pageNumShown;
	}

	public void setPageNumShown(int pageNumShown) {
		this.pageNumShown = pageNumShown;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	/**
	 * 计算总页数
	 * @param numPerPage
	 * @param totalCount
	 * @return
	 */
	public static int countTotalPage(final int numPerPage,final int totalCount){
		int totalPage = totalCount%numPerPage == 0 ? totalCount/numPerPage : totalCount/numPerPage +1;
		return totalPage;
	}

	public int getStartIndex() {
		return numPerPage*(currentPage-1);
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

}
