package notice;

import org.apache.struts2.interceptor.SessionAware; 

import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.io.Reader;
import java.util.Map;
import java.io.File;
import java.io.IOException;

 

import org.apache.commons.io.FileUtils;

 

public class modifyAction extends ActionSupport implements SessionAware
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // �Ķ���͸� ������ ��ü
      private noticeVO resultClass; // ���� ��� ���� ������ ��ü
 
      private int currentPage; // ���� ������
 
      private int serviceno;
      private String subject;
      private String password;
      private String context;
      private String old_file;
      
      private Map session;
      private MemberVO memberResultClass;
 
      private File upload; // ���� ��ü
      private String uploadContentType; // ������ Ÿ��
      private String uploadFileName; // ���� �̸�
      private String fileUploadPath = "d:\\udload\\";
 
      // ������
      public modifyAction() throws IOException
      {
            // sqlMapConfig.xml ������ ���������� �����´�.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // �Խñ� ����
      public String execute() throws Exception
      {
            // �Ķ���Ϳ� ����Ʈ ��ü ����
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // ������ �׸� ����
            paramClass.setServiceno(getServiceno());
            paramClass.setSubject(getSubject());
            paramClass.setContext(getContext());
  
            // �ϴ� �׸� �����Ѵ�.
            sqlMapper.update("notice.updateBoard", paramClass);
  
            memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
            // ��� ��
  
            // ������ ������ view �������� �̵�
            resultClass = (noticeVO)sqlMapper.queryForObject("notice.selectOne", getServiceno());
  
            return SUCCESS;
      }
 
      public noticeVO getParamClass() { return paramClass; }
      public void setParamClass(noticeVO paramClass) { this.paramClass = paramClass; }
 
      public noticeVO getResultClass() { return resultClass; }
      public void setResultClass(noticeVO resultClass) { this.resultClass = resultClass; }
 
 
      public String getSubject() { return subject; }
      public void setSubject(String subject) { this.subject = subject; }
 
      public String getPassword() { return password; }
      public void setPassword(String password) { this.password = password; }
 
      public String getContext() { return context; }
      public void setContext(String context) { this.context = context; }
 
      public File getUpload() { return upload; }
      public void setUpload(File upload) { this.upload = upload; }
 
      public String getUploadContentType() { return uploadContentType; }
      public void setUploadContentType(String uploadContentType)
      { this.uploadContentType = uploadContentType; }
 
      public String getUploadFileName() { return uploadFileName; }
      public void setUploadFileName(String uploadFileName)
      { this.uploadFileName = uploadFileName; }
 
      public String getFileUploadPath() { return fileUploadPath; }
      public void setFileUploadPath(String fileUploadPath)
      { this.fileUploadPath = fileUploadPath; }
 
      public int getServiceno() { return serviceno; }
      public void setServiceno(int serviceno) { this.serviceno = serviceno; }
 
      public String getOld_file() { return old_file; }
      public void setOld_file(String old_file) { this.old_file = old_file; }
 
      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }

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


