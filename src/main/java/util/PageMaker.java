package util;

public class PageMaker {
	// 정렬기준과 현재페이지에 대한 정보 저장
	private Criteria cri;
	// 전체 게시물의 수
	private int totalCount;
	// 시작 페이지 블럭 번호
	private int startPage;
	// 마지막 페이지 블럭 번호
	private int endPage;
	// 한번에 보여줄 페이지 번호 개수
	private int displayPageNum;
	// 전체 페이지 블럭 수
	private int maxPage;
	// 이전 페이지 존재 유무
	private boolean prev;
	// 다음 페이지 존재 유무
	private boolean next;
	
	public PageMaker() {
		this.cri = new Criteria();
		this.displayPageNum = 5;
	}
	// 페이지 블럭에 필요한 계산
	public void calcPaging() {
		endPage = (int)Math.ceil(cri.getPage()/(double)displayPageNum)
				  * displayPageNum;
		
		startPage = (endPage - displayPageNum) + 1;
		
		maxPage = (int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		prev = (startPage > 1) ? true : false;
		next = (endPage == maxPage) ? false : true;
	}
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calcPaging();
	}
	
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	
	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", displayPageNum=" + displayPageNum + ", maxPage=" + maxPage + ", prev=" + prev + ", next="
				+ next + "]";
	}
}









