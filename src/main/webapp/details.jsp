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
<div class="container">
    <h1 id="detailsTitle">Details about your library:</h1>
</div>
<div class="container-fluid">
    <div class="col-md-4 details" style="border-right: solid #50A8E1 1px;">
        <div class="detailsWrapper">
            <p class="detailsInfo">You have <strong>${all}
            </strong>movies in your library.</p>
            <p class="detailsInfo">And <strong>${favorite}
            </strong> of them are your favorites.</p>
        </div>
        <canvas id="myChart" width="400" height="400"></canvas>
    </div>
    <div class="col-md-4 details" style="border-right: solid #50A8E1 1px;">
        <div class="detailsWrapper">
            <p class="detailsInfo">Your favorite genre is: <strong>
                ${favoriteGenre.key}
            </strong></p>
            <p class="detailsInfo">You have <strong>${favoriteGenre.value}
            </strong> movies of that genre</p>
        </div>
        <canvas id="myChart1" width="400" height="400"></canvas>
    </div>
    <div class="col-md-4 details">
        <div class="detailsWrapper">
            <p class="detailsInfo">You have watched <strong>
                ${watched}
            </strong> movies</p>
            <p class="detailsInfo">It's <strong>${watchedPercent}%
            </strong> of your library</p>
        </div>
        <canvas id="myChart2" width="400" height="400"></canvas>
    </div>
</div>

<script type="text/javascript">
    var config = {
        type: 'pie',
        data: {
            labels: [
                "Watched",
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
        type: 'horizontalBar',
        data: {
            labels: [
                <c:forEach items="${genre}" var="genre">
                "${genre.key}",
                </c:forEach>
            ],
            datasets: [
                {
                    label: "Amount: ",
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
            },
            scales: {
                xAxes: [{
                    stacked: true
                }],
                yAxes: [{
                    stacked: true
                }]
            }

        }
    };
    var config2 = {
        type: 'pie',
        data: {
            labels: [
                "Favorite",
                "Others"
            ],
            datasets: [
                {
                    data: [
                        ${watched},
                        ${others}
                    ],
                    backgroundColor: [
                        "#248232",
                        "#50A8E1"

                    ],
                    hoverBackgroundColor: [
                        "#248232",
                        "#50A8E1"

                    ]
                }]
        },
        options: {
            maintainAspectRatio: true,
            responsive: false
        }
    };
    $(function () {
        new Chart(document.getElementById("myChart"), config);
        new Chart(document.getElementById("myChart1"), config1);
        new Chart(document.getElementById("myChart2"), config2);
    });


</script>
</body>
</html>