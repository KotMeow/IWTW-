<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page import="com.example.iwtw.domain.Actor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<% int idMovie = Integer.parseInt(request.getParameter("idMovie"));
    int idActor = Integer.parseInt(request.getParameter("idActor"));
    Movie movie = storage.getAllMovies().get(idMovie);
    Actor actor = movie.getActors().get(idActor);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Edit <%=movie.getTitle()%>
    </title>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="col-md-8">
        <form class="form-horizontal" method="post" action="editActor">
            <input type="hidden" name="idActor" value="<%=idActor %>"/>
            <input type="hidden" name="idMovie" value="<%=idMovie %>"/>
            <div class="form-group">
                <label class="control-label" for="title">Name</label>
                <input class="form-control" id="title" type="text" name="name" value="<%= actor.getName()%>"
                       maxlength="100" required/>
            </div>
            <div class="form-group">
                <label class="control-label" for="role">Role</label>
                <input class="form-control" type="text" id="role" name="role" value="<%= actor.getRole()%>" required/>
            </div>
            <div class="form-group">
                <a class="btn btn-default" href="movieDetails.jsp?id=<%=idMovie%>">Back</a>
                <input class="btn btn-primary" type="submit" value="Save!">
            </div>
        </form>
    </div>
</div>
</body>