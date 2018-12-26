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
      public static Reader reader; // 파일 스크림을 위한 reader
 
      // SqlMapClient API를 사용하기 위한 sqlMapper 객체
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // 파라미터를 저장할 객체
      private noticeVO resultClass; // 쿼리 결과 값을 저장할 객체
 
      private int currentPage; // 현재 페이지
 
      private int no;
      private String subject;
      private String writer;
      private String content;
      Calendar today = Calendar.getInstance(); // 오늘 날짜 구하기
 
 
      // 생성자
      public writeAction() throws IOException
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      public String form() throws Exception
      {
            // 등록 폼
            return SUCCESS;
      }
 
      // 게시판 Write 액션
      public String execute() throws Exception
      {
            // 파라미터와 리절트 객체 생성
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // 등록할 항목 설정
            paramClass.setSubject(getSubject());
            paramClass.setWriter(getWriter());
            paramClass.setContent(getContent());
            paramClass.setRegdate(today.getTime());
  
            // 등록 쿼리 수행
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


