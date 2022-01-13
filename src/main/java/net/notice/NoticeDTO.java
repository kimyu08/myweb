package net.notice;

public class NoticeDTO {
	
	private	int noticeno;	//공지번호
	private String subject;	//글제목
	private String content;	//글내용
	private String regdt;		//글작성일
	
	public NoticeDTO() {} //생성자함수.

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", subject=" + subject + ", content=" + content + ", regdt=" + regdt
				+ "]";
	}
	
	
}
