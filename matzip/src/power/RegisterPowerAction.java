package power;

import com.opensymphony.xwork2.ActionSupport;

import blackList.BlackListVO;
import power.PowerVO;
import restaurantPage.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.interceptor.SessionAware;
import java.io.Reader;
import java.io.IOException;
import java.util.*;

public class RegisterPowerAction extends ActionSupport implements SessionAware{

	public static Reader reader; // 파일 스크림을 위한 reader
    
	// SqlMapClient API를 사용하기 위한 sqlMapper 객체
	public static SqlMapClient sqlMapper;
	private Map session;
	private PowerVO paramClass;
	private int restaurantNo;
	private BoardVO RparamClass;

	public RegisterPowerAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String excute() throws Exception{
		
		paramClass = new PowerVO();
		RparamClass = new BoardVO();
		
		RparamClass.setRestaurantNo(getRestaurantNo());
		paramClass.setRestaurantNo(getRestaurantNo());

		sqlMapper.insert("power.insertPower",RparamClass);

		return SUCCESS;
	}
	
	
	
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		RegisterPowerAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		RegisterPowerAction.sqlMapper = sqlMapper;
	}
	public BoardVO getRparamClass() {
		return RparamClass;
	}
	public void setRparamClass(BoardVO rparamClass) {
		RparamClass = rparamClass;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public PowerVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(PowerVO paramClass) {
		this.paramClass = paramClass;
	}
	
	
}