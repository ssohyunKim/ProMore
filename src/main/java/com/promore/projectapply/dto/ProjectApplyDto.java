package com.promore.projectApply.dto;

public class ProjectApplyDto {
	
	private int aplNo;
	private int aplNum;
	private String aplMemId;
	
	public ProjectApplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectApplyDto(int aplNo, int aplNum, String aplMemId) {
		super();
		this.aplNo = aplNo;
		this.aplNum = aplNum;
		this.aplMemId = aplMemId;
	}
	public int getAplNo() {
		return aplNo;
	}
	public void setAplNo(int aplNo) {
		this.aplNo = aplNo;
	}
	public int getAplNum() {
		return aplNum;
	}
	public void setAplNum(int aplNum) {
		this.aplNum = aplNum;
	}
	public String getAplMemId() {
		return aplMemId;
	}
	public void setAplMemId(String aplMemId) {
		this.aplMemId = aplMemId;
	}
	
	@Override
	public String toString() {
		return "ProjectApplyDto [aplNo=" + aplNo + ", aplNum=" + aplNum + ", aplMemId=" + aplMemId + "]";
	}

	
	
	
	
	
}
