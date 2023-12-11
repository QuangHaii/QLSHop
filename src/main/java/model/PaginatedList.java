package model;

public class PaginatedList {
	private int pageIndex;
	private int pageSize;
	private int totalPages;
	private int startPage;
	private int endPage;
	public PaginatedList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaginatedList(int pageIndex, int pageSize, int totalItem) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.totalPages = (int) Math.ceil((double)totalItem/pageSize);
		this.startPage = 1;
		this.endPage = 7;
		if(this.totalPages < 7) this.endPage = this.totalPages;
		if (pageIndex > 5) {
			this.startPage = pageIndex - 3;
			this.endPage = pageIndex + 3;
			if (this.endPage > this.totalPages)
				this.startPage = this.totalPages - 6;
			this.endPage = this.totalPages;
		}
	}
	
	public int getPageIndex() {
		return pageIndex;
	}
	
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
