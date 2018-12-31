package like;

import com.opensymphony.xwork2.ActionSupport;

import like.LikeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.InputStream;
import java.io.IOException;

public class ViewAction extends ActionSupport{
	public static Reader reader;
    public static SqlMapClient sqlMapper;

    private LikeVO paramClass = new LikeVO(); // �Ķ���͸� ������ ��ü
    private LikeVO likeResultClass = new LikeVO(); // ���� ��� ���� ������ ��ü

    private int currentPage;

    private int RestaurantNo;


    private InputStream inputStream;
    private String contentDisposition;
    private long contentLength;

    // ������
    public ViewAction() throws IOException
    {
          // sqlMapConfig.xml ������ ���������� �����´�.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }

    // �󼼺���
    public String execute() throws Exception
    {
          // �ش� ��ȣ�� ���� �����´�.
          likeResultClass = (LikeVO)sqlMapper.queryForObject("rest.selectOne", getRestaurantNo());

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
