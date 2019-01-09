package qna;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

import org.apache.struts2.interceptor.SessionAware;

import member.MemberVO;


/**
 * @author ¿ø¼±¹Î
 *
 */
public class QnAWriteAction extends ActionSupport implements SessionAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private QnAVO paramClass;
	private QnAVO resultClass;

	
	private int currentPage;
	
	private int serviceno;
	private String subject;
	private String id;
	private String password;
	private String context;
	/*private String file_orgName;
	private String file_savName;*/
	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath="C:\\Java\\upload\\";
	
	private int answerno;
	private int re_step;
	private int re_level;
	
	private Map session;
	private MemberVO memberResultClass;
	

	boolean reply = false;
	
	public QnAWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
		return SUCCESS;
		
	}
	
	public String reply() throws Exception
	{
		reply=true;
		resultClass = new QnAVO();
		
		id = (String) session.get("ID");
		
		resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectNo", getServiceno());
		resultClass.setSubject("[´äº¯] " + resultClass.getSubject());
		resultClass.setPassword("");
		resultClass.setId("");
		resultClass.setContext("");
		/*resultClass.setFile_orgname(null);
		resultClass.setFile_savname(null);*/
		
		
		
		return SUCCESS;
		
	}

	public String execute() throws Exception {
		
		paramClass = new QnAVO();
		resultClass = new QnAVO();
		
		
		if(answerno!=0)
		{
			
			paramClass.setAnswerno(getAnswerno());
			
		}
		paramClass.setId((String)session.get("ID"));
		
		paramClass.setSubject(getSubject());
		paramClass.setPassword(getPassword());
		paramClass.setContext(getContext());
		paramClass.setReg_date(today.getTime());
		
		
		if(answerno == 0)
			sqlMapper.insert("QnAInsert", paramClass);
		else
			sqlMapper.insert("QnAInsertReply", paramClass);
		
		if(getUpload() != null)
		{
			resultClass = (QnAVO) sqlMapper.queryForObject("QnAselectLastNo");
			
			String file_name = "file_" + resultClass.getServiceno();
			String file_ext = getUploadFileName().substring(
					getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length()
					);
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setServiceno(resultClass.getServiceno());
			/*paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." +file_ext);*/
			
			sqlMapper.update("updateFile", paramClass);
		}

		return SUCCESS;
	}



	/*public void setParamClass(boardVO paramClass) {
		this.paramClass = paramClass;
	}

	public boardVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(boardVO resultClass) {
		this.resultClass = resultClass;
	}*/

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/*public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}*/

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

/*	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}*/

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

/*	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}*/

	/*public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String fileOrgName) {
		file_orgName = fileOrgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String fileSavName) {
		file_savName = fileSavName;
	}*/

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	} 

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
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


	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}
	
	/*public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}*/

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int reStep) {
		re_step = reStep;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int reLevel) {
		re_level = reLevel;
	}

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

	public int getAnswerno() {
		return answerno;
	}

	public void setAnswerno(int answerno) {
		this.answerno = answerno;
	}

	public void setParamClass(QnAVO paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(QnAVO resultClass) {
		this.resultClass = resultClass;
	}

	public QnAVO getResultClass() {
		return resultClass;
	}	
	
	public QnAVO getParamClass() {
		return paramClass;
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
