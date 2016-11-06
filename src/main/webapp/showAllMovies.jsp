<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Library</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container-fluid">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li><input id="search" name="search" type="text" class="form-control" placeholder="Search for..."></li>
            <li role="presentation" class="showAll active"><a>Show all movies!</a></li>
            <li class="showFavorite"><a>Show only favorite!</a></li>
            <li class="showWatched"><a>Show movies you watched!</a></li>
        </ul>

    </div>
    <div class="col-md-10">
        <c:if test="${storage.getAllMovies().size() == 0}">
            <div class="container-fluid">
                <h1>Library seems to be empty</h1>
                <p><a class="btn btn-default btn-lg" href="populate.jsp">Change This!</a></p>
            </div>
        </c:if>
        <c:forEach items="${storage.getAllMovies()}" var="movie">
                <c:if test="${!movie.getIsFavorite()}">
                <span class="isFavorite">
            </c:if>
            <c:if test="${!movie.getIsWatched()}">
                <span class="isWatched">
            </c:if>
            <a href="movieDetails.jsp?id=${storage.getAllMovies().indexOf(movie)}">
                <span class="item" style="background-image: url('${movie.getCoverUrl()}')">
                    <span class="overlay">
                        <span class="item-header">${movie.getTitle()}</span>
                        <c:choose>
                            <c:when test="${movie.getIsFavorite()}">
                                <span class="showallstar glyphicon glyphicon-star-empty active"></span>
                            </c:when>
                            <c:when test="${movie.getIsWatched()}">
                                <span class="showallstar glyphicon glyphicon-ok active"></span>
                            </c:when>
                        </c:choose>

                    </span>
                </span>
            </a>
            <c:if test="${!movie.getIsFavorite()}">
                </span>
            </c:if>
            <c:if test="${!movie.getIsWatched()}">
                </span>
            </c:if>
        </c:forEach>
    </div>
</div>
<script src="static/showMoviesScript.js"></script>
<script src="static/searchMoviesScript.js"></script>
</body>
</html>
