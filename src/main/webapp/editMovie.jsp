<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<% int id = Integer.parseInt(request.getParameter("id"));
    Movie movie = storage.getAllMovies().get(id); %>
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
    <h1>Edit information about "<strong><%= movie.getTitle() %></strong>"</h1>
    <div class="col-md-8 formwrap">
        <form class="form-horizontal" id="movieForm" action="edit.jsp">
            <input type="hidden" name="id" value="<%=id %>">
            <input type="hidden" name="isFavorite" value="<%=movie.getIsFavorite()%>">
            <input type="hidden" name="isWatched" value="<%=movie.getIsWatched()%>">
            <div class="form-group">
                <label class="control-label" for="title">Title</label>
                <input class="form-control" id="title" type="text" name="title" value="<%= movie.getTitle()%>"
                       maxlength="100" required>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="releaseYear">Release Year</label>
                <input class="form-control" id="releaseYear" type="number" name="releaseYear" value="<%= movie.getReleaseYear()%>"
                       min="1920" max="3000" required>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="genre">Genre</label>
                <input class="form-control" id="genre" type="text" name="genre" value="<%= movie.getGenre()%>" maxlength="50"
                       required>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="coverUrl">Picture url</label>
                <input class="form-control" id="coverUrl" type="url" name="coverUrl" value="<%= movie.getCoverUrl()%>" required>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <a class="btn btn-default" href="movieDetails.jsp?id=<%=id%>">Back</a>
                <input class="btn btn-primary" type="submit" value="Save!">
            </div>
        </form>
    </div>
</div>
<script>
    $('#movieForm').validator();
</script>
</body>
</html>