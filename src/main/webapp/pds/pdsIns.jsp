<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>
<%-- 본문시작 pdsIns.jsp --%>
<h3>* 사진 올리기 결과 *</h3>
<%
	try{
		//1)첨부된 파일 저장하기
		String saveDirectory=application.getRealPath("/storage");
		int maxPostSize=1024*1024*10;
		String encoding="UTF-8";		
		MultipartRequest mr=new MultipartRequest(request, saveDirectory
							, maxPostSize, encoding
							, new DefaultFileRenamePolicy());
		
		//2) 1)단계에서 저장한 파일의 파일명, 파일크기 가져오기
		String item="";		//<input type="file" name="filenm">
		String fileName="";	//파일명
		long fileSize=0;	//파일 크기
		File file=null;		//셀제 파일 담기
		
		//열거형 Enumeration enum={"ONE", "TWO", "THREE"}
		//만일 첨부된 파일이 3개였다면
		//files={<input type="file">, <input type="file">, <input type="file">}
		Enumeration files=mr.getFileNames();	//mr 에서 <input type="file">을 전부 수거하기
		while(files.hasMoreElements()){
			item=(String)files.nextElement(); //"filename" > <input type="file" name="filename">
			fileName=mr.getFilesystemName(item); //mr객체에서 item이 가지고 있는 리네임된 파일명
			if(fileName!=null){//실제 파일명을 가져왔다면
				file=mr.getFile(item); //mr에서 실제 파일 가져오기
				if(file.exists()){//실제 파일이 존재한다면
					fileSize=file.length(); //파일 크기 가져오기				
				}//if end
			}//if end
		}//while end
		
		//3)tb_pds테이블에 저장하기
		String wname=mr.getParameter("wname").trim();
		String subject=mr.getParameter("subject").trim();
		String passwd=mr.getParameter("passwd").trim();
		
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(fileSize);
		
		int cnt=dao.insert(dto);
		if(cnt==0){
	    	out.println("<p>사진 추가 실패되었습니다.<p>");
	    	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	    }else{
	    	out.println("<script>");
	    	out.println("		alert('사진을 추가했습니다.');");
	    	out.println("		location.href='pdsList.jsp'");//목록페이지로 이동
	    	out.println("</script>");
	    }//if end
		
	}catch(Exception e){
		out.print(e);
		out.print("<p>사진 올리기 실패!!</p>");
		out.print("<p>사진 올리기 실패!!</p>");
	}
%>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>