package net.bbs;

public class BbsDTO {
	//데이터를 한꺼번에 객체화해서 사용할 수 있다.
	//멤버변수 field
	private int bbsno;   		//일련번호 -99999~99999
	private String wname;  	//작성자
	private String subject;	//글제목
	private String content;	//글내용
	private String passwd;	//글비밀번호
	private int readcnt;		//글조회수
	private String regdt;		//글작성일
	private int grpno;  		//글 그룹번호
	private int indent; 		//들여쓰기
	private int ansnum;		//글순서
	private String ip;			//글IP
	  
	//생성자 함수 default constructor
	public BbsDTO() {}

	//getter와 setter함수
	public int getBbsno() {
		return bbsno;
	}

	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
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

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getAnsnum() {
		return ansnum;
	}

	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	//메뉴 source-tostring있음
	@Override
	public String toString() {
		return "BbsDTO [bbsno=" + bbsno + ", wname=" + wname + ", subject=" + subject + ", content=" + content
				+ ", passwd=" + passwd + ", readcnt=" + readcnt + ", regdt=" + regdt + ", grpno=" + grpno + ", indent="
				+ indent + ", ansnum=" + ansnum + ", ip=" + ip + "]";
	}
	  
	
}//class end
