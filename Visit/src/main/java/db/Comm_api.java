package db;

public class Comm_api {
	
	public int getPageCount(int numPerPage, int dataCount) {
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0) { // 나머지가 0이 아니면 페이지 하나 더 만듦
			pageCount++;
		}
		return pageCount;
	}
	
	public String pageIndexList(int currentPage, int totalPage, String url) {
		int numPerBlock = 5;
		int currentPageSetup;
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage == 0 || totalPage == 0 ) {
			return "";
		}
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<a href=\"" + url + "?pageNum=" + currentPageSetup + "\"><</a>&nbsp;");
		}
		
		page = currentPageSetup + 1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			if(page == currentPage) {
				sb.append("<b>"+ page + "</font>&nbsp;</b>");
			}else {
				sb.append("<a href=\"" + url + "?pageNum=" + page + "\">" + page + "</a>&nbsp;");
			}
			page++;
		}
		
		if(totalPage - currentPage > numPerBlock) {
			sb.append("<a href=\"" + url + "?pageNum=" + page + "\">></a>&nbsp;");
		}
		
		return sb.toString();
	}

}
