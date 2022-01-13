<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%-- ssi.jsp 공통 코드 --%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="net.bbs.*"%>
<%@page import="net.utility.*"%>

<jsp:useBean id="dao" class="net.bbs.BbsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.bbs.BbsDTO" scope="page"></jsp:useBean>

<% request.setCharacterEncoding("UTF-8"); %>

<%
//검색
	String word=request.getParameter("word"); //검색어 key field
	String col=request.getParameter("col");//검색 칼럼
	
	word=Utility.checkNull(word); //문자열 값이 null이면 빈문자열 치환(Utility.java에 있음)
	col=Utility.checkNull(col);
%>