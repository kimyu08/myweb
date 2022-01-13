<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsTestProc.jsp</title>
</head>
<body>
	<h3>* 파일 첨부 테스트 결과 *</h3>
		<%
		/* request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("uname"));
		out.print("<hr>");
		out.print(request.getParameter("subject"));
		out.print("<hr>");
		out.print(request.getParameter("content"));
		out.print("<hr>");
		out.print(request.getParameter("filenm")); 
		out.print("<hr>");
		
		<form>에 enctype="multipart/form-data"> 속성이 추가되면
		request객체가 가지고 있는 값을 제대로 가져올 수 없다.
		request.getParameter("")는 null이 반환된다.
		*/
		
		try{
			//첨부된 파일을 저장하는 폴더 생성: storage
			String saveDirectory=application.getRealPath("/storage");
			//저장 최대 용량(10M)
			int maxPostSize=1024*1024*10;
			//한글 인코딩
			String encoding="UTF-8";
			
			MultipartRequest mr=new MultipartRequest(request, saveDirectory
								, maxPostSize, encoding
								, new DefaultFileRenamePolicy());
			
			out.print("<p>첨부 파일 저장 성공!!</p>");
			
			/* 저장경로
			D:\java202108\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myweb\storage
			
			*/
			//1)mr참조 변수가 가리키고 있는 텍스트 가져오기
			out.print(mr.getParameter("uname"));
			out.print("<hr>");
			out.print(mr.getParameter("subject"));
			out.print("<hr>");
			out.print(mr.getParameter("content"));
			out.print("<hr>");
			
			//2) /storage폴더에 저장된 파일 정보 확인하기
			//열거형 Enumeration enum={"ONE", "TWO", "THREE"}
			//만일 첨부된 파일이 3개였다면
			//files={<input type="file">, <input type="file">, <input type="file">}
			Enumeration files=mr.getFileNames(); //mr 에서 <input type="file">을 전부 수거하기

			//3) 2)에서 작업한 files를 가지고 있는 값에서 개별적 접근.
			String item=(String)files.nextElement();
			//out.print(item);	//"filenm" > <input type="file" name="filenm">
			
			
			//4) 3)의 실제 파일 이름.
			String ofilename=mr.getOriginalFileName(item);
			out.print("원본 파일명 : "+ofilename);
			out.print("<hr>");
			String fileName=mr.getFilesystemName(item);
			out.print("리네임 파일명 : "+fileName);
			out.print("<hr>");
			
			//5) /storage폴더에 저장된 파일의 기타 정보 확인하기
			File file=mr.getFile(item); //파일 가져오기
			if(file.exists()){//파일이 존재하는지?
				out.print("파일명: "+file.getName());
				out.print("<hr>");
				out.print("파일크기: "+file.length());
				out.print("<hr>");
					
			}else{
				out.print("해당 파일이 존재하지 않음!!");
			}//if end
			
		}catch(Exception e){
			out.print(e);
			out.print("<p>파일업로드 실패</p>");
			out.print("<a href='javascript:history.back();'>[다시시도]</a>");
		}//endsjeh 
		
		
		
		%>
	
</body>
</html>