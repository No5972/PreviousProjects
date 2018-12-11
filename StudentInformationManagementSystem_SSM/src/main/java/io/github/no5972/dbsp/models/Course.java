package io.github.no5972.dbsp.models;

public class Course {
	String cno;
	String cname;
	float ccredit;
	String cteacher; 
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public float getCcredit() {
		return ccredit;
	}
	public void setCcredit(float ccredit) {
		this.ccredit = ccredit;
	}
	public String getCteacher() {
		return cteacher;
	}
	public void setCteacher(String cteacher) {
		this.cteacher = cteacher;
	}
}
