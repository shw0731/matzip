package restaurantPage;


import com.opensymphony.xwork2.ActionSupport;

import restaurantPage.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class DeleteAction extends ActionSupport{
	
    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private BoardVO paramClass; // 파라미터를 저장할 객체
    private BoardVO restResultClass; // 쿼리 결과 값을 저장할 객체

    private int currentPage; // 현재 페이지
    
    private int RestaurantNo;
    
    // 생성자
    public DeleteAction() throws IOException
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    // 게시글 글 삭제
    public String execute() throws Exception
    {
          // 파라미터와 리절트 객체 생성
          paramClass = new BoardVO();
          restResultClass = new BoardVO();

          // 해당 번호의 글을 가져온다.
          restResultClass = (BoardVO)sqlMapper.queryForObject("rest.selectOne", getRestaurantNo());


          // 삭제할 항목 설정
          paramClass.setRestaurantNo(getRestaurantNo());

          // 삭제 쿼리 수행
          sqlMapper.update("rest.deleteBoard", paramClass);

          return SUCCESS;
    }
	public BoardVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(BoardVO paramClass) {
		this.paramClass = paramClass;
	}
	public BoardVO getrestResultClass() {
		return restResultClass;
	}
	public void setrestResultClass(BoardVO restResultClass) {
		this.restResultClass = restResultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRestaurantNo() {
		return RestaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		RestaurantNo = restaurantNo;
	}
}
