package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionContext;



import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;


import restaurantPage.BoardVO;
public class MainAction extends ActionSupport implements SessionAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	

	private List<BoardVO> restList = new ArrayList<BoardVO>();
	private Map session;
	private MemberVO resultClass = new MemberVO();
	public MainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception{
		restList = sqlMapper.queryForList("rest.selectAll"); 
		if(session.get("ID")!=null)
		resultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));	
				return SUCCESS;
			
		}
		
	public List<BoardVO> getRestList() {
		return restList;
	}
	public void setRestList(List<BoardVO> restList) {
		this.restList = restList;
	}
	public MemberVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(MemberVO resultClass) {
		this.resultClass = resultClass;
	}
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
}