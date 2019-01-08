package qna;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.util.Map;
import java.io.IOException;

import org.apache.struts2.interceptor.SessionAware;

public class QnADeleteAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnAVO paramClass;
	private QnAVO resultClass;
	
	/*private cQnAVO cClass = new cQnAVO();
	private cQnAVO cResult = new cQnAVO();*/
	
	private int currentPage;
	/*private String fileUploadPath = "C:\\Java\\Framework07\\upload\\";*/
	
	private int serviceno;
	
	private Map session;
	
	public QnADeleteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass = new QnAVO();
		resultClass = new QnAVO();
		
		resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectNo", getServiceno());
		
		/*File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();*/
		
		paramClass.setServiceno(getServiceno());
	
		sqlMapper.update("QnADelete",paramClass);
		return SUCCESS;
	}
	
	/*public String execute2() throws Exception {
		cClass = new cQnAVO();
		cResult = new cQnAVO();
		
		cClass.setNo(getNo());
		
		sqlMapper.update("deleteComment",cClass);
		
		return SUCCESS;
	}*/

	public QnAVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(QnAVO paramClass) {
		this.paramClass = paramClass;
	}

	public QnAVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(QnAVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/*public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}*/

	public int getServiceno() {
		return serviceno;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	

}
