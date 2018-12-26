package notice;

 

import com.opensymphony.xwork2.ActionSupport;

import notice.pagingAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

 

import java.util.*;
import java.io.Reader;
import java.io.IOException;

 

public class listAction extends ActionSupport 
{
      public static Reader reader; // 파일 스트림을 위한 reader
 
      // SqlMapClient API를 사용하기 위한 sqlMapper 객체
      public static SqlMapClient sqlMapper;

 

      private List<noticeVO> list = new ArrayList<noticeVO>();;  
 
      private int currentPage = 1; // 현재 페이지
      private int totalCount; // 총 게시물의 수
      private int blockCount = 10; // 한 페이지의  게시물의 수
      private int blockPage = 5; // 한 화면에 보여줄 페이지 수
      private String pagingHtml; // 페이징을 구현한 html
      private pagingAction page; // 페이징 클래스
 
      // 생성자
      public listAction() throws IOException 
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }

 

      // 게시판 List 액션
      public String execute() throws Exception 
      {
            list = sqlMapper.queryForList("notice.selectAll"); // 모든 글을 가져와 list에 넣는다.

            totalCount = list.size(); // 전체 글 개수를 구한다.
  
            // pagingAction 객체 생성
            page = new pagingAction(currentPage, totalCount, blockCount, blockPage); 
            pagingHtml = page.getPagingHtml().toString(); // 페이지 html 생성

 

            // 현재 페이지에서 보여줄 마지막 글의 번호 설정
            int lastCount = totalCount;


            /**
             * 현재 페이지의 마지막 글의 번호가
             * 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정
             */
            if(page.getEndCount() < totalCount)
                  lastCount = page.getEndCount() + 1;

 

            // 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
            list = list.subList(page.getStartCount(), lastCount);

 

            return SUCCESS;
      }
 
      public List<noticeVO> getList() { return list; }
      public void setList(List<noticeVO> list) { this.list = list; }

 

      public int getCurrentPage() { return currentPage; }
      public void setCurrentPage(int currentPage) { this.currentPage = currentPage; }

 

      public int getTotalCount() { return totalCount; }
      public void setTotalCount(int totalCount) { this.totalCount = totalCount; }

 

      public int getBlockCount() { return blockCount; }
      public void setBlockCount(int blockCount) { this.blockCount = blockCount; }

 

      public int getBlockPage() { return blockPage; }
      public void setBlockPage(int blockPage) { this.blockPage = blockPage; }

 

      public String getPagingHtml() { return pagingHtml; }
      public void setPagingHtml(String pagingHtml) { this.pagingHtml = pagingHtml; }

 

      public pagingAction getPage() { return page; }
      public void setPage(pagingAction page) { this.page = page; }
}


