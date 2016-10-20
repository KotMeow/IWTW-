<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/style.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>IWTW | Edit</title>
</head>

<body>
    <jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application" />
    <% int id= Integer.parseInt(request.getParameter("id")); Movie movie=storage.getAllMovies().get(id); %>
    <nav class="navbar navbar-primary">
        <div class="container-fluid" id="line">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">IWTW</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a>WHO</a></li>
                    <li><a href="showAllMovies.jsp">Library</a></li>
                    <li><a href="getMovieData.jsp">Add movie</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="col-md-3">
        <img class="img-responsive" src="<%= movie.getCoverUrl()%>"/>
        </div>
        <div class="col-md-4">
        <h1 class="movieTitle"><%= movie.getTitle()%>
        <small>
        <% if (movie.getIsFavorite() == true) { %>
            <a href="toggleFavorite.jsp?id=<%= id%>"><span class="glyphicon glyphicon-star-empty active" aria-hidden="true"></span></a>    
        <% } else { %>
            <a href="toggleFavorite.jsp?id=<%= id %>"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span></a>      
        <% } %>
        </small>
        </h1>  
        <h2><%= movie.getGenre()%></h2>
        <h2><%= movie.getReleaseYear()%></h2>
        <br>
        <a href="editMovie.jsp?id=<%= id %>" class="btn btn-primary btn-lg" role="button">Edit</a>       
        <button class="btn btn-danger btn-lg" data-href="delete.jsp?id=<%= id %>" data-toggle="modal" data-target="#confirm-delete">Delete       
        </button>
        </div>
      
    </div>

</body>
</html>