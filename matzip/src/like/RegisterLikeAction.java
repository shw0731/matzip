package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;
import restaurantPage.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;
public class RegisterLikeAction extends ActionSupport {
	public static Reader reader; // 파일 스크림을 위한 reader
    
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;

    private LikeVO paramClass; // 파라미터를 저장할 객체
    private LikeVO likeResultClass; // 쿼리 결과 값을 저장할 객체
    private BoardVO restParamClass;
    
    private int currentPage; // 현재 페이지
    
    private String ID;
    private int restaurantNo;
    private boolean isUpdate;
    
    public RegisterLikeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	//비밀번호가 맞으면 세션유지
	
	public String execute() throws Exception{
		paramClass = new LikeVO();
		likeResultClass = new LikeVO();
		restParamClass = new BoardVO();
		int likeCount;
		paramClass.setID(ID);
		paramClass.setRestaurantNo(restaurantNo);
		
		
		likeResultClass=(LikeVO)sqlMapper.queryForObject("likereg.isLike",paramClass );
		if(!likeResultClass.getID().equals(paramClass.getID())||likeResultClass.getRestaurantNo()!=paramClass.getRestaurantNo()) { 
			sqlMapper.insert("likereg.insertLike",paramClass);
			likeCount=(int)sqlMapper.queryForObject("likereg.countLike", paramClass);
			restParamClass.setRestaurantNo(restaurantNo);
			restParamClass.setLikes(likeCount);
			sqlMapper.update("rest.updateLike",restParamClass);
			isUpdate = true;
		}
			isUpdate = false;
			return SUCCESS;
		
	}

	public boolean isUpdate() {
		return isUpdate;
	}

	public void setUpdate(boolean isUpdate) {
		this.isUpdate = isUpdate;
	}

	public LikeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(LikeVO paramClass) {
		this.paramClass = paramClass;
	}

	public LikeVO getLikeResultClass() {
		return likeResultClass;
	}

	public void setLikeResultClass(LikeVO likeResultClass) {
		this.likeResultClass = likeResultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	
}

