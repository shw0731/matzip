package like;

import com.opensymphony.xwork2.ActionSupport;

import like.PagingAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class LikeListAction extends ActionSupport{
	 // 파일 스트림을 위한 reader
    public static Reader reader;
    
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;
    
    private List<LikeVO> likeList = new ArrayList<LikeVO>();
    
    private int currentPage = 1; // 현재 페이지
    private int totalCount; // 총 게시물의 수
    private int blockCount = 10; // 한 페이지의  게시물의 수
    private int blockPage = 5; // 한 화면에 보여줄 페이지 수
    private String pagingHtml; // 페이징을 구현한 html
    private PagingAction page; // 페이징 클래스
    
    public LikeListAction() throws IOException 
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String execute() throws Exception{
    	likeList = sqlMapper.queryForList("likereg.like-list");
    	
    	totalCount = likeList.size(); //전체 좋아요 한 음식점 갯수 구하기
    	
    	//pagingAction객체
        page = new PagingAction(currentPage, totalCount, blockCount, blockPage); 
        pagingHtml = page.getPagingHtml().toString(); // 페이지 html 생성
        
        // 현재 페이지에서 보여줄 마지막 글의 번호 설정
        int lastCount = totalCount;
        
        if(page.getEndCount() < totalCount)
            lastCount = page.getEndCount() + 1;
        
        // 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
        likeList = likeList.subList(page.getStartCount(), lastCount);        
       
        return SUCCESS;
    }
	public List<LikeVO> getLikeList() {
		return likeList;
	}
	public void setList(List<LikeVO> likeList) {
		this.likeList = likeList;
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
}