package member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.IOException;
import java.io.Reader;

import member.MemberVO;

public class CheckPhoneAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MemberVO resultClass;
	private MemberVO resultClass2;
	
	private int phoneNumber;
	private int chkNo;
	
	public CheckPhoneAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		resultClass=new MemberVO();
		resultClass2=new MemberVO();
		
		if((Object)getPhoneNumber() != null) { //빈값이 아니면 phoneCheck 쿼리 실행
			resultClass = (MemberVO)sqlMapper.queryForObject("member.phoneCheck",getPhoneNumber());
			resultClass2 = (MemberVO)sqlMapper.queryForObject("blackList.blackListFind",getPhoneNumber());
		}
		
		else if(resultClass == null && resultClass2 == null) { 
			chkNo = 0;
		}
		else if(resultClass2 != null) { //블랙리스트면 1
			chkNo = 1;
	}
		else { 
			chkNo = 2; //중복아이디면 2
		}
		
		
		
	return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CheckPhoneAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CheckPhoneAction.sqlMapper = sqlMapper;
	}

	public MemberVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(MemberVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getChkNo() {
		return chkNo;
	}

	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}
	
	

	
}
