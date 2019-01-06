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

	import blackList.BlackListVO;
import member.MemberVO;

	public class BlackListAction extends ActionSupport{
		
		public static Reader reader;
		public static SqlMapClient sqlMapper;

		private BlackListVO paramClass;
		private MemberVO MemparamClass;
		
		private int phoneNumber;
		
		public BlackListAction() throws IOException{
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}
		
		public String execute() throws Exception{
			  
			paramClass = new BlackListVO();
			MemparamClass = new MemberVO();

			paramClass.setPhoneNumber(getPhoneNumber());
		    MemparamClass.setPhoneNumber(getPhoneNumber());
			
			sqlMapper.delete("member.blackIDDelete", MemparamClass);
			sqlMapper.insert("blackList.blackListRegister", paramClass);
			
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

		public BlackListVO getParamClass() {
			return paramClass;
		}

		public void setParamClass(BlackListVO paramClass) {
			this.paramClass = paramClass;
		}

		
		public MemberVO getMemparamClass() {
			return MemparamClass;
		}

		public void setMemparamClass(MemberVO memparamClass) {
			MemparamClass = memparamClass;
		}

		public int getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(int phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

	 

}
