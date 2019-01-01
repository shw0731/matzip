package notice;

 

import java.util.Date;

 

public class noticeVO 
{
      private int serviceno;
      private String subject;
      private String context;
      private Date reg_date;
	public int getServiceno() {
		return serviceno;
	}
	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
      
}


