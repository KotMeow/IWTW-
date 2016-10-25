<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session"/>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<jsp:setProperty property="*" name="movie"/>

<%
    int idMovie = Integer.parseInt(request.getParameter("idMovie"));
    int idActor = Integer.parseInt(request.getParameter("idActor"));

    storage.deleteActor(idMovie, idActor);
    response.sendRedirect("movieDetails.jsp?id=" + idMovie);
%>

