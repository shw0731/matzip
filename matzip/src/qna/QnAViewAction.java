package qna;

import com.opensymphony.xwork2.ActionSupport;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;



public class QnAViewAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnAVO paramClass = new QnAVO();
	private QnAVO resultClass = new QnAVO();
	

	
	private int currentPage;
	
	private int serviceno;
	private int originno;
	
	private String password;
		
	private InputStream inputStream;
	private String contextDisposition;
	private long contextLength;
	
	public QnAViewAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setServiceno(getServiceno());
		//sqlMapper.update("updateReadHit",paramClass);
		
		
		resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectNo", getServiceno());
		
		/*System.out.println(serviceno);
		System.out.println(resultClass.getServiceno());
		System.out.println(resultClass.getContext());
		System.out.println(resultClass.getSubject());
		*/
		return SUCCESS;
	}
	
	
		
/*		
		File fileInfo = new File(fileUploadPath + fileDownloadName);
		setContentLength(fileInfo.length());
		setContentDisposition("attachment; filename="+URLEncoder.encode(fileDownloadName, "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath + fileDownloadName));
*/		
		
	public String checkForm() throws Exception
	{
		return SUCCESS;
	}
	
	public String checkAction()	throws Exception
	{
		paramClass.setServiceno(getServiceno());
		paramClass.setPassword(getPassword());
		System.out.println(getServiceno());
		System.out.println(getPassword());
		resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectPassword", paramClass);
		
		if(resultClass == null)
			return ERROR;
		
		return SUCCESS;
	}
	
	
	public int getOriginno() {
		return originno;
	}

	public void setOriginno(int originno) {
		this.originno = originno;
	}

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

	
	
	
	

	

	public int getServiceno() {
		return serviceno;
	}

	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContextDisposition() {
		return contextDisposition;
	}

	public void setContextDisposition(String contextDisposition) {
		this.contextDisposition = contextDisposition;
	}

	public long getContextLength() {
		return contextLength;
	}

	public void setContextLength(long contextLength) {
		this.contextLength = contextLength;
	}

	
	
	

}