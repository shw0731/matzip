package member;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class FindPwAction extends ActionSupport{
	
	private String name;
	private String email;
	private String ID;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO paramClass = new MemberVO();
	private MemberVO resultClass = new MemberVO();

	public String execute() throws Exception {
		return SUCCESS;
	}

	public FindPwAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String find() throws Exception {

		paramClass.setEmail(getEmail());
		paramClass.setID(getID());

		resultClass = (MemberVO) sqlMapper.queryForObject("member.findPw", paramClass);

		if(resultClass != null) {
			return SUCCESS;
		}else {
			return ERROR;
		}
		
		
}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		FindPwAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		FindPwAction.sqlMapper = sqlMapper;
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

}
