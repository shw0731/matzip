package member;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import member.MemberVO;

public class JoinAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private MemberVO paramClass;
	private MemberVO resultClass;
	
	private String ID;
	private String password;
	private String email;
	private int isType; //0회원 1점주 2관리자
	
	private String idCheck;
	
	//sql문 쓰기
	public JoinAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		paramClass = new MemberVO();
		resultClass = new MemberVO();
		
		//등록할 항목
		paramClass.setID(getID());
		paramClass.setPassword(getPassword());
		paramClass.setEmail(getEmail());
		paramClass.setIstype(getIsType()); 
		
		//등록 쿼리 수행
		sqlMapper.insert("insertBoard", paramClass);
			
	return SUCCESS;
	}
	
	public String idCheckMethod() throws Exception {
		idCheck =  (String)sqlMapper.queryForObject("idCheck",  getID()); //키값,객체
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		JoinAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		JoinAction.sqlMapper = sqlMapper;
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

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIsType() {
		return isType;
	}

	public void setIsType(int isType) {
		this.isType = isType;
	}
	
	}
