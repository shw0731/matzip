package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.IOException;

public class RegisterAction extends ActionSupport{
	
    public static Reader reader; // ���� ��ũ���� ���� reader
    
    // SqlMapClient API�� ����ϱ� ���� sqlMapper ��ü
    public static SqlMapClient sqlMapper;

    private LikeVO paramClass; // �Ķ���͸� ������ ��ü
    private LikeVO likeResultClass; // ���� ��� ���� ������ ��ü
    
    private int currentPage; // ���� ������
    
    private String memberID;
    private int RestaurantNo;
    
    // ������
    public RegisterAction() throws IOException
    {
          // sqlMapConfig.xml ������ ���������� �����´�.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }
    public String form() throws Exception
    {
          // ��� ��
          return SUCCESS;
    }
    public String execute() throws Exception
    {
          // �Ķ���Ϳ� ����Ʈ ��ü ����
          paramClass = new LikeVO();
          likeResultClass = new LikeVO();

          // ����� �׸� ����
          paramClass.setMemberID(getMemberID());
          paramClass.setRestaurantNo(getRestaurantNo());

          // ��� ���� ����
          sqlMapper.insert("likereg.like-up", paramClass);

         
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
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public int getRestaurantNo() {
		return RestaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		RestaurantNo = restaurantNo;
	}
}
