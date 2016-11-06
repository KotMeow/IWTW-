<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int id = Integer.parseInt(request.getParameter("id"));
    Movie movie = storage.getAllMovies().get(id);
    pageContext.setAttribute("movie", movie);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <link rel="stylesheet" href="static/loadingCircle.css">
    <title>IWTW | <%=movie.getTitle()%>
    </title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<jsp:include page="deleteConfirmationModal.html"/>

<div class="container-fluid">
    <div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3">
                <img class="img-responsive poster" alt="poster" src="<%= movie.getCoverUrl() %>" onerror="this.src= 'http://25.media.tumblr.com/tumblr_mdra2njUdA1r6szvzo1_1280.jpg'">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-8">
                <h1 class="movieTitle"><%= movie.getTitle() %>
                    <span class="rating" style="float: right"></span>
                    <small>
                        ${movie.getReleaseYear()}
                        <a title="Add to favorite" id="isFavorite"><span class="glyphicon glyphicon-star-empty"></span></a>
                        <a title="Mark as watched" id="isWatched"> <span class="glyphicon glyphicon-ok"></span></a>
                    </small>
                </h1>
                <h3 class="movieDetails border"><%= movie.getGenre()%>
                </h3>
                <%--<h2 style="margin-top: 20px;">Plot:</h2>--%>
                <div class="spinningCircle"></div>
                <p class="plot hidden" style="font-size: large"></p>
                <h4 class="awards"></h4>
                <h2 style="margin-top: 50px;">Cast:</h2>
                <table style="margin-top: 30px;" class="table table-hover">
                    <tr>
                        <th style="font-size: larger"><strong>Name</strong></th>
                        <th style="font-size: larger"><strong>Role</strong></th>
                        <th></th>
                    </tr>
                    <c:forEach items="${ movie.getActors()}" var="actor" varStatus="loop">
                        <tr>

                            <td><h5 style="font-size: larger">${actor.getName()} </h5></td>
                            <td><h5 style="font-size: larger">${actor.getRole()}</h5></td>
                            <td>
                                <a title="Edit user"
                                   href="editActor.jsp?idActor=<%=movie.getActors().indexOf(pageContext.getAttribute("actor"))%>&idMovie=<%=id%>"
                                   class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                </a>
                                <button class="btn btn-default btn-sm"
                                        data-href="deleteActor.jsp?idActor=<%=movie.getActors().indexOf(pageContext.getAttribute("actor"))%>&idMovie=<%=id%>"
                                        data-toggle="modal"
                                        data-target="#confirm-delete"
                                        title="Delete user">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                </button>
                            </td>
                        </tr>

                    </c:forEach>
                    <tr>
                        <td><a href="addActor.jsp?id=<%=id%>" title="Add new actor"
                               class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <br>
                <a href="showAllMovies.jsp" class="btn btn-default" role="button">Back</a>
                <a href="editMovie.jsp?id=<%= id %>" class="btn btn-primary" role="button">Edit</a>
                <button class="btn btn-danger " data-href="deleteMovie.jsp?id=<%= id %>" data-toggle="modal"
                        data-target="#confirm-delete">Delete
                </button>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    $(function () {

        if (${movie.getIsWatched()}) $(".glyphicon-ok").addClass("active");
        if (${movie.getIsFavorite()}) $(".glyphicon-star-empty").addClass("active");

//        Delete confirmation
        $("#confirm-delete").on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
        });

//          Fetch movie details from 'omdbapi' api
        fetch('http://www.omdbapi.com/?t=<%= movie.getTitle()%>&y=&plot=full&r=json', {mode: 'cors'})
                .then(function (response) {
                    return response.json();
                })
                .then(function (text) {
                    if (text.Error) {
                        $('.spinningCircle').addClass('hidden');
                        $('.plot').removeClass('hidden').append(text.Error);
                        $('.rating').append('?/10');
                    }
                    else {
                        $('.spinningCircle').addClass('hidden');
                        $('.plot').removeClass('hidden').append(text.Plot);
                        $('.awards').append("Awards: " + text.Awards + '  ');
                        $('.rating').append(text.imdbRating + '/10');
                        $('.border').prepend(text.Runtime + ", ");
                    }
                    console.log('Request successful');
                })
                .catch(function (error) {
                    log('Request failed', error)
                });

//      toggle IsWatched and isFavorite using ajax request
        $("#isWatched").on('click', function () {
            $.get("toggleIsWatched", {
                idMovie: <%=id%>
            }, function (text) {
                if (text == "true")  $(".glyphicon-ok").addClass("active");
                else {
                    $(".glyphicon-star-empty").removeClass("active");
                    $(".glyphicon-ok").removeClass("active");
                }
            });
        });

        $("#isFavorite").on('click', function () {
            $.get("toggleIsFavorite", {
                idMovie: <%=id%>
            }, function (text) {
                if (text == "true") {
                    $(".glyphicon-star-empty").addClass("active");
                    $(".glyphicon-ok").addClass("active");
                }
                else {
                    $(".glyphicon-star-empty").removeClass("active");
                }
            });
        });
    });
</script>
</body>
</html>