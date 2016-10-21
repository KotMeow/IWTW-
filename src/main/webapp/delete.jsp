<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session"/>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<jsp:setProperty property="*" name="movie"/>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    storage.delete(id);
    response.sendRedirect("showAllMovies.jsp");
%>

