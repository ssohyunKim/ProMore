package com.promore.member.dto;

public class MemberDto {
	private int memNum;
	private String memId;
	private String memName;
	private String memNickname;
	private String memPassword;
	private String memLevel;
	private String memPhone;
	private String memEmail;
	private int memMailing;
	private String memSkills;
	private String memRegDate;

	public MemberDto() {
	}

	public MemberDto(int memNum, String memId, String memName, String memNickname, String memPassword, String memLevel,
			String memPhone, String memEmail, int memMailing, String memSkills, String memRegDate) {
		this.memNum = memNum;
		this.memId = memId;
		this.memName = memName;
		this.memNickname = memNickname;
		this.memPassword = memPassword;
		this.memLevel = memLevel;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memMailing = memMailing;
		this.memSkills = memSkills;
		this.memRegDate = memRegDate;
	}

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public String getMemPassword() {
		return memPassword;
	}

	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}

	public String getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public int getMemMailing() {
		return memMailing;
	}

	public void setMemMailing(int memMailing) {
		this.memMailing = memMailing;
	}

	public String getMemSkills() {
		return memSkills;
	}

	public void setMemSkills(String memSkills) {
		this.memSkills = memSkills;
	}

	public String getMemRegDate() {
		return memRegDate;
	}

	public void setMemRegDate(String memRegDate) {
		this.memRegDate = memRegDate;
	}

	@Override
	public String toString() {
		return "MemberDto [memNum=" + memNum + ", memId=" + memId + ", memName=" + memName + ", memNickname="
				+ memNickname + ", memPassword=" + memPassword + ", memLevel=" + memLevel + ", memPhone=" + memPhone
				+ ", memEmail=" + memEmail + ", memMailing=" + memMailing + ", memSkills=" + memSkills + ", memRegDate="
				+ memRegDate + "]";
	}

}