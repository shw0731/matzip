package like;

import java.io.IOException;
import java.io.Reader;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

import like.LikeVO;
import restaurantPage.BoardVO;



public class DeleteLikeAction extends ActionSupport implements SessionAware {
	 // 파일 스트림을 위한 reader
    public static Reader reader;
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;
    
    private Map session;
    private String ID;
    private int restaurantNo;
    private int likeCount;
    private LikeVO paramClass = new LikeVO();
    private BoardVO restParamClass = new BoardVO();
    
    public DeleteLikeAction() throws IOException 
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");
          
          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String execute() throws Exception{
    	
    	paramClass.setID(ID);
    	paramClass.setRestaurantNo(restaurantNo);
    	
    	sqlMapper.delete("likereg.deleteLike", paramClass);
    	//좋아요 계산
    	likeCount=(int)sqlMapper.queryForObject("likereg.countLike", paramClass);
		restParamClass.setRestaurantNo(restaurantNo);
		restParamClass.setLikes(likeCount);
		sqlMapper.update("rest.updateLike",restParamClass);
        return SUCCESS;
    }
    
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
    
}
