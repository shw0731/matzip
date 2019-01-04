package blackList;

	import java.io.Reader;
	import java.util.Map;

	import org.apache.struts2.interceptor.SessionAware;
	import com.opensymphony.xwork2.ActionContext;

	import java.io.IOException;

	import com.ibatis.common.resources.Resources;
	import com.ibatis.sqlmap.client.SqlMapClient;
	import com.ibatis.sqlmap.client.SqlMapClientBuilder;
	import com.opensymphony.xwork2.ActionSupport;

	import member.MemberVO;

	public class BlackListAction extends ActionSupport{
		
		public static Reader reader;
		public static SqlMapClient sqlMapper;

		private MemberVO paramClass;
		private MemberVO resultClass;
		
		private int phoneNumber;
		
		public BlackListAction() throws IOException{
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}
		
		public String execute() throws Exception{
			  
			paramClass = new MemberVO();

			paramClass.setPhoneNumber(getPhoneNumber());
		
			
			sqlMapper.insert("blackList.blackListRegister", paramClass);
			sqlMapper.delete("blackList.blackIDDelete", paramClass);
			
			return SUCCESS;
			
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			BlackListAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			BlackListAction.sqlMapper = sqlMapper;
		}

		public MemberVO getParamClass() {
			return paramClass;
		}

		public void setParamClass(MemberVO paramClass) {
			this.paramClass = paramClass;
		}

		public MemberVO getResultClass() {
			return resultClass;
		}

		public void setResultClass(MemberVO resultClass) {
			this.resultClass = resultClass;
		}

		public int getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(int phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

	 

}
