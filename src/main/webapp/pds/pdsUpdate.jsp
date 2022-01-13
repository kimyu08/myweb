<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>        
<%@ include file="../header.jsp" %>
<%-- 본문시작 pdsUpdate.jsp --%>
<h3>* 사진 수정하기 *</h3>
<%
int pdsno=Integer.parseInt(request.getParameter("pdsno"));
dto=dao.read(pdsno); 
if(dto==null){
	out.println("해당 글 없음!");
}else{
%>
	<form name="photofrm" method="post" action="pdsUpdateProc.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()"> 
	<table class="table">
	<tr>
	    <th>이름</th>
	    <td style="text-align: left"><input type="text" name="wname" id="wname" size="20" maxlength="100" value="<%=dto.getWname()%>" required autofocus></td>
	</tr>
	<tr>
	    <th>제목</th>
	    <td style="text-align: left">
	    	<input type="text" name="wname" id="wname" size="20" maxlength="100" value="<%=dto.getSubject()%>">
	    </td>
	</tr>
	<tr>
	    <th>비밀번호</th>
	    <td style="text-align: left"><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
	    <th>첨부파일</th>
	    <td style="text-align: left"><input type="file" name="filename" id="filename" value="<%=dto.getFilename()%>"></td>
	</tr>
	<tr>
	    <td colspan="2">
	    	  <input type="submit" value="수정하기" class="btn btn-success">
	    	  <input type="reset"  value="취소"      class="btn btn-danger">
	    </td>
	</tr>
	</table>
	</form>
<%
}//if end
%>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>