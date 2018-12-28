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
	public static Reader reader; //���� ��Ʈ���� ���� reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private BoardVO paramClass; //�Ķ���͸� ������ ��ü
	private BoardVO resultClass; //���� ��� ���� ������ ��ü

	private int currentPage; //���� ������

	private int restaurantNo; //��������ȣ
	private String ownerID; //���ξ��̵�
	private String restaurantName; //�������̸�
	private String context; //����
	private String images; //���ε� �̹���
	private String category; //ī�װ�
	private String address; //�ּҰ�
	private String location; //��ġ����
/*	private File upload; //���� ��ü
	private String uploadContentType;//������ Ÿ��
	private String uploadFileName; //���ε����ϸ�
	private String fileUploadPath = "C:\\Java\\upload\\"; //���ε� ���.
*/
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";


	// ������
	public WriteAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	public String form() throws Exception {
		//��� ��.
		return SUCCESS;
	}

	// �Խ��� WRITE �׼�
	public String execute() throws Exception {

		//�Ķ���Ϳ� ����Ʈ ��ü ����.
		paramClass = new BoardVO();
		resultClass = new BoardVO();

		// ����� �׸� ����.
		paramClass.setRestaurantNo(getRestaurantNo());
		paramClass.setRestaurantName(getRestaurantName());
		paramClass.setAddress(getAddress());
		paramClass.setCategory(getCategory());
		paramClass.setContext(getContext());
	
		// ��� ���� ����.
		sqlMapper.insert("rest.insertBoard", paramClass);

/*		// ÷�������� �����ߴٸ� ������ ���ε��Ѵ�.
		if (getUpload() != null) {

			//����� �� ��ȣ ��������.
			resultClass = (BoardVO) sqlMapper.queryForObject("rest.selectLastNo");


			//������ ���� ����.
			File destFile=new File(fileUploadPath+getUploadFileName());
			FileUtils.copyFile(getUpload(), destFile);

			//���� ���� ������Ʈ.
			sqlMapper.update("rest.updateFile", paramClass);*/

		for (int i = 0; i < uploads.size(); i++) {
			File destFile = new File(fileUploadPath
					+ getUploadsFileName().get(i));
			
			FileUtils.copyFile(getUploads().get(i), destFile);
		}

		return SUCCESS;
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

	public String getOwnerID() {
		return ownerID;
	}

	public void setOwnerID(String ownerID) {
		this.ownerID = ownerID;
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
