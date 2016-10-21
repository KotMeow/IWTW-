<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session"/>
<jsp:setProperty property="*" name="movie"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    storage.update(id, movie);
    response.sendRedirect("movieDetails.jsp?id=" + id);

%>

