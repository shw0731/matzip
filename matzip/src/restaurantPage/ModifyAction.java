package restaurantPage;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class ModifyAction extends ActionSupport implements SessionAware
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private BoardVO paramClass; // 파라미터를 저장할 객체
      private BoardVO restResultClass; // 쿼리 결과 값을 저장할 객체
 
      private int currentPage; // 현재 페이지
      private Map session;
      private int restaurantNo;
      private String restaurantName;
      private String context;
      private String images;
      private String category;
      private String address;
      private String location;
      private String Old_file;
      private String ID;
 
	  private List<File> uploads = new ArrayList<File>();
	  private List<String> uploadsFileName = new ArrayList<String>();
	  private List<String> uploadsContentType = new ArrayList<String>();
	  private String fileUploadPath = "C:\\Java\\upload\\";
 
      // 생성자
      public ModifyAction() throws IOException
      {
            // sqlMapConfig.xml 파일의 설정내용을 가져온다.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // 게시글 수정
      public String execute() 
      {
    	  try {
            // 파라미터와 리절트 객체 생성
            paramClass = new BoardVO();
            restResultClass = new BoardVO();
  
            // 수정할 항목 설정
            paramClass.setRestaurantName(getRestaurantName());
            paramClass.setContext(getContext());
            paramClass.setImages(getImages());
            paramClass.setCategory(getCategory());
            paramClass.setAddress(getAddress());
            paramClass.setLocation(getLocation());
            paramClass.setID((String)session.get("ID"));
            

            
            if(getUploads()!=null){
            	//기존파일 삭제
            	makeDir();
            	
            	File deleteFile = new File(fileUploadPath+getOld_file());
            			deleteFile.delete();
            	
            	//새 파일 업로드
	    		for (int i = 0; i < uploads.size(); i++) {
	    			File destFile = new File(fileUploadPath
	    					+ getUploadsFileName().get(i));
	    			if(images==null)
	    				images=getUploadsFileName().get(i);
	    			else
	    				images+=getUploadsFileName().get(i);
	    			if(i!=uploads.size()-1)
	    				images+=",";
	    			FileUtils.copyFile(getUploads().get(i), destFile);
	    		}
            }
    		
    		 paramClass.setImages(images);
    		 
    	  	restaurantNo = (int)sqlMapper.queryForObject("rest.selectID", session.get("ID"));
    		 paramClass.setRestaurantNo(restaurantNo);
  
            // 일단 항목만 수정한다.
            sqlMapper.update("rest.updateBoard", paramClass);
  

  
            // 수정이 끝나면 view 페이지로 이동
            restResultClass = (BoardVO)sqlMapper.queryForObject("rest.selectOne", session.get("ID"));
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
            return SUCCESS;
      }
      public void makeDir()throws Exception{
  		
  		restaurantNo = (int)sqlMapper.queryForObject("rest.selectID",session.get("ID"));
  		fileUploadPath+=restaurantNo;
  		File Folder = new File(fileUploadPath);
  		
  		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
  		if (!Folder.exists()) {
  			try{
  			    Folder.mkdir(); //폴더 생성합니다.
  			    
  		        } 
  		        catch(Exception e){
  			    e.getStackTrace();
  		        }        
  	        }
  		fileUploadPath+="\\";
  		} 

      
      
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getOld_file() {
		return Old_file;
	}

	public void setOld_file(String old_file) {
		Old_file = old_file;
	}

	public BoardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(BoardVO paramClass) {
		this.paramClass = paramClass;
	}

	public BoardVO getRestResultClass() {
		return restResultClass;
	}

	public void setRestResultClass(BoardVO restResultClass) {
		this.restResultClass = restResultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<File> getUploads() {
		return uploads;
	}

	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}

	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}

	public List<String> getUploadsContentType() {
		return uploadsContentType;
	}

	public void setUploadsContentType(List<String> uploadsContentType) {
		this.uploadsContentType = uploadsContentType;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
}