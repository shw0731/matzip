package restaurantPage;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

public class WriteAction extends ActionSupport{
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private BoardVO paramClass; //파라미터를 저장할 객체
	private BoardVO resultClass; //쿼리 결과 값을 저장할 객체

	private int currentPage; //현재 페이지

	private int restaurantNo; //음식점번호
	private String ID; //주인아이디
	private String restaurantName; //음식점이름
	private String context; //내용
	private String images; //업로드 이미지
	private String category; //카테고리
	private String address; //주소값
	private String location; //위치정보
/*	private File upload; //파일 객체
	private String uploadContentType;//컨텐츠 타입
	private String uploadFileName; //업로드파일명
	private String fileUploadPath = "C:\\Java\\upload\\"; //업로드 경로.
*/
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";
	
	
	

	// 생성자
	public WriteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	public String form() throws Exception {
		//등록 폼.
		return SUCCESS;
	}

	// 게시판 WRITE 액션
	public String execute() throws Exception {

		//파라미터와 리절트 객체 생성.
		paramClass = new BoardVO();
		resultClass = new BoardVO();
		
	
		
		
		// 등록할 항목 설정.
		paramClass.setID("11");	//예시로 아이디11
		paramClass.setRestaurantNo(getRestaurantNo());
		paramClass.setRestaurantName(getRestaurantName());
		paramClass.setAddress(getAddress());
		paramClass.setCategory(getCategory());
		paramClass.setContext(getContext());
		paramClass.setIsRes(0);
		paramClass.setIsPower(0);
		paramClass.setLocation("0");
		paramClass.setLikes(0);
		paramClass.setStarPoint(0);
		paramClass.setImages("0");
		// 등록 쿼리 수행.
		
		sqlMapper.insert("rest.insertBoard", paramClass);
/*		// 첨부파일을 선택했다면 파일을 업로드한다.
		if (getUpload() != null) {

			//등록한 글 번호 가져오기.
			resultClass = (BoardVO) sqlMapper.queryForObject("rest.selectLastNo");


			//서버에 파일 저장.
			File destFile=new File(fileUploadPath+getUploadFileName());
			FileUtils.copyFile(getUpload(), destFile);

			//파일 정보 업데이트.
			sqlMapper.update("rest.updateFile", paramClass);*/
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
		
		 sqlMapper.update("rest.updateFile",paramClass);
		
		
		return SUCCESS;
	}

	public void makeDir()throws Exception{
		
	
		
		

		restaurantNo = (int)sqlMapper.queryForObject("rest.selectID","11");
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

	public BoardVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(BoardVO paramClass) {
		this.paramClass = paramClass;
	}

	public BoardVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(BoardVO resultClass) {
		this.resultClass = resultClass;
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

	public String getID() {
		return ID;
	}

	public void setOwnerID(String ID) {
		this.ID = ID;
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

/*	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}*/

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
}
