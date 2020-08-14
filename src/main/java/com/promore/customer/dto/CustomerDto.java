package com.promore.customer.dto;

import java.util.Date;

public class CustomerDto {
	private int cusNum;
	private String cusTitle;
	private String cusCate;
	private String cusId;
	private Date cusDate;
	
	private String cusContent;
	private String cusFileName;
	private String cusFilePath;
	private long cusFileSize;
	private int cusState;
	
	public CustomerDto() {}

	public CustomerDto(int cusNum, String cusTitle, String cusCate, String cusId, Date cusDate, String cusContent,
			String cusFileName, String cusFilePath, long cusFileSize, int cusState) {
		super();
		this.cusNum = cusNum;
		this.cusTitle = cusTitle;
		this.cusCate = cusCate;
		this.cusId = cusId;
		this.cusDate = cusDate;
		this.cusContent = cusContent;
		this.cusFileName = cusFileName;
		this.cusFilePath = cusFilePath;
		this.cusFileSize = cusFileSize;
		this.cusState = cusState;
	}

	public int getCusNum() {
		return cusNum;
	}

	public void setCusNum(int cusNum) {
		this.cusNum = cusNum;
	}

	public String getCusTitle() {
		return cusTitle;
	}

	public void setCusTitle(String cusTitle) {
		this.cusTitle = cusTitle;
	}

	public String getCusCate() {
		return cusCate;
	}

	public void setCusCate(String cusCate) {
		this.cusCate = cusCate;
	}

	public String getCusId() {
		return cusId;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	public Date getCusDate() {
		return cusDate;
	}

	public void setCusDate(Date cusDate) {
		this.cusDate = cusDate;
	}

	public String getCusContent() {
		return cusContent;
	}

	public void setCusContent(String cusContent) {
		this.cusContent = cusContent;
	}

	public String getCusFileName() {
		return cusFileName;
	}

	public void setCusFileName(String cusFileName) {
		this.cusFileName = cusFileName;
	}

	public String getCusFilePath() {
		return cusFilePath;
	}

	public void setCusFilePath(String cusFilePath) {
		this.cusFilePath = cusFilePath;
	}

	public long getCusFileSize() {
		return cusFileSize;
	}

	public void setCusFileSize(long cusFileSize) {
		this.cusFileSize = cusFileSize;
	}

	public int getCusState() {
		return cusState;
	}

	public void setCusState(int cusState) {
		this.cusState = cusState;
	}

	@Override
	public String toString() {
		return "CustomerDto [cusNum=" + cusNum + ", cusTitle=" + cusTitle + ", cusCate=" + cusCate + ", cusId=" + cusId
				+ ", cusDate=" + cusDate + ", cusContent=" + cusContent + ", cusFileName=" + cusFileName
				+ ", cusFilePath=" + cusFilePath + ", cusFileSize=" + cusFileSize + ", cusState=" + cusState + "]";
	}
	
}
