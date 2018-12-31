package restaurantPage;


import com.opensymphony.xwork2.ActionSupport;

import restaurantPage.BoardVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class DeleteAction extends ActionSupport{
	
    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private BoardVO paramClass; // �Ķ���͸� ������ ��ü
    private BoardVO restResultClass; // ���� ��� ���� ������ ��ü

    private int currentPage; // ���� ������
    
    private int RestaurantNo;
    
    // ������
    public DeleteAction() throws IOException
    {
          // sqlMapConfig.xml ������ ���������� �����´�.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    // �Խñ� �� ����
    public String execute() throws Exception
    {
          // �Ķ���Ϳ� ����Ʈ ��ü ����
          paramClass = new BoardVO();
          restResultClass = new BoardVO();

          // �ش� ��ȣ�� ���� �����´�.
          restResultClass = (BoardVO)sqlMapper.queryForObject("rest.selectOne", getRestaurantNo());


          // ������ �׸� ����
          paramClass.setRestaurantNo(getRestaurantNo());

          // ���� ���� ����
          sqlMapper.update("rest.deleteBoard", paramClass);

          return SUCCESS;
    }
	public BoardVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(BoardVO paramClass) {
		this.paramClass = paramClass;
	}
	public BoardVO getrestResultClass() {
		return restResultClass;
	}
	public void setrestResultClass(BoardVO restResultClass) {
		this.restResultClass = restResultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRestaurantNo() {
		return RestaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		RestaurantNo = restaurantNo;
	}
}
