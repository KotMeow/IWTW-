<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="navbar.jsp"/>
<jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Library</title>
</head>
<body>

<c:if test="${storage.getAllMovies().size() == 0}">
    <div class="container-fluid">
        <h1>Library seems to be empty</h1>
        <p><a class="btn btn-default btn-lg" href="populate.jsp">Change This!</a></p>
    </div>
</c:if>

<div class="container-fluid">
    <div class="col-md-2">
        <button class="btn btn-default hidethis">Show only favorite!</button>
    </div>
    <div class="col-md-8">
    <c:forEach items="${storage.getAllMovies()}" var="movie">
        <c:if test="${!movie.getIsFavorite()}">
            <span class="isFavorite">
        </c:if>
        <a href="movieDetails.jsp?id=${storage.getAllMovies().indexOf(movie)}">
                <div class="item" style="background-image: url('${movie.getCoverUrl()}')">
                    <div class="overlay">
                        <span class="item-header">${movie.getTitle()}</span>
                        <c:if test="${movie.getIsFavorite()}">
                            <span class="showallstar glyphicon glyphicon-star-empty active" aria-hidden="true"></span>
                        </c:if>
                    </div>
                </div>

            </a>
        <c:if test="${!movie.getIsFavorite()}">
            </span>
        </c:if>

    </c:forEach>
    </div>
</div>
<script type="application/javascript">
    $(".hidethis").on('click', function () {
        $(".isFavorite").toggleClass('hidden');
        var text = $(this).text();
        $(this).text(
                text == "Show only favorite!" ? "Show all" : "Show only favorite!");
    })

</script>
</body>
</html>
