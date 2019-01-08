package qna;

import com.opensymphony.xwork2.ActionSupport; 

import member.MemberVO;

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
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;



public class QnAViewAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnAVO paramClass = new QnAVO();
	private QnAVO resultClass = new QnAVO();
	
    private MemberVO memberResultClass;
	
	private int currentPage;
	
	private int serviceno;
	private int originno;
	
	private String password;
		
	private InputStream inputStream;
	private String contextDisposition;
	private long contextLength;
	
	private Map session;
	
	public QnAViewAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		paramClass.setServiceno(getServiceno());
		//sqlMapper.update("updateReadHit",paramClass);
		
		memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
		
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

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public MemberVO getMemberResultClass() {
		return memberResultClass;
	}

	public void setMemberResultClass(MemberVO memberResultClass) {
		this.memberResultClass = memberResultClass;
	}
	
	
	
	
	
	

}
