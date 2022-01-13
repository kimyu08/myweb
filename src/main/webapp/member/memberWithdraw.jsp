<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>

<!-- 본문 시작 memberWithdraw.jsp-->
<%
String root=Utility.getRoot();	// /myweb
String index=root+"/index.jsp"; 
%>
<h3>* 회/원/탈/퇴 *</h3>
<form name="memredrawfrm" id="memredrawfrm" method="post" action="memberWithdrawProc.jsp">																					
<span style="color:red; font-weight: bold">* 회원탈퇴 *</span>
<br>
<table class="table">
<tr>
    <th>*비밀번호</th>
    <td style="text-align: center;"><input type="password" name="passwd" id="passwd" size="15" required></td>
</tr>

<tr>
    <td id="submit" colspan="2">
        <input type="button" value="회원탈퇴"  class="btn btn-primary" onclick="withdraw()"/>
        <input type="reset"  value="취소"      class="btn btn-primary" onclick="location.href='<%=index%>'"/>
    </td>
</tr>
</table> 
</form>
<script>
		function withdraw(){
			if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
			     document.memredrawfrm.submit();
			 }else{   //취소
			     return false;
			 }
		}//withdraw end		
	</script>
<!-- 본문 끝 -->           
<%@ include file="../footer.jsp"%>