<%@page import="com.example.iwtw.domain.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<title>IWTW | Library</title>
</head>
<body>
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
            <ul  class="nav navbar-nav">
                <li><a href="/iwtw/showFavorite">Watched</a></li>
                <li><a href="showAllMovies.jsp">Library</a></li>
                <li><a href="getMovieData.jsp">Add movie</a></li>

            </ul>
            </div>
        </div>
    </nav>

<c:if test="${storage.getAllMovies().size() == 0}">
<div class="container-fluid">
         <h1>Library seems to be empty</h1>
         <p><a class="btn btn-default btn-lg" href="populate.jsp" role="button">Change This!</a></p>
           </div>
</c:if>

<div class="container">
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application" />
<c:forEach items="${storage.getAllMovies()}" var="movie">
  <a href="movieDetails.jsp?id=${storage.getAllMovies().indexOf(movie)}">
  <div class="item" style="background-image: url('${movie.getCoverUrl()}')">
  <div class="overlay">
  <span class="item-header">${movie.getTitle()}</span>
  </div>
  </div>
  </a>
</c:forEach>
</div>
</div>


</div>
</body>
</html>
