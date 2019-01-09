package power;

import com.opensymphony.xwork2.ActionSupport;

import power.PowerVO;

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

	public RegisterPowerAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String excute() {
		try {
		sqlMapper.insert("power.insertPower",restaurantNo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
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