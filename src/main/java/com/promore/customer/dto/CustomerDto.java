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
	
	private int cusGroupNumber;
	private int cusSequenceNumber;
	private int cusSequenceLevel;
	
	public CustomerDto() {}

	public CustomerDto(int cusNum, String cusTitle, String cusCate, String cusId, Date cusDate,
			String cusContent, String cusFileName, String cusFilePath, long cusFileSize, int cusGroupNumber,
			int cusSequenceNumber, int cusSequenceLevel) {
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
		this.cusGroupNumber = cusGroupNumber;
		this.cusSequenceNumber = cusSequenceNumber;
		this.cusSequenceLevel = cusSequenceLevel;
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

	public int getCusGroupNumber() {
		return cusGroupNumber;
	}

	public void setCusGroupNumber(int cusGroupNumber) {
		this.cusGroupNumber = cusGroupNumber;
	}

	public int getCusSequenceNumber() {
		return cusSequenceNumber;
	}

	public void setCusSequenceNumber(int cusSequenceNumber) {
		this.cusSequenceNumber = cusSequenceNumber;
	}

	public int getCusSequenceLevel() {
		return cusSequenceLevel;
	}

	public void setCusSequenceLevel(int cusSequenceLevel) {
		this.cusSequenceLevel = cusSequenceLevel;
	}

	@Override
	public String toString() {
		return "CustomerDto [cusNum=" + cusNum + ", cusTitle=" + cusTitle + ", cusCate=" + cusCate + ", cusId=" + cusId
				+ ", "+ "cusDate=" + cusDate + ", cusContent=" + cusContent
				+ ", cusFileName=" + cusFileName + ", cusFilePath=" + cusFilePath + ", cusFileSize=" + cusFileSize
				+ ", cusGroupNumber=" + cusGroupNumber + ", cusSequenceNumber=" + cusSequenceNumber
				+ ", cusSequenceLevel=" + cusSequenceLevel + "]";
	}
}
