package search;

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.interceptor.SessionAware;

import java.util.*;
import java.io.Reader;
import java.io.File;
import java.io.IOException;

import restaurantPage.BoardVO;
import restaurantPage.PagingAction;

public class SearchAction extends ActionSupport implements SessionAware{ //공공 클래스인 가게리스트액션을 액션 서포트로 확장한다.
	public static Reader reader;
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<BoardVO> restList = new ArrayList<BoardVO>();;	 
	
	private Map session;
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private PagingAction page; 	// 페이징 클래스
	
	
	
	private List<String> images = new ArrayList<String>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";	//업로드 경로
	/*C:\\Java\\upload\\YammyList\\*/
	
	public SearchAction() throws IOException { //가게페이지액션에서 나오는 IOException을 처리하는 클래스)
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	
	public String execute() throws Exception { 
	restList = sqlMapper.queryForList("rest.selectAll"); 

	totalCount = restList.size(); // 전체 글 갯수를 구한다. //list의 갯수를 totalcount 객체로 저장한다.
	// pagingAction 객체 생성. currentPage, totalCount, blockCount, blockPage 값을 꺼내어 page값에 저장해준다.
	page = new PagingAction(currentPage, totalCount, blockCount, blockPage); 
	pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

	// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
	int lastCount = totalCount;

	// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 
	//lastCount를 +1 번호로 설정.
	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
	restList = restList.subList(page.getStartCount(), lastCount);

	return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRestList(List<BoardVO> restList) {
		this.restList = restList;
	}

	public List<BoardVO> getRestList() {
		return restList;
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

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}

	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}

	public List<String> getUploadsContentType() {
		return uploadsContentType;
	}

	public void setUploadsContentType(List<String> uploadsContentType) {
		this.uploadsContentType = uploadsContentType;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	

}