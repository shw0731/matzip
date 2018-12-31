package restaurantPage; // ���� ������ ��Ű��

import com.opensymphony.xwork2.ActionSupport; 
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;

import java.util.*;
import java.io.Reader;
import java.io.File;
import java.io.IOException;

import restaurantPage.PagingAction;
/*@SuppressWarnings("serial")
@Results({
	@Result(name="success",value="/common/RestaurantList.jsp")
})*/

public class ListAction extends ActionSupport{ //���� Ŭ������ ���Ը���Ʈ�׼��� �׼� ����Ʈ�� Ȯ���Ѵ�.
	public static Reader reader;
	public static SqlMapClient sqlMapper;	//SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü.

	private List<BoardVO> list = new ArrayList<BoardVO>();;	 
	
	private int currentPage = 1;	//���� ������
	private int totalCount; 		// �� �Խù��� ��
	private int blockCount = 10;	// �� ��������  �Խù��� ��
	private int blockPage = 5; 	// �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; 	//����¡�� ������ HTML
	private PagingAction page; 	// ����¡ Ŭ����
	
	
	
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();
	private String fileUploadPath = "C:\\Java\\App\\YammyYammy\\WebContent\\YammyYammy\\upload\\YammyList\\";	//���ε� ���
	/*C:\\Java\\upload\\YammyList\\*/
	
	
	public ListAction() throws IOException { //�����������׼ǿ��� ������ IOException�� ó���ϴ� Ŭ����)
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}
	// �Խ��� LIST �׼�
	public String execute() throws Exception { // ��� ���ܿ� ���� ����
		// ��� ���� ������ list�� �ִ´�. selectAll����������� �����͸� �̾� list ��ü�� �־��ش�.
		list = sqlMapper.queryForList("rest.selectAll"); 

		totalCount = list.size(); // ��ü �� ������ ���Ѵ�. //list�� ������ totalcount ��ü�� �����Ѵ�.
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
		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}


	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
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
}
