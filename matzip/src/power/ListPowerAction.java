package power;

import com.opensymphony.xwork2.ActionSupport;

import blackList.BlackListPagingAction;
import member.MemberVO;
import power.PowerVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.interceptor.SessionAware;
import java.io.Reader;
import java.io.IOException;
import java.util.*;

public class ListPowerAction extends ActionSupport implements SessionAware{

	public static Reader reader; // 파일 스크림을 위한 reader
    
	// SqlMapClient API를 사용하기 위한 sqlMapper 객체
	public static SqlMapClient sqlMapper;
	private Map session;
	private List<PowerVO> list = new ArrayList<PowerVO>();
	private int restaurantNo;
	private PowerVO paramClass;
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private PowerLinkPagingAction page; 	// 페이징 클래스
	
	
	private PowerVO ResultClass;

	public ListPowerAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String excute() throws Exception{
		
		paramClass = new PowerVO();
		paramClass.setRestaurantNo(getRestaurantNo());
		
		list = sqlMapper.queryForList("power.selectNo");
		
		totalCount=list.size();//전체 글 개수
		page=new PowerLinkPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml=page.getPagingHtml().toString();//페이지HTML생성.
		
		int lastCount = totalCount;
		
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount()+1;
		
		list=list.subList(page.getStartCount(), lastCount);
		
		ResultClass = (PowerVO) sqlMapper.queryForObject("power.selectOne", paramClass);
		
		return SUCCESS;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public List<PowerVO> getList() {
		return list;
	}
	public void setList(List<PowerVO> list) {
		this.list = list;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		ListPowerAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListPowerAction.sqlMapper = sqlMapper;
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
	public PowerLinkPagingAction getPage() {
		return page;
	}
	public void setPage(PowerLinkPagingAction page) {
		this.page = page;
	}
	public PowerVO getResultClass() {
		return ResultClass;
	}
	public void setResultClass(PowerVO resultClass) {
		ResultClass = resultClass;
	}
	
}