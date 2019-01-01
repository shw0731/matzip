package notice;

 

import com.opensymphony.xwork2.ActionSupport;

 

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.io.File;
import java.io.Reader;
import java.io.IOException;

 

public class deleteAction extends ActionSupport
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // �Ķ���͸� ������ ��ü
      private noticeVO resultClass; // ���� ��� ���� ������ ��ü
 
      private int currentPage; // ���� ������
 
 
      private int serviceno;
 
      // ������
      public deleteAction() throws IOException
      {
            // sqlMapConfig.xml ������ ���������� �����´�.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // �Խñ� �� ����
      public String execute() throws Exception
      {
            // �Ķ���Ϳ� ����Ʈ ��ü ����
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // �ش� ��ȣ�� ���� �����´�.
            resultClass = (noticeVO)sqlMapper.queryForObject("notice.selectOne", getServiceno());
  
  
            // ������ �׸� ����
            paramClass.setServiceno(getServiceno());
  
            // ���� ���� ����
            sqlMapper.update("notice.deleteBoard", paramClass);
  
            return SUCCESS;
      }
 
      public noticeVO getParamClass() { return paramClass; }
      public void setParamClass(noticeVO paramClass) { this.paramClass = paramClass; }
 
      public int getServiceno() { return serviceno; }
      public void setServiceno(int serviceno) { this.serviceno = serviceno; }
 
      public noticeVO getResultClass() { return resultClass; }
      public void setResultClass(noticeVO resultClass) { this.resultClass = resultClass; }
 
      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }
}
 

