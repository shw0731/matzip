package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class DeleteAction extends ActionSupport{
	
    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private LikeVO paramClass; // �Ķ���͸� ������ ��ü
    private LikeVO likeResultClass; // ���� ��� ���� ������ ��ü

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
          paramClass = new LikeVO();
          likeResultClass = new LikeVO();

          // �ش� ��ȣ�� ���� �����´�.
          likeResultClass = (LikeVO)sqlMapper.queryForObject("likereg.selectOne", getRestaurantNo());


          // ������ �׸� ����
          paramClass.setRestaurantNo(getRestaurantNo());

          // ���� ���� ����
          sqlMapper.update("likereg.like-down", paramClass);

          return SUCCESS;
    }
	public LikeVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(LikeVO paramClass) {
		this.paramClass = paramClass;
	}
	public LikeVO getlikeResultClass() {
		return likeResultClass;
	}
	public void setlikeResultClass(LikeVO likeResultClass) {
		this.likeResultClass = likeResultClass;
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
