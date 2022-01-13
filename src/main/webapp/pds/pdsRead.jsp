<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>    
<%@ include file="../header.jsp" %>
<%-- 본문시작 pdsRead.jsp --%>
<h3>* 포토갤러리 상세보기 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>
<div class="container">
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	dto=dao.read(pdsno); 
	if(dto==null){
		out.println("해당 글 없음!");
	}else{
		dao.incrementCnt(pdsno); //조회수 증가
		%>
		<table class="table table-hover">
				<tr>
		    			<th class="table-success">제목</th>
		    			<td><%=dto.getSubject() %></td>
		    			<tr>
		    			<th class="table-success">사진</th>
		    			<td><img src="../storage/<%=dto.getFilename()%>"></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">조회수</th>
		    			<td><%=dto.getReadcnt() %></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">작성자</th>
		    			<td><%=dto.getWname() %></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">작성일</th>
		    			<td><%=dto.getRegdate() %></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">파일이름</th>
		    			<td><%=dto.getFilename() %></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">파일크기</th>
		    			<td><%=Utility.toUnitStr(dto.getFilesize()) %></td>
		    		</tr>
		    		</table>
		    		<br>
		    		<input type="button" value="수정" 	class="btn btn-warning" onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>'">
		    		<input type="button" value="삭제" 	class="btn btn-danger" onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">
			<%
		}//if end
	%>
</div>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>