<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작bbsRead.jsp --%>

<div class="container">
	<h3>* 게시판 상세보기 *</h3>
	<p>
		<a href="bbsForm.jsp">[글쓰기]</a>
		&nbsp;&nbsp;
		<a href="bbsList.jsp">[글목록]</a>
	</p>
	<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno"));
		dto=dao.read(bbsno); 
		if(dto==null){
			out.print("해당 글 없음!!");
		}else{
			//조회수 증가
			dao.incrementCnt(bbsno); 
			%>
			<table class="table table-hover">
				<tr>
		    			<th class="table-success">제목</th>
		    			<td><%=dto.getSubject() %></td>
		    			<tr>
		    			<th class="table-success">내용</th>
		    			<td style="text-align: left">
		    			<%
		    			//사용자가 입력한 문자 그대로 출력하기 위해
		    			//엔터(\n)를 <br>로 변환.
		    			//String content=dto.getContent().replace("\n","<br>");
		    			String content=Utility.convertChar(dto.getContent());
		    			out.print(content);
						%>
		    			</td>
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
		    			<td><%=dto.getRegdt() %></td>
		    		</tr>
		    		<tr>
		    			<th class="table-success">IP</th>
		    			<td><%=dto.getIp() %></td>
		    		</tr>
		    		</table>
		    		<br>
		    		<input type="button" value="답변쓰기"  class="btn btn-info" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
		    		<input type="button" value="수정" 	class="btn btn-warning" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>'">
		    		<input type="button" value="삭제" 	class="btn btn-danger" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
			<%
		}//if end
	%>
	
</div>
	
	
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>