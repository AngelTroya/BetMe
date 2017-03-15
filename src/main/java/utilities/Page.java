package utilities;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int currentPageNo;
	private int start;
	private int end;
	private int totalCount;
	// default size is 10
	private int pageSize = 10;

	private int pageCount;

	public Page(int currentPageNo) {
		this.currentPageNo = currentPageNo;

	}

	public int getPageCount() {
		pageCount = totalCount / this.pageSize;
		if (totalCount % this.pageSize == 0)
			return pageCount;
		else
			return pageCount + 1;

	}

	public int getStart() {
		start = (currentPageNo - 1) * this.pageSize;
		return start;
	}

	public int getEnd() {
		end = getStart() + getPageSize();
		if (this.totalCount > 0 && end > this.totalCount) {
			end = totalCount;
		}
		return end;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
