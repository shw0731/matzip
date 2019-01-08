package review;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.media.jai.GeometricOpImage;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionContext;

import java.io.File;
import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;
import restaurantPage.BoardVO;


public class ReviewModifyAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass;
	private ReviewVO resultClass;
	private BoardVO restParamClass;
	
	private String subject;
	private String context; 
	private String images;
	private int starPoint;
	private int reviewNo;
	private int restaurantNo;
	private String ID;
	
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";
	
	
	public ReviewModifyAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception{
		reviewNo = getReviewNo();
		restaurantNo=getRestaurantNo();
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		  
		paramClass = new ReviewVO();
		paramClass.setReviewNo(getReviewNo());
		paramClass.setSubject(getSubject());
		paramClass.setContext(getContext());
		paramClass.setImages("0");
		paramClass.setStarPoint(getStarPoint());
		paramClass.setRestaurantNo(getRestaurantNo());
		


		sqlMapper.update("review.updateReview", paramClass);
		
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
		 paramClass.setReviewNo(reviewNo);
		
		 sqlMapper.update("review.updateFile",paramClass);
		 //평점 기능
		 float avg =(float)sqlMapper.queryForObject("review.AvgStarPoint", getRestaurantNo());
		 restParamClass = new BoardVO();
		 restParamClass.setRestaurantNo(getRestaurantNo());
		 restParamClass.setStarPoint(avg);
		 sqlMapper.update("rest.updateAvg",restParamClass );

		return SUCCESS;
		
	}
	public void makeDir()throws Exception{
		
		reviewNo =getReviewNo();
		fileUploadPath+=getRestaurantNo()+"\\";
		fileUploadPath+=reviewNo;
		File Folder = new File(fileUploadPath);
	
		if (!Folder.exists()) {
			try{
			    Folder.mkdir();
			    
		        } 
		        catch(Exception e){
			    e.getStackTrace();
		        }        
	        }
		fileUploadPath+="\\";
		}
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ReviewModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ReviewModifyAction.sqlMapper = sqlMapper;
	}

	public ReviewVO getParamClass() {
		return paramClass;
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

	public void setParamClass(ReviewVO paramClass) {
		this.paramClass = paramClass;
	}

	public ReviewVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(ReviewVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public void setImages(String Images) {
		this.images = Images;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	public BoardVO getRestParamClass() {
		return restParamClass;
	}

	public void setRestParamClass(BoardVO restParamClass) {
		this.restParamClass = restParamClass;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

}
