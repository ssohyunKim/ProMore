package com.promore.calendar.dto;

import java.util.Date;

public class CalendarDto {
	private long scheNum;
	private String scheTitle;
	private Date scheStartDate;
	private Date scheEndDate;
	private String scheContent;
	private int proNum;
	
	public CalendarDto() {
	}

	public CalendarDto(long scheNum, String scheTitle, Date scheStartDate, Date scheEndDate, String scheContent,
			int proNum) {
		this.scheNum = scheNum;
		this.scheTitle = scheTitle;
		this.scheStartDate = scheStartDate;
		this.scheEndDate = scheEndDate;
		this.scheContent = scheContent;
		this.proNum = proNum;
	}

	public long getScheNum() {
		return scheNum;
	}

	public void setScheNum(long scheNum) {
		this.scheNum = scheNum;
	}

	public String getScheTitle() {
		return scheTitle;
	}

	public void setScheTitle(String scheTitle) {
		this.scheTitle = scheTitle;
	}

	public Date getScheStartDate() {
		return scheStartDate;
	}

	public void setScheStartDate(Date scheStartDate) {
		this.scheStartDate = scheStartDate;
	}

	public Date getScheEndDate() {
		return scheEndDate;
	}

	public void setScheEndDate(Date scheEndDate) {
		this.scheEndDate = scheEndDate;
	}

	public String getScheContent() {
		return scheContent;
	}

	public void setScheContent(String scheContent) {
		this.scheContent = scheContent;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	@Override
	public String toString() {
		return "CalenderDto [scheNum=" + scheNum + ", scheTitle=" + scheTitle + ", scheStartDate=" + scheStartDate
				+ ", scheEndDate=" + scheEndDate + ", scheContent=" + scheContent + ", proNum=" + proNum + "]";
	}
}
