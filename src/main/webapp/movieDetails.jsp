<%@page import="com.example.iwtw.domain.Movie" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Edit</title>
</head>

<body>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<% int id = Integer.parseInt(request.getParameter("id"));
    Movie movie = storage.getAllMovies().get(id); %>
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
        <h1 class="movieTitle"><%= movie.getTitle()%>
            <small>
                <% if (movie.getIsFavorite()) { %>
                <a href="toggleFavorite.jsp?id=<%= id%>"><span class="glyphicon glyphicon-star-empty active"
                                                               aria-hidden="true"></span></a>
                <% } else { %>
                <a href="toggleFavorite.jsp?id=<%= id %>"><span class="glyphicon glyphicon-star-empty"
                                                                aria-hidden="true"></span></a>
                <% } %>
            </small>
        </h1>
        <h2><%= movie.getGenre()%>
        </h2>
        <h2><%= movie.getReleaseYear()%>
        </h2>
        <p style="font-size: larger">
            Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets
            from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's
            rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has
            also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered
            a chance at redemption. One last job could give him his life back but only if he can accomplish the
            impossible - inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the
            reverse: their task is not to steal an idea but to plant one. If they succeed, it could be the perfect
            crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that
            seems to predict their every move. An enemy that only Cobb could have seen coming.
        </p>
        <br>
        <a href="editMovie.jsp?id=<%= id %>" class="btn btn-primary btn-lg" role="button">Edit</a>
        <button class="btn btn-danger btn-lg" data-href="delete.jsp?id=<%= id %>" data-toggle="modal"
                data-target="#confirm-delete">Delete
        </button>
    </div>

</div>
<script type="application/javascript">
    $("#confirm-delete").on('show.bs.modal', function (e) {
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    });
</script>
</body>
</html>