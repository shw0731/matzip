package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class RegisterAction extends ActionSupport{
	
    public static Reader reader; // 파일 스크림을 위한 reader
    
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;

    private LikeVO paramClass; // 파라미터를 저장할 객체
    private LikeVO likeResultClass; // 쿼리 결과 값을 저장할 객체
    
    private int currentPage; // 현재 페이지
    
    private String memberID;
    private int RestaurantNo;
    
    // 생성자
    public RegisterAction() throws IOException
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String form() throws Exception
    {
          // 등록 폼
          return SUCCESS;
    }
    public String execute() throws Exception
    {
          // 파라미터와 리절트 객체 생성
          paramClass = new LikeVO();
          likeResultClass = new LikeVO();

          // 등록할 항목 설정
          paramClass.setMemberID(getMemberID());
          paramClass.setRestaurantNo(getRestaurantNo());

          // 등록 쿼리 수행
          sqlMapper.insert("likereg.like-up", paramClass);

         
          return SUCCESS;
    }
	public LikeVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(LikeVO paramClass) {
		this.paramClass = paramClass;
	}
	public LikeVO getlikeResultClass() {
		return likeResultClass;
	}
	public void setlikeResultClass(LikeVO likeResultClass) {
		this.likeResultClass = likeResultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getRestaurantNo() {
		return RestaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		RestaurantNo = restaurantNo;
	}
}
