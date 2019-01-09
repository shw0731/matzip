package like;

import com.opensymphony.xwork2.ActionSupport;



import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.interceptor.SessionAware;
import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class LikeListAction extends ActionSupport implements SessionAware{
	 // 파일 스트림을 위한 reader
    public static Reader reader;
    
    // SqlMapClient API를 사용하기 위한 sqlMapper 객체
    public static SqlMapClient sqlMapper;
    
    private List<LikeListVO> likeList = new ArrayList<LikeListVO>();
    private Map session;
   
    
    public LikeListAction() throws IOException 
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");
          
          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String execute() throws Exception{
    	likeList = sqlMapper.queryForList("likereg.listByID",session.get("ID"));
    	     
        return SUCCESS;
    }
    
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public void setLikeList(List<LikeListVO> likeList) {
		this.likeList = likeList;
	}
	public List<LikeListVO> getLikeList() {
		return likeList;
	}
	public void setList(List<LikeListVO> likeList) {
		this.likeList = likeList;
	}
	
}