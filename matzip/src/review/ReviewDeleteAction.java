package review;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

import review.ReviewVO;


public class ReviewDeleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass;
	private ReviewVO resultClass;
	
	private String ID;
	
	private int currentPage;
	
	private int reviewNo;
	
public ReviewDeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

public String execute() throws Exception {
	
	//파라미터와 리절트 객체 생성.
	paramClass = new ReviewVO();
	resultClass = new ReviewVO();
	
	paramClass.setReviewNo(getReviewNo());
	
	sqlMapper.update("review.deleteReview",paramClass);
	
	return SUCCESS;
}

public static Reader getReader() {
	return reader;
}

public static void setReader(Reader reader) {
	ReviewDeleteAction.reader = reader;
}

public static SqlMapClient getSqlMapper() {
	return sqlMapper;
}

public static void setSqlMapper(SqlMapClient sqlMapper) {
	ReviewDeleteAction.sqlMapper = sqlMapper;
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

public int getCurrentPage() {
	return currentPage;
}

public void setCurrentPage(int currentPage) {
	this.currentPage = currentPage;
}

public int getReviewNo() {
	return reviewNo;
}

public String getID() {
	return ID;
}

public void setID(String iD) {
	ID = iD;
}

public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
}




}
