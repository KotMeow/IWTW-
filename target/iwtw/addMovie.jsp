<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Add</title>
</head>

<body>
<jsp:include page="navbar.jsp"/>

<div class="container">
    <h1>Add new movie:</h1>
    <div class="col-md-8 formwrap">
        <form class="form-horizontal" id="movieForm" action="add.jsp">
            <div class="form-group">
                <label class="control-label" for="title">Title</label>
                <input class="form-control" id="title" type="text" name="title" value="" maxlength="100" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="releaseYear">Release Year</label>
                <input class="form-control" id="releaseYear" type="number" name="releaseYear" value="" min="1920" max="3000" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="genre">Genre</label>
                <input class="form-control" id="genre" type="text" name="genre" value="" maxlength="50" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <label class="control-label" for="coverUrl">Picture url</label>
                <input class="form-control" id="coverUrl" type="url" name="coverUrl" value="" required/>
                <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
                <a class="btn btn-default" href="showAllMovies.jsp">Back</a>
                <input class="btn btn-primary" type="submit" value="Add">
            </div>
        </form>
    </div>
</div>
<script>
    $('#movieForm').validator();
</script>
</body>
</html>