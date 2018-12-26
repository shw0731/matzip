package notice;

 

import com.opensymphony.xwork2.ActionSupport;

 

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.util.*;
import java.io.Reader;
import java.io.IOException;
import java.io.File;

 

import org.apache.commons.io.FileUtils;

 

public class writeAction extends ActionSupport
{
      public static Reader reader; // ���� ��ũ���� ���� reader
 
      // SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // �Ķ���͸� ������ ��ü
      private noticeVO resultClass; // ���� ��� ���� ������ ��ü
 
      private int currentPage; // ���� ������
 
      private int no;
      private String subject;
      private String writer;
      private String content;
      Calendar today = Calendar.getInstance(); // ���� ��¥ ���ϱ�
 
 
      // ������
      public writeAction() throws IOException
      {
            // sqlMapConfig.xml ������ ���������� �����´�.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      public String form() throws Exception
      {
            // ��� ��
            return SUCCESS;
      }
 
      // �Խ��� Write �׼�
      public String execute() throws Exception
      {
            // �Ķ���Ϳ� ����Ʈ ��ü ����
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // ����� �׸� ����
            paramClass.setSubject(getSubject());
            paramClass.setWriter(getWriter());
            paramClass.setContent(getContent());
            paramClass.setRegdate(today.getTime());
  
            // ��� ���� ����
            sqlMapper.insert("insertBoard", paramClass);
  
           
            return SUCCESS;
      }
 
      public Calendar getToday() { return today; }
      public void setToday(Calendar today) { this.today = today; }
 
      public noticeVO getParamClass() { return paramClass; }
      public void setParamClass(noticeVO paramClass) { this.paramClass = paramClass; }
 
      public String getWriter() { return writer; }
      public void setWriter(String writer) { this.writer = writer; }
 
      public String getSubject() { return subject; }
      public void setSubject(String subject) { this.subject = subject; }
 
 
      public String getContent() { return content; }
      public void setContent(String content) { this.content = content; }
 
 
      public int getNo() {return no; }
      public void setNo(int no) { this.no = no; }
 
 
      public noticeVO getResultClass() { return resultClass; }
      public void setResultClass(noticeVO resultClass) { this.resultClass = resultClass; }
 
      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }
}


