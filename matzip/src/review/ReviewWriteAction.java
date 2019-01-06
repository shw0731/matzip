package review;

import restaurantPage.BoardVO;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.commons.io.FileUtils;

import java.io.Reader;
import java.io.File;
import java.io.IOException;
public class ReviewWriteAction extends ActionSupport implements SessionAware{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private BoardVO restParamClass;
	
	private ReviewVO paramClass;
	private ReviewVO resultClass;

	private int restaurantNo;
	private int currentPage;
	
	private Map session;
	
	private String ID;
	private String subject;
	private String context;
	private int reviewNo;
	private String images;
	private int sympathy;
	private float starPoint;
	Calendar today = Calendar.getInstance();
	
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";
	public ReviewWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	public String execute() {
		paramClass = new ReviewVO();
		resultClass = new ReviewVO();
		ID=(String)session.get("ID");
		paramClass.setRestaurantNo(getRestaurantNo());
		paramClass.setID(ID);
		paramClass.setSubject(getSubject());
		paramClass.setContext(getContext());
		paramClass.setImages("0");
		paramClass.setStarPoint(getStarPoint());
		paramClass.setSympathy(0);
		paramClass.setReg_date(today.getTime());
		try {
		sqlMapper.insert("review.insertReview",paramClass);
		
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
		}catch(Exception e){
			e.printStackTrace();
		}
		 
		return SUCCESS;
	}
public void makeDir()throws Exception{
		
		reviewNo = (int)sqlMapper.queryForObject("review.selectLastNo");
		fileUploadPath+=getRestaurantNo()+"\\";
		fileUploadPath+=reviewNo;
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
	public ReviewVO getParamClass() {
		return paramClass;
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
	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
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
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public int getSympathy() {
		return sympathy;
	}
	public void setSympathy(int sympathy) {
		this.sympathy = sympathy;
	}
	public float getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}
	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}
	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}
	public List<File> getUploads() {
		return uploads;
	}
	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	
}
