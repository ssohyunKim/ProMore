package com.promore.project.dto;

public class ProjectDto {
	private int proNum;
	private String proName;
	private String proContent;
	private String proManager;
	private int proState;
	private int proMax;
	private int proCnt;
	
	public ProjectDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectDto(int proNum, String proName, String proContent, String proManager, int proState, int proMax,
			int proCnt) {
		super();
		this.proNum = proNum;
		this.proName = proName;
		this.proContent = proContent;
		this.proManager = proManager;
		this.proState = proState;
		this.proMax = proMax;
		this.proCnt = proCnt;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public String getProManager() {
		return proManager;
	}

	public void setProManager(String proManager) {
		this.proManager = proManager;
	}

	public int getProState() {
		return proState;
	}

	public void setProState(int proState) {
		this.proState = proState;
	}

	public int getProMax() {
		return proMax;
	}

	public void setProMax(int proMax) {
		this.proMax = proMax;
	}

	public int getProCnt() {
		return proCnt;
	}

	public void setProCnt(int proCnt) {
		this.proCnt = proCnt;
	}

	@Override
	public String toString() {
		return "ProjectDto [proNum=" + proNum + ", proName=" + proName + ", proContent=" + proContent + ", proManager="
				+ proManager + ", proState=" + proState + ", proMax=" + proMax + ", proCnt=" + proCnt + "]";
	}
	
	
}
