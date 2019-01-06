package blackList;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class BlackListViewAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public List<BlackListVO>list = new ArrayList<BlackListVO>();
	
	private BlackListVO paramClass = new BlackListVO();
	private BlackListVO resultClass = new BlackListVO();
	
	private int phoneNumber;
	
	public BlackListViewAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception{
		
		list = sqlMapper.queryForList("selectAll");
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		BlackListViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		BlackListViewAction.sqlMapper = sqlMapper;
	}

	public BlackListVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(BlackListVO paramClass) {
		this.paramClass = paramClass;
	}

	public BlackListVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(BlackListVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

}
