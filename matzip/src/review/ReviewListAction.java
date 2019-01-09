package review;
import restaurantPage.BoardVO;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.commons.io.FileUtils;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

public class ReviewListAction extends ActionSupport implements SessionAware{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
		
	private BoardVO restParamClass;
	
	private ReviewVO paramClass;
	private ReviewVO resultClass;
	private List<ReviewVO> reviewList =  new ArrayList<ReviewVO>();
	
	private int restaurantNo;
	private int currentPage;
	
	private Map session;

	// 생성자
	public ReviewListAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
			reader.close();
		}

	// 상세보기
	public String execute() throws Exception {

		
		reviewList = sqlMapper.queryForList("review.selectAllByID", session.get("ID"));

		return SUCCESS;

	}

	
	public List<ReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public BoardVO getRestParamClass() {
		return restParamClass;
	}

	public void setRestParamClass(BoardVO restParamClass) {
		this.restParamClass = restParamClass;
	}

	public ReviewVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(ReviewVO paramClass) {
		this.paramClass = paramClass;
	}

	public ReviewVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(ReviewVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
}
