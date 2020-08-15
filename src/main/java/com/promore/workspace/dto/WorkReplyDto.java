package com.promore.workspace.dto;

import java.util.Date;

public class WorkReplyDto {
	private int replyNum;
	private String replyId;
	private Date replyDate;
	private int replyLike;
	private boolean canClickLike;
	private String replyContent;
	private String replyFileName;
	private String replyFilePath;
	private long replyFileSize;
	private int workNum;

	public WorkReplyDto() {
	}

	public WorkReplyDto(int replyNum, String replyId, Date replyDate, int replyLike, boolean canClickLike,
			String replyContent, String replyFileName, String replyFilePath, long replyFileSize, int workNum) {
		this.replyNum = replyNum;
		this.replyId = replyId;
		this.replyDate = replyDate;
		this.replyLike = replyLike;
		this.canClickLike = canClickLike;
		this.replyContent = replyContent;
		this.replyFileName = replyFileName;
		this.replyFilePath = replyFilePath;
		this.replyFileSize = replyFileSize;
		this.workNum = workNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getReplyLike() {
		return replyLike;
	}

	public void setReplyLike(int replyLike) {
		this.replyLike = replyLike;
	}

	public boolean isCanClickLike() {
		return canClickLike;
	}

	public void setCanClickLike(boolean canClickLike) {
		this.canClickLike = canClickLike;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyFileName() {
		return replyFileName;
	}

	public void setReplyFileName(String replyFileName) {
		this.replyFileName = replyFileName;
	}

	public String getReplyFilePath() {
		return replyFilePath;
	}

	public void setReplyFilePath(String replyFilePath) {
		this.replyFilePath = replyFilePath;
	}

	public long getReplyFileSize() {
		return replyFileSize;
	}

	public void setReplyFileSize(long replyFileSize) {
		this.replyFileSize = replyFileSize;
	}

	public int getWorkNum() {
		return workNum;
	}

	public void setWorkNum(int workNum) {
		this.workNum = workNum;
	}

	@Override
	public String toString() {
		return "WorkReplyDto [replyNum=" + replyNum + ", replyId=" + replyId + ", replyDate=" + replyDate
				+ ", replyLike=" + replyLike + ", canClickLike=" + canClickLike + ", replyContent=" + replyContent
				+ ", replyFileName=" + replyFileName + ", replyFilePath=" + replyFilePath + ", replyFileSize="
				+ replyFileSize + ", workNum=" + workNum + "]";
	}
}
