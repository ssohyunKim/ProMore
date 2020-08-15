package com.promore.workspace.dto;

public class ReplyLikeDto {
	private int replyNum;
	private String memId;

	public ReplyLikeDto() {
	}

	public ReplyLikeDto(int replyNum, String memId) {
		this.replyNum = replyNum;
		this.memId = memId;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "ReplyLikeDto [replyNum=" + replyNum + ", memId=" + memId + "]";
	}
}
