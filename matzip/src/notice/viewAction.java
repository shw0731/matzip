package notice;

 
import org.apache.struts2.interceptor.SessionAware;
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
import java.util.Map;

 

public class viewAction extends ActionSupport implements SessionAware
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass = new noticeVO(); // �Ķ���͸� ������ ��ü
      private noticeVO resultClass = new noticeVO(); // ���� ��� ���� ������ ��ü
 
      private int currentPage;
 
      private int serviceno;
      
      private MemberVO memberResultClass;
      private Map session;
 
 
      private InputStream inputStream;
      private String contentDisposition;
      private long contentLength;
 
      // ������
      public viewAction() throws IOException
      {
            // sqlMapConfig.xml ������ ���������� �����´�.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // �󼼺���
      public String execute() throws Exception
      {
    	  memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
          // ��� ��
  
            // �ش� ��ȣ�� ���� �����´�.
            resultClass = (noticeVO)sqlMapper.queryForObject("notice.selectOne", getServiceno());
  
            return SUCCESS;
      }
 
      // ÷�� ���� �ٿ�ε�

 
      // ��й�ȣ üũ ��
      public String checkForm() throws Exception
      {
            return SUCCESS;
      }
 
 
      public noticeVO getParamClass() { return paramClass; }
      public void setParamClass(noticeVO paramClass) { this.paramClass = paramClass; }
 
      public noticeVO getResultClass() { return resultClass; }
      public void setResultClass(noticeVO resultClass) { this.resultClass = resultClass; }
 

 
      public int getServiceno() { return serviceno; }
      public void setServiceno(int serviceno) { this.serviceno = serviceno; }
 
      public InputStream getInputStream() { return inputStream; }
      public void setInputStream(InputStream inputStream) 
      { this.inputStream = inputStream; }
 
      public String getContentDisposition() { return contentDisposition; }
      public void setContentDisposition(String contentDisposition)
      { this.contentDisposition = contentDisposition; }
 
      public long getContentLength() { return contentLength; }
      public void setContentLength(long contentLength) 

      { this.contentLength = contentLength; }
 
      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }

	public MemberVO getMemberResultClass() {
		return memberResultClass;
	}

	public void setMemberResultClass(MemberVO memberResultClass) {
		this.memberResultClass = memberResultClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
      
      
      
}


