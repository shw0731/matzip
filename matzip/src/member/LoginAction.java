package member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private MemberVO paramClass = new MemberVO();
	private MemberVO resultClass = new MemberVO();
	
	private Map session;
	
	private String password;
	private String isType;
	private String ID;
	
	public LoginAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	//��й�ȣ�� ������ ��������
	
	public String execute() throws Exception{
		password = getPassword();
		resultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", getID());
		if (resultClass != null) {
			if (resultClass.getPassword().equals(password)) {
				
				session.put("ID", resultClass.getID());
				session.put("password", resultClass.getPassword());
				return SUCCESS;
			}
		}
		
		return ERROR;
	}
	//�α׾ƿ��� ��������
	public String logout() throws Exception{
		if(session.get("ID") != null) {
			session.remove("password");
			session.remove("ID");
		}
		return SUCCESS;
		
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		LoginAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		LoginAction.sqlMapper = sqlMapper;
	}

	public MemberVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(MemberVO paramClass) {
		this.paramClass = paramClass;
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
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIsType() {
		return isType;
	}

	public void setIsType(String isType) {
		this.isType = isType;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}
	

}
