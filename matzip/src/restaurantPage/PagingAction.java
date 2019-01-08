package restaurantPage;

public class PagingAction {
	private int currentPage; //현재 페이지
	private int totalCount; //전체 게시물 수
	private int totalPage; //전체 페이지 수
	private int blockCount; //한 페이지의 게시물 수
	private int blockPage; //한 화면에 보여줄 페이지 수
	private int startCount; //한 페이지에서 보여줄 게시글의 시작번호
	private int endCount; //한페이지에서 보여줄 게시글의 끝번호
	private int startPage; //시작페이지
	private int endPage; //마지막페이지
	private String filter_address = "";
	private String filter_category = "";
	private String keyword="";
	
	private StringBuffer pagingHtml;
	
	//페이징 생성자
	public PagingAction(int currentPage, int totalCount, int blockCount, int blockPage) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		// 전체 페이지 수
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 block 페이지
		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a href=searchAction.action?currentPage="+(startPage-1)+"&filter_address="+filter_address+"&filter_category="+filter_category+"&keyword="+keyword+">" );
			pagingHtml.append("이전");
			pagingHtml.append("</a>");
		}

		pagingHtml.append("&nbsp;|&nbsp;");

		//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("&nbsp;<b> <font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			} else {
				pagingHtml
						.append("&nbsp;<a href=searchAction.action?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append("&filter_address="+filter_address+"&filter_category="+filter_category+"&keyword="+keyword);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}

			pagingHtml.append("&nbsp;");
		}

		pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("&nbsp;<a href=searchAction.action?currentPage=");
			pagingHtml.append((endPage+1));	
			pagingHtml.append("&filter_address="+filter_address+"&filter_category="+filter_category+"&keyword="+keyword);
			pagingHtml.append(">");
			pagingHtml.append("다음");
			pagingHtml.append("</a>");
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
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

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}