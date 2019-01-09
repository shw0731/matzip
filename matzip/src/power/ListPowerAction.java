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

public class ListPowerAction extends ActionSupport implements SessionAware{

	public static Reader reader; // 파일 스크림을 위한 reader
    
	// SqlMapClient API를 사용하기 위한 sqlMapper 객체
	public static SqlMapClient sqlMapper;
	private Map session;
	private List<PowerVO> List = new ArrayList<PowerVO>();
	private int restaurantNo;

	public ListPowerAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String excute() {
		try {
		List = sqlMapper.queryForList("power.listPower");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public List<PowerVO> getList() {
		return List;
	}
	public void setList(List<PowerVO> list) {
		List = list;
	}
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	
}