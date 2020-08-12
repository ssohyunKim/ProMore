package com.promore.manager.dto;

import java.util.Date;

public class NoticeDto {
	private int notNum;
	private String notTitle;
	private String notContent;
	private Date notWriteDate;
	private String notFileName;
	private String notFilePath;
	private long notFileSize;
	private int notReadCount;

	public NoticeDto() {}

	public NoticeDto(int notNum, String notTitle, String notContent, Date notWriteDate, String notFileName,
			String notFilePath, long notFileSize, int notReadCount) {
		this.notNum = notNum;
		this.notTitle = notTitle;
		this.notContent = notContent;
		this.notWriteDate = notWriteDate;
		this.notFileName = notFileName;
		this.notFilePath = notFilePath;
		this.notFileSize = notFileSize;
		this.notReadCount = notReadCount;
	}

	public int getNotNum() {
		return notNum;
	}

	public void setNotNum(int notNum) {
		this.notNum = notNum;
	}

	public String getNotTitle() {
		return notTitle;
	}

	public void setNotTitle(String notTitle) {
		this.notTitle = notTitle;
	}

	public String getNotContent() {
		return notContent;
	}

	public void setNotContent(String notContent) {
		this.notContent = notContent;
	}

	public Date getNotWriteDate() {
		return notWriteDate;
	}

	public void setNotWriteDate(Date notWriteDate) {
		this.notWriteDate = notWriteDate;
	}

	public String getNotFileName() {
		return notFileName;
	}

	public void setNotFileName(String notFileName) {
		this.notFileName = notFileName;
	}

	public String getNotFilePath() {
		return notFilePath;
	}

	public void setNotFilePath(String notFilePath) {
		this.notFilePath = notFilePath;
	}

	public long getNotFileSize() {
		return notFileSize;
	}

	public void setNotFileSize(long notFileSize) {
		this.notFileSize = notFileSize;
	}

	public int getNotReadCount() {
		return notReadCount;
	}

	public void setNotReadCount(int notReadCount) {
		this.notReadCount = notReadCount;
	}

	@Override
	public String toString() {
		return "NoticeDto [notNum=" + notNum + ", notTitle=" + notTitle + ", notContent=" + notContent
				+ ", notWriteDate=" + notWriteDate + ", notFileName=" + notFileName + ", notFilePath=" + notFilePath
				+ ", notFileSize=" + notFileSize + ", notReadCount=" + notReadCount + "]";
	}

}