<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문 시작 memberWithdrawProc.jsp-->
<h3>* 회/원/탈/퇴/결/과 *</h3>
<%
	//1)사용자가 입력 요청한 값 가져오기
	String passwd	=request.getParameter("passwd").trim();

	//2)dto객체 담기
	dto.setId(s_id);
	dto.setPasswd(passwd);
	
	//3 member 테이블에 추가
	
	int cnt=dao.Delete(dto); 
	if(cnt==0){
		out.println("<p>회원 탈퇴가 실패했습니다.</p>");
		out.println(dto.toString());
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		//첫페이지로 이동
		String root=Utility.getRoot();	// /myweb
		out.println("<script>");
		out.println(" alert('회원 탈퇴 되셨습니다~');");
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");	//세션 삭제
		session.removeAttribute("s_mlevel");
		out.println(" location.href='" + root + "/index.jsp';");
		out.println("</script>");
	}
%>
<!-- 본문 끝 -->           
<%@ include file="../footer.jsp"%>