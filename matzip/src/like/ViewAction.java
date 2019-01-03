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

    private LikeVO paramClass = new LikeVO(); // 파라미터를 저장할 객체
    private LikeVO likeResultClass = new LikeVO(); // 쿼리 결과 값을 저장할 객체

    private int currentPage;

    private int RestaurantNo;


    private InputStream inputStream;
    private String contentDisposition;
    private long contentLength;

    // 생성자
    public ViewAction() throws IOException
    {
          // sqlMapConfig.xml 파일의 설정내용을 가져온다.
          reader = Resources.getResourceAsReader("sqlMapConfig.xml");

          // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성
          sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
          reader.close();
    }

    // 상세보기
    public String execute() throws Exception
    {
          // 해당 번호의 글을 가져온다.
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