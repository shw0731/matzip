package qna;

import java.util.Date;

public class QnAVO {
	private int serviceno;
	private String id;
	private String subject;
	private String context;
	private String password;
	private Date reg_date;
	private int isprivate;
	private int answerno;
	private int isanswer; 
	
	public int getServiceno() {
		return serviceno;
	}
	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	public int getIsprivate() {
		return isprivate;
	}
	public void setIsprivate(int isprivate) {
		this.isprivate = isprivate;
	}
	public int getAnswerno() {
		return answerno;
	}
	public void setAnswerno(int answerno) {
		this.answerno = answerno;
	}
	public void setRe_step(int i) {
		// TODO Auto-generated method stub
		
	}
	public void setRe_level(int i) {
		// TODO Auto-generated method stub
		
	}
	public int getIsanswer() {
		return isanswer;
	}
	public void setIsanswer(int isanswer) {
		this.isanswer = isanswer;
	}

	
	
}
