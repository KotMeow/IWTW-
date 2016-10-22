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
    <title>IWTW | <%=movie.getTitle()%>
    </title>
</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="modal fade" id="confirm-delete" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
            </div>

            <div class="modal-body">
                <p>You are about to delete <strong><%= movie.getTitle()%>
                </strong></p>
                <p>Do you want to proceed?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="col-md-3">
        <img class="img-responsive" src="<%= movie.getCoverUrl()%>"/>
    </div>
    <div class="col-md-6">
        <h1 class="movieTitle"><%= movie.getTitle() %>
             <div class="rating" style="float: right"></div>
            <small>
                <%= movie.getReleaseYear()%>
                <% if (movie.getIsFavorite()) { %>
                <a href="toggleFavorite.jsp?id=<%= id%>"><span class="glyphicon glyphicon-star-empty active"
                                                               aria-hidden="true"></span></a>
                <% } else { %>
                <a href="toggleFavorite.jsp?id=<%= id %>"><span class="glyphicon glyphicon-star-empty"
                                                                aria-hidden="true"></span></a>
                <% } %>
            </small>
        </h1>

        <h3 class="border">,<%= movie.getGenre()%></h3>
        <p class="plot" style="font-size: larger"></p>
        <h4 class="awards"> </h4>

        <br>
        <a href="showAllMovies.jsp" class="btn btn-default" role="button">Back</a>
        <a href="editMovie.jsp?id=<%= id %>" class="btn btn-primary" role="button">Edit</a>
        <button class="btn btn-danger " data-href="delete.jsp?id=<%= id %>" data-toggle="modal"
                data-target="#confirm-delete">Delete
        </button>

    </div>

</div>
<script type="application/javascript">
    $(function() {
        $("#confirm-delete").on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
        });

        fetch('http://www.omdbapi.com/?t=<%= movie.getTitle()%>&y=<%= movie.getReleaseYear()%>&plot=full&r=json', {mode: 'cors'})
                .then(function (response) {
                    return response.json();
                })
                .then(function (text) {
                    $('.plot').append(text.Plot);
                    $('.awards').append(text.Awards + '  ');
                    $('.rating').append(text.imdbRating + '/10');
                    $('.border').prepend(text.Runtime);
                    console.log('Request successful');
                })
                .catch(function (error) {
                    log('Request failed', error)
                });
    });

</script>
</body>
</html>