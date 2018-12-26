package notice;

 

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

 

public class NO_viewAction extends ActionSupport
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass = new noticeVO(); // �Ķ���͸� ������ ��ü
      private noticeVO resultClass = new noticeVO(); // ���� ��� ���� ������ ��ü
 
      private int currentPage;
 
      private int no;
 
 
      private InputStream inputStream;
      private String contentDisposition;
      private long contentLength;
 
      // ������
      public NO_viewAction() throws IOException
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

  
            // �ش� ��ȣ�� ���� �����´�.
            resultClass = (noticeVO)sqlMapper.queryForObject("notice.selectOne", getNo());
  
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
 

 
      public int getNo() { return no; }
      public void setNo(int no) { this.no = no; }
 
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
}


