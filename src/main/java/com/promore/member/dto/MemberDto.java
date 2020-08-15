package com.promore.member.dto;


import org.apache.ibatis.type.Alias;

@Alias("memberDto")
public class MemberDto {
	
	private int mem_num;
	private String mem_id; 
	private String mem_name;
	private String mem_nickname;
	private String mem_password;
	private String mem_phone;
	private String mem_email;
	private int mem_mailing;
	private String mem_skills;
//	private String user_key;
	private String mem_level;
	
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public int getMem_mailing() {
		return mem_mailing;
	}

	public void setMem_mailing(int mem_mailing) {
		this.mem_mailing = mem_mailing;
	}

	public String getMem_skills() {
		return mem_skills;
	}

	public void setMem_skills(String mem_skills) {
		this.mem_skills = mem_skills;
	}

//	public String getUser_key() {
//		return user_key;
//	}
//
//	public void setUser_key(String user_key) {
//		this.user_key = user_key;
//	}

	public String getMem_level() {
		return mem_level;
	}

	public void setMem_level(String mem_level) {
		this.mem_level = mem_level;
	}

	@Override
	public String toString() {
		return "MemberDto [mem_num=" + mem_num + ", "
				+ "mem_id=" + mem_id + ", "
				+ "mem_name=" + mem_name +", "
				+ "mem_nickname="	+ mem_nickname + ", "
				+ "mem_password=" + mem_password + ", "
				+ "mem_phone=" + mem_phone + ", "
				+ "mem_email="+ mem_email + ", "
				+ "mem_mailing=" + mem_mailing + ", "
				+ "mem_skills=" + mem_skills + ", "
//				+ "user_key=" + user_key+ ", "
				+ "mem_level=" + mem_level + "]";
	}
}