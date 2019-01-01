package notice;

 

import com.opensymphony.xwork2.ActionSupport;

 

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.io.Reader;
import java.io.File;
import java.io.IOException;

 

import org.apache.commons.io.FileUtils;

 

public class modifyAction extends ActionSupport
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private noticeVO paramClass; // 파라미터를 저장할 객체
      private noticeVO resultClass; // 쿼리 결과 값을 저장할 객체
 
      private int currentPage; // 현재 페이지
 
      private int serviceno;
      private String subject;
      private String password;
      private String context;
      private String old_file;
 
      private File upload; // 파일 객체
      private String uploadContentType; // 컨텐츠 타입
      private String uploadFileName; // 파일 이름
      private String fileUploadPath = "d:\\udload\\";
 
      // 생성자
      public modifyAction() throws IOException
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // 게시글 수정
      public String execute() throws Exception
      {
            // 파라미터와 리절트 객체 생성
            paramClass = new noticeVO();
            resultClass = new noticeVO();
  
            // 수정할 항목 설정
            paramClass.setServiceno(getServiceno());
            paramClass.setSubject(getSubject());
            paramClass.setContext(getContext());
  
            // 일단 항목만 수정한다.
            sqlMapper.update("notice.updateBoard", paramClass);
  

  
            // 수정이 끝나면 view 페이지로 이동
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
}

