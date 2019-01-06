package search;

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.interceptor.SessionAware;

import java.util.*;
import java.io.Reader;
import java.io.File;
import java.io.IOException;

import restaurantPage.BoardVO;
import restaurantPage.PagingAction;

public class SearchFilterAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private Map session;
	private List<String> filter_address = new ArrayList<String>();
	private List<String> filter_category = new ArrayList<String>();
	
	public SearchFilterAction() throws IOException { //가게페이지액션에서 나오는 IOException을 처리하는 클래스)
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
	public String execute() throws Exception { 
		filter_address = getFilter_address();
		filter_category = getFilter_category();

		return SUCCESS;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public List<String> getFilter_address() {
		return filter_address;
	}
	public void setFilter_address(List<String> filter_address) {
		this.filter_address = filter_address;
	}
	public List<String> getFilter_category() {
		return filter_category;
	}
	public void setFilter_category(List<String> filter_category) {
		this.filter_category = filter_category;
	}
	
}
