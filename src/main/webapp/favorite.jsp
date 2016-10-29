<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>IWTW | Library details</title>
    <jsp:include page="imports.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h1 id="detailsTitle">Details about your library:</h1>
<div class="container">
    <div class="row" style="margin-bottom: 50px;">
        <div class="col-md-6 details">
            <p class="detailsInfo">You have <strong>${all}
            </strong>movies in your library.</p>
            <p class="detailsInfo">And <strong>${favorite}
            </strong> of them are your favorites.</p>
            <p class="detailsInfo">It's like <strong>${favoritePercent}%
            </strong></p>
            <p class="detailsInfo">${favoriteRate}</p>
        </div>
        <div class="col-md-6">
            <canvas id="myChart" width="300" height="300"></canvas>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 details">
            <p class="detailsInfo">Your favorite genre is: <strong>
                ${favoriteGenre.key}
            </strong></p>
            <p class="detailsInfo">You have <strong>${favoriteGenre.value}
            </strong> movies of that genre</p>
        </div>
        <div class="col-md-6">
            <canvas id="myChart2" width="300" height="300"></canvas>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 details">
            <p class="detailsInfo">You have watched <strong>
                ${watched}
            </strong> movies</p>
            <p class="detailsInfo">You have <strong>${favoriteGenre.value}
            </strong> movies of that genre</p>
        </div>
    </div>
</div>


<script type="text/javascript">
    var config = {
        type: 'pie',
        data: {
            labels: [
                "Favorite",
                "Others"
            ],
            datasets: [
                {
                    data: [
                        <%=request.getAttribute("favorite")%>,
                        <%=request.getAttribute("others")%>
                    ],
                    backgroundColor: [
                        "#FFD150",
                        "#50A8E1"

                    ],
                    hoverBackgroundColor: [
                        "#FFD150",
                        "#50A8E1"

                    ]
                }]
        },
        options: {
            maintainAspectRatio: true,
            responsive: false,
            legend: {
                position: 'bottom'
            }
        }
    };
    var config1 = {
        type: 'pie',
        data: {
            labels: [
                <c:forEach items="${genre}" var="genre">
                "${genre.key}",
                </c:forEach>
            ],
            datasets: [
                {
                    data: [
                        <c:forEach items="${genre}" var="genre">
                        ${genre.value},
                        </c:forEach>
                    ],
                    backgroundColor: [
                        "#50A8E1",
                        "#5F66E6",
                        "#FFD150",
                        "#FFB250",
                        "#2D6998",
                        "#E0523D",
                        "#AFB1B9"
                    ],
                    hoverBackgroundColor: [
                        "#50A8E1",
                        "#5F66E6",
                        "#FFD150",
                        "#FFB250",
                        "#2D6998",
                        "#E0523D",
                        "#AFB1B9"
                    ]
                }]
        },
        options: {
            maintainAspectRatio: true,
            responsive: false,
            legend: {
                position: 'bottom'
            }
        }
    };
    $(function () {
        new Chart(document.getElementById("myChart"), config);
        new Chart(document.getElementById("myChart2"), config1);
    });


</script>
</body>
</html>