<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>

<%
    storage.populateList();
    response.sendRedirect("showAllMovies.jsp");
%>

