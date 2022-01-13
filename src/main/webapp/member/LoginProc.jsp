<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작 LoginProc.jsp --%>
	<h3>* 로그인 결과 *</h3>
	<%
	String id		=request.getParameter("id").trim();
	String passwd	=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p>아이디 또는 비밀번호가 일치하지 않습니다.</p>");
		out.println(id);
		out.println(passwd);
		out.println(mlevel);
    	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		//로그인 성공
		//out.println("로그인 성공~");
		//out.println("회원등급: "+mlevel);
		
		//다른 페이지에서 로그인 상태정보를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//쿠키시작-------------------------------------------------------
		//서버가 사용자PC에 저장하는 텍스트 파일로 된 정보
		//>각 브라우저의 쿠키삭제의 영향을 받는다.
		//>보안에 취약하다
		//>예) 아이디저장, 오늘창그만보기, 클릭한 상품목록

		//<input type="checkbox" name="c_id" value="SAVE">값 가져오기
		String c_id=Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie=null;
		if(c_id.equals("SAVE")){
			//아이디 저장체크 시
			//쿠키변수 선언 new Cookie("쿠키변수명",값)
			cookie=new Cookie("c_id",id);
			//쿠키의 생존기간 1개월
			cookie.setMaxAge(60*60*24*30);
		}else{
			//아이디 저장 체크 안했을 시
			cookie=new Cookie("c_id",id);
			cookie.setMaxAge(0);
		}
		//요청한 사용자 PC에 쿠키값을 저장
		response.addCookie(cookie);
		
		//쿠키끝-------------------------------------------------------
		
		//첫페이지로 이동
		String root=Utility.getRoot();	// /myweb
		response.sendRedirect(root+"/index.jsp");
		
	}//if end

	%>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>