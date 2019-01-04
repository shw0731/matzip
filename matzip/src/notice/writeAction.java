package notice;

 

import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.util.*;
import java.io.Reader;
import java.io.IOException;
import java.io.File;

import member.MemberVO;

import org.apache.commons.io.FileUtils;

import org.apache.struts2.interceptor.SessionAware;

public class writeAction extends ActionSupport implements SessionAware
{
      public static Reader reader; // 파일 스크림을 위한 reader
 
      // SqlMapClient API를 사용하기 위한 sqlMapper 객체
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // 파라미터를 저장할 객체
      private noticeVO resultClass; // 쿼리 결과 값을 저장할 객체
      private MemberVO memberResultClass;
      private int currentPage; // 현재 페이지
 
      private int serviceno;
      private String subject;
      
      private Map session;
      private String context;
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
    	  memberResultClass = (MemberVO) sqlMapper.queryForObject("member.selectOne", session.get("ID"));
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
            paramClass.setContext(getContext());
            paramClass.setReg_date(today.getTime());
  
            // 등록 쿼리 수행
            sqlMapper.insert("notice.insertBoard", paramClass);
  
           
            return SUCCESS;
      }
 
      public Calendar getToday() { return today; }
      public void setToday(Calendar today) { this.today = today; }
 
      public noticeVO getParamClass() { return paramClass; }
      public void setParamClass(noticeVO paramClass) { this.paramClass = paramClass; }
 
 
      public String getSubject() { return subject; }
      public void setSubject(String subject) { this.subject = subject; }
 
 
      public String getContext() { return context; }
      public void setContext(String context) { this.context = context; }
 
 
      public int getServiceno() {return serviceno; }
      public void setServiceno(int serviceno) { this.serviceno = serviceno; }
 
 
      public noticeVO getResultClass() { return resultClass; }
      public void setResultClass(noticeVO resultClass) { this.resultClass = resultClass; }
 
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


