package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;

public class MemberDAO {	//Data Access Object DB접근 객체
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
	}//end
	
	public String loginProc(MemberDTO dto) { 
		//System.out.println(dto.toString());
		String mlevel=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel IN ('A1', 'B1', 'C1', 'D1') ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mlevel=rs.getString("mlevel");
			}//if end
		}catch (Exception e) {
			System.out.println("로그인 실패:"+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		return mlevel;
	}//loginProc end
	
	
	public int duplecateID(String id) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}//if end
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패:"+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}//duplecateID end
	
	public int duplecateEmail(String email) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}//if end
			
		} catch (Exception e) {
			System.out.println("이메일 중복 확인 실패:"+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}//duplecateEmail end
	
	public int insert(MemberDTO dto) {
		int cnt=0;
		//dto.toString();
		try {
		con=dbopen.getConnection();
		sql=new StringBuilder();
		sql.append(" INSERT INTO member(id, passwd, mname, email, tel, zipcode, address1, address2, job, mlevel, mdate) ");
		sql.append(" VALUES(?,?,?,?,?,?,?,?,?, 'D1', sysdate) ");
		
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getMname());
		pstmt.setString(4, dto.getEmail());
		pstmt.setString(5, dto.getTel());
		pstmt.setString(6, dto.getZipcode());
		pstmt.setString(7, dto.getAddress1());
		pstmt.setString(8, dto.getAddress2());
		pstmt.setString(9, dto.getJob());
		
		cnt=pstmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("추가 실패: "+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	//===========================================================
	
	public boolean findID(MemberDTO dto) {
		boolean flag=false;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			//이름과 이메일이 일치하는 행 가져오기
			sql.append(" SELECT id ");
			sql.append(" FROM member ");
			sql.append(" WHERE mname=? AND email=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());
			rs=pstmt.executeQuery();
			System.out.println(dto.getMname()+"\n"+dto.getEmail());
		
			if(rs.next()) {//이름과 이메일 일치 되었따면
				String id=rs.getString("id"); //아이디
				
				//임시 비밀번호 발급.
				//대소문자, 숫자 이용하여 랜덤하게 10글자 만들고 테이블에서 임시 비밀번호를 수정.
				
				String[] ch= {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
							"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
							"0","1","2","3","4","5","6","7","8","9"	};
				//임시 비밀번호 랜덤하게 10글자 발생
				StringBuffer imsiPW=new StringBuffer();
				for(int i=0;i<10;i++) {
					int num=(int)(Math.random()*ch.length); //ch[0]~ch[61]까지 존재
					imsiPW.append(ch[num]);
				}//for end
				
				//임시 비밀번호 업데이트 하기.
				sql=new StringBuilder();
				sql.append(" UPDATE member ");
				sql.append(" SET passwd=? ");
				sql.append(" WHERE mname=? AND email=? ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, imsiPW.toString());
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getEmail());
				
				int cnt=pstmt.executeUpdate();
				if(cnt==1) {//비밀번호가 업데이트 되었다면
					//아이디와 임시 비밀번호를 이메일로 전송하기
					String content="";
					content +="<table border='1'>";
					content +="<tr>";
					content +="<th>아이디</th>";
					content +="<td>" + id + "</td>";
					content +="</tr>";
					content +="<tr>";
					content +="<th>임시 비밀번호</th>";
					content +="<td>" + imsiPW.toString() + "</td>";
					content +="</tr>";
					content +="</table>";
					
					String mailServer="mw-002.cafe24.com";		//카페24 메일서버
					Properties props=new Properties();
					props.put("mail.smtp.host",mailServer);
					props.put("mail.smtp.auth",true);
					Authenticator myAuth=new MyAuthenticator(); //다형성 자식이 부모집으로
					Session sess=Session.getInstance(props, myAuth);
					
					InternetAddress[] address={ new InternetAddress(dto.getEmail()) };
					Message msg=new MimeMessage(sess);
					msg.setRecipients(Message.RecipientType.TO, address);
					msg.setFrom(new InternetAddress("kimyu08@naver.com"));
					msg.setSubject("용페이지 임시비밀번호 발급.");
					msg.setContent(content, "text/html; charset=UTF-8");
					msg.setSentDate(new Date());
					Transport.send(msg);
					
					flag=true; //최종적으로 성공
				}else {
					flag=false;
				}//if end
				
			}//if end
			
			}catch (Exception e) {
				System.out.println("아이디/비번 찾기 실패: "+e);
			}finally {
				DBClose.close(con, pstmt, rs);
			}
		
		
		return flag;
	}
	
	public int modifyMem(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();		
			sql.append(" UPDATE member ");
			sql.append(" SET passwd=?, ");
			sql.append("  	 mname=?, 	");
			sql.append(" 	 tel=?, 	");
			sql.append(" 	 email=?, 	");
			sql.append(" 	 zipcode=?, ");
			sql.append(" 	 address1=?, ");
			sql.append(" 	 address2=?, ");
			sql.append(" 	 job=? ");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getJob());
			pstmt.setString(9, dto.getId());
			
			cnt=pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("회원 정보 수정 실패:"+e);
		}finally {
			DBClose.close(con, pstmt);
		}		
		return cnt;
	}
	
	public MemberDTO read(String s_id) {
		MemberDTO dto=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT mname,tel,email,zipcode,address1,address2,job ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, s_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new MemberDTO();
				dto.setId(s_id);
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
			}
			
		}catch (Exception e) {
			System.out.println("회원 정보 불러오기 실패:"+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}	
		return dto;
	}//read end
	
	public int Delete(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" UPDATE member ");
			sql.append(" SET mlevel='F1' ");
			sql.append(" WHERE id=? ");
			sql.append(" AND passwd=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원 탈퇴 실패:"+e);
		}finally {
			DBClose.close(con,pstmt);
		}//end
		return cnt;
	}//delete end
	
	
	
}//class end
