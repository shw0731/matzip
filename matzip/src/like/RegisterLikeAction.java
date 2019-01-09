package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;
import restaurantPage.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.interceptor.SessionAware;
import java.io.Reader;
import java.io.IOException;
import java.util.*;

public class RegisterLikeAction extends ActionSupport implements SessionAware {
	public static Reader reader; // 파일 스크림을 위한 reader
    
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;

    
    private List<LikeVO> likeResultClass = new ArrayList<LikeVO>(); // 쿼리 결과 값을 저장할 객체
    private LikeVO paramClass;
    private BoardVO restParamClass;
    
    private Map session;
    private int currentPage; // 현재 페이지
    
    private String ID;
    private int restaurantNo;
    private int isUpdate;
    
    public RegisterLikeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	//비밀번호가 맞으면 세션유지
	
	public String execute() {
		try {
		String ID=(String)session.get("ID");
		
		int likeCount;
		paramClass = new LikeVO();
		restParamClass = new BoardVO();
		paramClass.setID(ID);
		paramClass.setRestaurantNo(restaurantNo);
	
		
		
		likeResultClass=sqlMapper.queryForList("likereg.isLike",ID );
		
		if(likeResultClass==null) {
			sqlMapper.insert("likereg.insertLike",paramClass);
			likeCount=(int)sqlMapper.queryForObject("likereg.countLike", paramClass);
			restParamClass.setRestaurantNo(restaurantNo);
			restParamClass.setLikes(likeCount);
			sqlMapper.update("rest.updateLike",restParamClass);
			isUpdate = 1;
			return SUCCESS;
			
		}else { 
			for(LikeVO likeVO:likeResultClass) {
				if(likeVO.getRestaurantNo()==restaurantNo) {
					isUpdate=0;
					return SUCCESS;
				}
			}
			sqlMapper.insert("likereg.insertLike",paramClass);
			likeCount=(int)sqlMapper.queryForObject("likereg.countLike", paramClass);
			restParamClass.setRestaurantNo(restaurantNo);
			restParamClass.setLikes(likeCount);
			sqlMapper.update("rest.updateLike",restParamClass);
			isUpdate = 1;
			return SUCCESS;
			
		}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
		
	}
	

	public List<LikeVO> getLikeResultClass() {
		return likeResultClass;
	}

	public void setLikeResultClass(List<LikeVO> likeResultClass) {
		this.likeResultClass = likeResultClass;
	}

	public LikeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(LikeVO paramClass) {
		this.paramClass = paramClass;
	}

	public BoardVO getRestParamClass() {
		return restParamClass;
	}

	public void setRestParamClass(BoardVO restParamClass) {
		this.restParamClass = restParamClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public int getIsUpdate() {
		return isUpdate;
	}

	public void setIsUpdate(int isUpdate) {
		this.isUpdate = isUpdate;
	}

	public int isUpdate() {
		return isUpdate;
	}

	public void setUpdate(int isUpdate) {
		this.isUpdate = isUpdate;
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

