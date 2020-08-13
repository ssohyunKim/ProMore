package com.promore.workspace.dto;

import java.util.Date;

public class WorkspaceDto {
	private int workNum;
	private String workSender;
	private String workReceiver;
	private String workSubject;
	private String workContent;
	private int workState;
	private Date workStartDate;
	private Date workEndDate;
	private String writeDate;
	private String workFileName;
	private String workFilePath;
	private int workFileSize;
	
	public WorkspaceDto() {}
	
	public WorkspaceDto(int workNum, String workSender, String workReceiver, String workSubject, String workContent,
			int workState, Date workStartDate, Date workEndDate, String writeDate, String workFileName,
			String workFilePath, int workFileSize) {
		super();
		this.workNum = workNum;
		this.workSender = workSender;
		this.workReceiver = workReceiver;
		this.workSubject = workSubject;
		this.workContent = workContent;
		this.workState = workState;
		this.workStartDate = workStartDate;
		this.workEndDate = workEndDate;
		this.writeDate = writeDate;
		this.workFileName = workFileName;
		this.workFilePath = workFilePath;
		this.workFileSize = workFileSize;
	}

	public int getWorkNum() {
		return workNum;
	}

	public void setWorkNum(int workNum) {
		this.workNum = workNum;
	}

	public String getWorkSender() {
		return workSender;
	}

	public void setWorkSender(String workSender) {
		this.workSender = workSender;
	}

	public String getWorkReceiver() {
		return workReceiver;
	}

	public void setWorkReceiver(String workReceiver) {
		this.workReceiver = workReceiver;
	}

	public String getWorkSubject() {
		return workSubject;
	}

	public void setWorkSubject(String workSubject) {
		this.workSubject = workSubject;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public int getWorkState() {
		return workState;
	}

	public void setWorkState(int workState) {
		this.workState = workState;
	}

	public Date getWorkStartDate() {
		return workStartDate;
	}

	public void setWorkStartDate(Date workStartDate) {
		this.workStartDate = workStartDate;
	}

	public Date getWorkEndDate() {
		return workEndDate;
	}

	public void setWorkEndDate(Date workEndDate) {
		this.workEndDate = workEndDate;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getWorkFileName() {
		return workFileName;
	}

	public void setWorkFileName(String workFileName) {
		this.workFileName = workFileName;
	}

	public String getWorkFilePath() {
		return workFilePath;
	}

	public void setWorkFilePath(String workFilePath) {
		this.workFilePath = workFilePath;
	}

	public int getWorkFileSize() {
		return workFileSize;
	}

	public void setWorkFileSize(int workFileSize) {
		this.workFileSize = workFileSize;
	}

	@Override
	public String toString() {
		return "WorkspaceDto [workNum=" + workNum + ", workSender=" + workSender + ", workReceiver=" + workReceiver
				+ ", workSubject=" + workSubject + ", workContent=" + workContent + ", workState=" + workState
				+ ", workStartDate=" + workStartDate + ", workEndDate=" + workEndDate + ", writeDate=" + writeDate
				+ ", workFileName=" + workFileName + ", workFilePath=" + workFilePath + ", workFileSize=" + workFileSize
				+ "]";
	}
	

}
