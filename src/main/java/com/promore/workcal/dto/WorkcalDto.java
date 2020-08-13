package com.promore.workcal.dto;

import java.util.Date;

public class WorkcalDto {
	private int workNum;
	private int workState;
	private String workSender;
	private String workReceiver;
	private String workSubject;
	private String workContent;
	private Date workStartDate;
	private Date workEndDate;

	public WorkcalDto() {
	}

	public WorkcalDto(int workNum, int workState, String workSender, String workReceiver, String workSubject,
			String workContent, Date workStartDate, Date workEndDate) {
		super();
		this.workNum = workNum;
		this.workState = workState;
		this.workSender = workSender;
		this.workReceiver = workReceiver;
		this.workSubject = workSubject;
		this.workContent = workContent;
		this.workStartDate = workStartDate;
		this.workEndDate = workEndDate;
	}

	public int getWorkNum() {
		return workNum;
	}

	public void setWorkNum(int workNum) {
		this.workNum = workNum;
	}

	public int getWorkState() {
		return workState;
	}

	public void setWorkState(int workState) {
		this.workState = workState;
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

	@Override
	public String toString() {
		return "WorkcalDto [workNum=" + workNum + ", workState=" + workState + ", workSender=" + workSender
				+ ", workReceiver=" + workReceiver + ", workSubject=" + workSubject + ", workContent=" + workContent
				+ ", workStartDate=" + workStartDate + ", workEndDate=" + workEndDate + "]";
	}
}
