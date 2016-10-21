<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session"/>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<jsp:setProperty property="*" name="movie"/>
<%
    int intid = Integer.parseInt(request.getParameter("id"));
    out.println(intid);
    Movie film = storage.getAllMovies().get(intid);
    out.println(film.getTitle());
%>
<p>First name: </p>
<p>
    <a href="showAllMovies.jsp">Show all movies</a>
</p>
</body>
</html>
