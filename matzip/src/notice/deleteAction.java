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
 
      private noticeVO paramClass; // 파라미터를 저장할 객체
      private noticeVO resultClass; // 쿼리 결과 값을 저장할 객체
 
      private int currentPage; // 현재 페이지
 
 
      private int serviceno;
 
      // 생성자
      public deleteAction() throws IOException
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // 게시글 글 삭제
      public String execute() throws Exception
      {
            // 파라미터와 리절트 객체 생성
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // 해당 번호의 글을 가져온다.
            resultClass = (noticeVO)sqlMapper.queryForObject("notice.selectOne", getServiceno());
  
  
            // 삭제할 항목 설정
            paramClass.setServiceno(getServiceno());
  
            // 삭제 쿼리 수행
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
 

