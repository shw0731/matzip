package qna;

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.Map;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import org.apache.struts2.interceptor.SessionAware;
import member.MemberVO;
public class QnAModifyAction extends ActionSupport implements SessionAware{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnAVO paramClass;
	private QnAVO resultClass;
	
	private int currentPage;
	private MemberVO memberResultClass;
	
	private int serviceno;
	private String subject;
	private String id;
	private String password;
	private String context;
	
	private Map session;
	
	
	/*private String old_file;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Java\\IoT01\\upload\\";*/
	
	public QnAModifyAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	public String execute() throws Exception
	{
		paramClass = new QnAVO();
		resultClass = new QnAVO();
		id = (String) session.get("ID");
		paramClass.setServiceno(getServiceno());
		paramClass.setSubject(getSubject());
		paramClass.setId(getId());
		paramClass.setPassword(getPassword());
		paramClass.setContext(getContext());
		
		sqlMapper.update("QnAUpdate", paramClass);
		
		memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
		
		/*if(getUpload() != null)
		{
			String file_name = "file_" + getNo();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') +1, getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);
			
			sqlMapper.update("updateFile", paramClass);
			}*/
		
		resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectNo", getServiceno());
		return SUCCESS;
		
		
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


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

//	public String getOld_file() {
//		return old_file;
//	}
//
//	public void setOld_file(String oldFile) {
//		old_file = oldFile;
//	}
//
//	public File getUpload() {
//		return upload;
//	}
//
//	public void setUpload(File upload) {
//		this.upload = upload;
//	}
//
//	public String getUploadContentType() {
//		return uploadContentType;
//	}

	public int getServiceno() {
		return serviceno;
	}

	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
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
	
	
	
	

	/*public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	*/
	
}
