package restaurantPage;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

public class PageViewAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private BoardVO paramClass = new BoardVO(); //�Ķ���͸� ������ ��ü
	private BoardVO restResultClass = new BoardVO(); //���� ��� ���� ������ ��ü

	private int currentPage;

	private int restaurantNo;
	private String restaurantName;
	private String context;
	private String images;
	private String category;
	private String address;
	private int likes;
	private String location;
	private int isPower;
	private int isRes;
	private float starPoint;

	private String fileUploadPath = "C:\\Java\\upload\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;

	// ������
	public PageViewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �󼼺���
	public String execute() throws Exception {
		// �ش� �Խù��� ���ƿ� ���� �����´�.
		paramClass.setRestaurantNo(restaurantNo);
		// �ش� ��ȣ�� ���� �����´�.
		restResultClass = (BoardVO) sqlMapper.queryForObject("rest.selectOne", getRestaurantNo());
		return SUCCESS;
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

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getIsPower() {
		return isPower;
	}

	public void setIsPower(int isPower) {
		this.isPower = isPower;
	}

	public int getIsRes() {
		return isRes;
	}

	public void setIsRes(int isRes) {
		this.isRes = isRes;
	}

	public float getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
}