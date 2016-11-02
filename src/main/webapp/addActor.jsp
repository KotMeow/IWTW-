<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page import="com.example.iwtw.domain.Actor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<% int id = Integer.parseInt(request.getParameter("id")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Edit
    </title>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<div class="container">
    <h1>Add new actor of "<strong><%= storage.getAllMovies().get(id).getTitle()%></strong>":</h1>
    <div class="col-md-8">
        <form class="form-horizontal" id="actorForm" method="post" action="addActor">
            <input type="hidden" name="id" value="<%=id%>"/>
            <div class="form-group">
                <label class="control-label" for="name">Name</label>
                <input class="form-control" id="name" type="text" name="name" value=""
                       maxlength="100" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="role">Role</label>
                <input class="form-control" type="text" id="role" name="role" value="" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <a class="btn btn-default" href="movieDetails.jsp?id=<%=id%>">Back</a>
                <input class="btn btn-primary" type="submit" value="Add!">
            </div>
        </form>
    </div>
</div>
<script>
    $('#actorForm').validator();
</script>
</body>
</html>