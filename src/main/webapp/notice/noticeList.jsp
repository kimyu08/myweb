<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작 noticeList.jsp --%>
	
	<div class="container">
		<h3>* 공지사항 *</h3>
		<p><a href="noticeForm.jsp">[공지쓰기]</a></p>
		
		<table class="table table-hover">
			<thead class="table table-dark">
				<tr>
					<th>공지번호</th>
					<th>제목</th>
					<th>작성일</th>			
				</tr>
			</thead>
			<tbody>     
			
			</tbody>
		</table>
	</div>
	
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>