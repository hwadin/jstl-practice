package vo;

import java.util.Date;

public class MemberVO {
	
	private int u_num;
	private String u_id;
	private String u_pass;
	private int u_age;
	private String u_gender;
	private char u_join;
	private Date u_regdate;
	
	// getter & setter & toString
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public int getU_age() {
		return u_age;
	}
	public void setU_age(int u_age) {
		this.u_age = u_age;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public char getU_join() {
		return u_join;
	}
	public void setU_join(char u_join) {
		this.u_join = u_join;
	}
	public Date getU_regdate() {
		return u_regdate;
	}
	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [u_num=" + u_num + ", u_id=" + u_id + ", u_pass=" + u_pass + ", u_age=" + u_age + ", u_gender="
				+ u_gender + ", u_join=" + u_join + ", u_regdate=" + u_regdate + "]";
	}
	

	
}





