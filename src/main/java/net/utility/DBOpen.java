package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	//오라클 DB연결 메소드
		public Connection getConnection() {
			
			Connection con=null;
			try {            
	            //1)오라클 DB 서버 연결 관련 정보
				String url="jdbc:oracle:thin:@localhost:1521:xe";
		        String user="system";
		        String password="1234";
		        String driver="oracle.jdbc.driver.OracleDriver";  //ojdbc8.jar           
	            //2)드라이버 로딩
	            Class.forName(driver);
	            //3)오라클DB 서버 연결
	            con=DriverManager.getConnection(url, user, password);
			}catch (Exception e) {
	            	System.out.println("오라클DB연결실패:" + e);
	         }//end 
			  return con;
		}
}
