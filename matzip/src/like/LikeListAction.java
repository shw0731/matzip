package like;

import com.opensymphony.xwork2.ActionSupport;

import like.PagingAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

public class LikeListAction extends ActionSupport{
	 // ���� ��Ʈ���� ���� reader
    public static Reader reader;
    
    // SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
    public static SqlMapClient sqlMapper;
    
    private List<LikeVO> likeList = new ArrayList<LikeVO>();
    
    private int currentPage = 1; // ���� ������
    private int totalCount; // �� �Խù��� ��
    private int blockCount = 10; // �� ��������  �Խù��� ��
    private int blockPage = 5; // �� ȭ�鿡 ������ ������ ��
    private String pagingHtml; // ����¡�� ������ html
    private PagingAction page; // ����¡ Ŭ����
    
    public LikeListAction() throws IOException 
    {
          // sqlMapConfig.xml ������ ���������� �����´�.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String execute() throws Exception{
    	likeList = sqlMapper.queryForList("likereg.like-list");
    	
    	totalCount = likeList.size(); //��ü ���ƿ� �� ������ ���� ���ϱ�
    	
    	//pagingAction��ü
        page = new PagingAction(currentPage, totalCount, blockCount, blockPage); 
        pagingHtml = page.getPagingHtml().toString(); // ������ html ����
        
        // ���� ���������� ������ ������ ���� ��ȣ ����
        int lastCount = totalCount;
        
        if(page.getEndCount() < totalCount)
            lastCount = page.getEndCount() + 1;
        
        // ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
        likeList = likeList.subList(page.getStartCount(), lastCount);        
       
        return SUCCESS;
    }
	public List<LikeVO> getLikeList() {
		return likeList;
	}
	public void setList(List<LikeVO> likeList) {
		this.likeList = likeList;
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
