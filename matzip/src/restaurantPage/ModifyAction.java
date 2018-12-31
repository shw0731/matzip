package restaurantPage;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class ModifyAction extends ActionSupport
{
      public static Reader reader;
      public static SqlMapClient sqlMapper;
 
      private BoardVO paramClass; // �Ķ���͸� ������ ��ü
      private BoardVO restResultClass; // ���� ��� ���� ������ ��ü
 
      private int currentPage; // ���� ������
      
      private int restaurantNo;
      private String restaurantName;
      private String context;
      private String images;
      private String category;
      private String address;
      private String location;
 
	  	private List<File> uploads = new ArrayList<File>();
	  	private List<String> uploadsFileName = new ArrayList<String>();
	  	private List<String> uploadsContentType = new ArrayList<String>();
	  	private String fileUploadPath = "C:\\Java\\upload\\";
 
      // ������
      public ModifyAction() throws IOException
      {
            // sqlMapConfig.xml ������ ���������� �����´�.
            reader = Resources.getResourceAsReader("sqlMapConfig.xml");
  
            // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
            sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
            reader.close();
      }
 
      // �Խñ� ����
      public String execute() throws Exception
      {
            // �Ķ���Ϳ� ����Ʈ ��ü ����
            paramClass = new BoardVO();
            restResultClass = new BoardVO();
  
            // ������ �׸� ����
            paramClass.setRestaurantName(getRestaurantName());
            paramClass.setContext(getContext());
            paramClass.setImages(getImages());
            paramClass.setCategory(getCategory());
            paramClass.setAddress(getAddress());
            paramClass.setLocation(getLocation());
            
    		makeDir();
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
    		 paramClass.setImages(images);
    		 paramClass.setRestaurantNo(restaurantNo);
  
            // �ϴ� �׸� �����Ѵ�.
            sqlMapper.update("rest.updateBoard", paramClass);
  

  
            // ������ ������ view �������� �̵�
            restResultClass = (BoardVO)sqlMapper.queryForObject("rest.selectOne", getRestaurantNo());
  
            return SUCCESS;
      }
      public void makeDir()throws Exception{
  		
    		
  		
  		

  		restaurantNo = (int)sqlMapper.queryForObject("rest.selectID","11");
  		fileUploadPath+=restaurantNo;
  		File Folder = new File(fileUploadPath);
  		
  		// �ش� ���丮�� ������� ���丮�� �����մϴ�.
  		if (!Folder.exists()) {
  			try{
  			    Folder.mkdir(); //���� �����մϴ�.
  			    
  		        } 
  		        catch(Exception e){
  			    e.getStackTrace();
  		        }        
  	        }
  		fileUploadPath+="\\";
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