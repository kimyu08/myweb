package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.notice.NoticeDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public NoticeDAO() {
		dbopen.getConnection();
	}
	
	public int insert(NoticeDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" insert into tb_notice(noticeno, subject, content) ");
			sql.append(" values(notice_seq.nextval,?,? ) ");
			
			pstmt=con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getSubject());  
			pstmt.setString(2, dto.getContent());

			cnt=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("추가실패:"+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}//insert() end	
}
