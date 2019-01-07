package blackList;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import blackList.BlackListPagingAction;
import member.MemberVO;

public class BlackListViewAction extends ActionSupport  implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public List<BlackListVO>list = new ArrayList<BlackListVO>();
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private BlackListPagingAction page; 	// 페이징 클래스

	private MemberVO memberResultClass;
    private Map session;
    
	
	
	public BlackListViewAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		list = sqlMapper.queryForList("blackList.selectAll");
		totalCount=list.size();//전체 글 개수
		page=new BlackListPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml=page.getPagingHtml().toString();//페이지HTML생성.
		
		int lastCount = totalCount;
		
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount()+1;
		
		list=list.subList(page.getStartCount(), lastCount);
		
		memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
		
		return SUCCESS;
	}
	

	public List<BlackListVO> getList() {
		return list;
	}

	public void setList(List<BlackListVO> list) {
		this.list = list;
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

	public BlackListPagingAction getPage() {
		return page;
	}

	public void setPage(BlackListPagingAction page) {
		this.page = page;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		BlackListViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public MemberVO getMemberResultClass() {
		return memberResultClass;
	}

	public void setMemberResultClass(MemberVO memberResultClass) {
		this.memberResultClass = memberResultClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		BlackListViewAction.sqlMapper = sqlMapper;
	}
}
