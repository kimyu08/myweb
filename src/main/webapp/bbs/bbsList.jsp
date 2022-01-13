<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%-- 본문시작 bbList.jsp --%>
	
	<div class="container">
		<h3>* 글목록 *</h3>
		<p><a href="bbsForm.jsp">[글쓰기]</a></p>
		
		<table class="table table-hover">
			<thead class="table table-dark">
				<tr>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일</th>			
				</tr>
			</thead>
			<tbody>     
				<%
				//한페이지당 출력할 행의 갯수
				int recordPerPage=5; 
							
				ArrayList<BbsDTO> list=dao.list3(col,word,nowPage,recordPerPage); 
				if(list==null){
					out.println("<tr>");
					out.println(" <td colspan='4'><strong>관련자료없음!!</strong></td>");
					out.println("<tr>");
				}else{
					//오늘 날짜를 문자열 만들기
					String today=Utility.getDate();
					
					for(int i=0;i<list.size();i++){
						dto=list.get(i);
						%>
						<tr>
							<td style="text-align: left">
							<%
								//답변이미지 출력
								for(int n=1;n<=dto.getIndent();n++){
									out.println("<img src='../images/reply.gif'>");
								}//for end
							%>
								<a href="./bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>"><%=dto.getSubject() %></a>
							<%
								//조회수가 10 이상이면 hot이미지 출력
								if(dto.getReadcnt()>=10){
									out.println("<img src='../images/hot.gif'>");
								}//if end
								
								//오늘 작성한 글제목 뒤에 new이미지 출력
								//작성일(regdt)에서 "년월일"만 자르기
								 String regdt=dto.getRegdt().substring(0,10);	//"2021-10-28"
								 if(regdt.equals(today)){//작성일과 오늘 날짜가 같다면
									 out.print("<img src='../images/new.gif'>");
								 }
								
							%>							
							</td>
							<td style="text-align: left"><%=dto.getReadcnt() %></td>
							<td style="text-align: left"><%=dto.getWname() %></td>
							<td style="text-align: left"><%=dto.getRegdt().substring(0,10) %></td>
						</tr>						
						<%
					}//for end
					//글갯수
					int totalRecord=dao.count2(col,word); 
					out.println("<tr>");
					out.println("<td colspan='4' style='text-align: center;'>");
					out.println("글갯수: <strong>");
					out.println(totalRecord);
					out.println("</strong>");
					out.println("</td>");
					out.println("</tr>");
				%>
				<!-- 페이지 리스트 -->
				<tr>
					<td colspan="4" style="text-align: center; height: 50px">
						<%
							String paging=new Paging().paging3(totalRecord, nowPage, recordPerPage,col, word, "bbsList.jsp");
							out.println(paging);
						%>
					</td>
				</tr>
				
				
				<!--  검색시작 -->
				<tr>
					<td colspan="4" style="text-align: center; height: 50px">
						<form name="bbsList.jsp" id="bbsSearch" action="bbsList.jsp" onsubmit="return searchCheck();">
							<select name="col">
								<option value="subject">제목
								<option value="content">내용
								<option value="subject_content">제목+내용
								<option value="wname">작성자
							</select>
							<input type="text" name="word" id="word">
							<input type="submit" value="검색" class="btn btn-primary">
						</form>
					</td>
				</tr>
<%				
				}//if end
%>		

			</tbody>
		</table>
	</div>
	
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>