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
                <p>You are about to delete something. <strong>
                    This process is irreversible.
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
    <div>
        <div class="row">
            <div class="col-md-3">
                <img class="img-responsive poster" src="<%= movie.getCoverUrl() %>" cross-origin="anonymous"/>
            </div>
            <div class="col-md-8">
                <h1 class="movieTitle"><%= movie.getTitle() %>
                    <div class="rating" style="float: right"></div>
                    <small>
                        ${movie.getReleaseYear()}
                        <c:choose>
                            <c:when test="${movie.getIsFavorite() == true}">
                                <a href="toggleFavorite.jsp?id=<%= id%>"><span
                                        class="glyphicon glyphicon-star-empty active"
                                        aria-hidden="true"
                                        title="Remove from favorite"></span></a>
                            </c:when>
                            <c:when test="${movie.getIsFavorite() == false}">
                                <a title="Add to favorite" href="toggleFavorite.jsp?id=<%= id %>"><span
                                        class="glyphicon glyphicon-star-empty"
                                        aria-hidden="true"></span></a>
                            </c:when>
                            <c:otherwise>
                                <a title="Add to favorite" href="toggleFavorite.jsp?id=<%= id %>"><span
                                        class="glyphicon glyphicon-star-empty"
                                        aria-hidden="true"></span></a>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${movie.getIsWatched() == true}">
                                <a href="toggleIsWatched?idMovie=<%=id%>"><span class="glyphicon glyphicon-ok active"
                                      aria-hidden="true"></span></a>
                            </c:when>
                            <c:when test="${movie.getIsWatched() == false}">
                               <a href="toggleIsWatched?idMovie=<%=id%>"> <span class="glyphicon glyphicon-ok"
                                      aria-hidden="true"></span></a>
                            </c:when>
                            <c:otherwise>
                                <a> <span class="glyphicon glyphicon-ok"
                                       aria-hidden="true"></span></a>
                            </c:otherwise>
                        </c:choose>
                    </small>
                </h1>
                <h3 class="border"><%= movie.getGenre()%>
                </h3>
                <%--<h2 style="margin-top: 20px;">Plot:</h2>--%>
                <p class="plot" style="font-size: large"></p>
                <h4 class="awards"></h4>
                <table style="margin-top: 30px;" class="table table-hover">
                    <tr>
                        <th><h5 style="font-size: larger"><strong>Name</strong></h5></th>
                        <th><h5 style="font-size: larger"><strong>Role</strong></h5></th>
                        <th></th>
                    </tr>
                    <h2 style="margin-top: 50px;">Cast:</h2>
                    <c:forEach items="${ movie.getActors()}" var="actor" varStatus="loop">
                        <tr>

                            <td><h5 style="font-size: larger">${actor.getName()} </h5></td>
                            <td><h5 style="font-size: larger">${actor.getRole()}</h5></td>
                            <td>
                                <a title="Edit user"
                                   href="editActor.jsp?idActor=<%=movie.getActors().indexOf(pageContext.getAttribute("actor"))%>&idMovie=<%=id%>"
                                   type="button" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                </a>
                                <button type="button" class="btn btn-default btn-sm"
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
                        <td><a href="addActor.jsp?id=<%=id%>" title="Add new actor" type="button"
                               class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span></a></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <br>
                <a href="showAllMovies.jsp" class="btn btn-default" role="button">Back</a>
                <a href="editMovie.jsp?id=<%= id %>" class="btn btn-primary" role="button">Edit</a>
                <button class="btn btn-danger " data-href="delete.jsp?id=<%= id %>" data-toggle="modal"
                        data-target="#confirm-delete">Delete
                </button>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    $(function () {

//        Potwierdzenie usuwania
        $("#confirm-delete").on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
        });
//          Pobieranie danych o filmie
        fetch('http://www.omdbapi.com/?t=<%= movie.getTitle()%>&y=&plot=full&r=json', {mode: 'cors'})
                .then(function (response) {
                    return response.json();
                })
                .then(function (text) {
                    if (text.Error) {
                        $('.plot').append(text.Error);
                        $('.rating').append('?/10');
                    }
                    else {
                        $('.plot').append(text.Plot);
                        $('.awards').append("Awards: " + text.Awards + '  ');
                        $('.rating').append(text.imdbRating + '/10');
                        $('.border').prepend(text.Runtime + ", ");
                    }
                    console.log('Request successful');
                })
                .catch(function (error) {
                    log('Request failed', error)
                });
//        $('body').addClass("background-batman");
    });

</script>
</body>
</html>