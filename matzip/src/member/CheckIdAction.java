package member;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.IOException;
import java.io.Reader;

import member.MemberVO;

public class CheckIdAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MemberVO resultClass;
	
	private String ID;
	private int chkNo;
	
	public CheckIdAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		resultClass=new MemberVO();
		
		if(getID() != null) { //사용자가 입력한 값이 null이 아니면 입력id가지고 idcheck쿼리문 실행
			resultClass = (MemberVO) sqlMapper.queryForObject("member.idCheck",getID());
		}
		
		if(resultClass == null) { //중복 없으면
			chkNo = 0;
			
		}
		else { //중복 있으면 1
			chkNo = 1;
		}
		
	return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CheckIdAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CheckIdAction.sqlMapper = sqlMapper;
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

	public void setID(String iD) {
		ID = iD;
	}

	public int getChkNo() {
		return chkNo;
	}

	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}
	
	

	
}
