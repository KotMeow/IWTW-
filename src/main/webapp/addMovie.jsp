<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session" />
<jsp:setProperty name="movie" property="*" /> 
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application" />

<%
  storage.add(movie);
  response.sendRedirect("showAllMovies.jsp");
%>