package member;

import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionContext;

import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class MemberModifyAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass;
	private MemberVO resultClass;
	
	private Map session;

	private String phoneNumber;
	private String email;
	private String password; 
	private int password2;
	private String ID;
	
	public MemberModifyAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		String id = (String)session.get("ID");
		System.out.println(id);
		resultClass = (MemberVO) sqlMapper.queryForObject("member.idCheck",
				id);

		return SUCCESS;
	}
	
	public String modify() throws Exception{
		String id = (String)session.get("ID");
		System.out.println(id);
		//수정할 항목
		   
		paramClass.setID((String)session.get("ID"));
		paramClass.setEmail(getEmail());
		paramClass.setPhoneNumber(getPhoneNumber());
		paramClass.setPassword(getPassword());
		
		//항목 수정
		sqlMapper.update("member.updateMember", paramClass);
		return SUCCESS;
	}
 
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		MemberModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MemberModifyAction.sqlMapper = sqlMapper;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public int getPassword2() {
		return password2;
	}

	public void setPassword2(int password2) {
		this.password2 = password2;
	}
	

}
