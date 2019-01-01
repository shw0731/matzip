package search;

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.interceptor.SessionAware;

import java.util.*;
import java.io.Reader;
import java.io.File;
import java.io.IOException;

import restaurantPage.BoardVO;
import restaurantPage.PagingAction;

public class SearchAction extends ActionSupport implements SessionAware{ //���� Ŭ������ ���Ը���Ʈ�׼��� �׼� ����Ʈ�� Ȯ���Ѵ�.
	public static Reader reader;
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<BoardVO> restList = new ArrayList<BoardVO>();;	 
	
	private Map session;
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private PagingAction page; 	// ����¡ Ŭ����
	
	
	
	private List<String> images = new ArrayList<String>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\upload\\";	//���ε� ���
	/*C:\\Java\\upload\\YammyList\\*/
	
	public SearchAction() throws IOException { //�����������׼ǿ��� ������ IOException�� ó���ϴ� Ŭ����)
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	
	public String execute() throws Exception { 
	restList = sqlMapper.queryForList("rest.selectAll"); 

	totalCount = restList.size(); // ��ü �� ������ ���Ѵ�. //list�� ������ totalcount ��ü�� �����Ѵ�.
	// pagingAction ��ü ����. currentPage, totalCount, blockCount, blockPage ���� ������ page���� �������ش�.
	page = new PagingAction(currentPage, totalCount, blockCount, blockPage); 
	pagingHtml = page.getPagingHtml().toString(); // ������ HTML ����.

	// ���� ���������� ������ ������ ���� ��ȣ ����.
	int lastCount = totalCount;

	// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ 
	//lastCount�� +1 ��ȣ�� ����.
	if (page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;

	// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
	restList = restList.subList(page.getStartCount(), lastCount);

	return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public void setRestList(List<BoardVO> restList) {
		this.restList = restList;
	}

	public List<BoardVO> getRestList() {
		return restList;
	}

	
	

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
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
