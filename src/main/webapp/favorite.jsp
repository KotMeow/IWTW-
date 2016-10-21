<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>IWTW | Home</title>
    <jsp:include page="imports.jsp"/>
</head>
<body>
    <jsp:include page="navbar.jsp"/>

<div class="container-fluid">

    <div class="col-md-6">
        <h1 class="movieTitle" style="text-align: center; margin-bottom: 40px;">Movies You watched</h1>
    </div>
    <div class="col-md-6">
        <canvas id="myChart" width="400" height="400"></canvas>
    </div>
</div>


<script type="text/javascript">
    var ctx = $("#myChart");
    var data = {
        labels: [
            "Watched",
            "Unwatched"
        ],
        datasets: [
            {
                data: [
                    <%=request.getAttribute("watched")%>,
                    <%=request.getAttribute("unwatched")%>
                ],
                backgroundColor: [
                    "#50A8E1",
                    "#E0523D"
                ],
                hoverBackgroundColor: [
                    "#50A8E1",
                    "#E0523D"
                ]
            }]
    };
    var options = {
        maintainAspectRatio: true,
        responsive: false
    };
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options
    })

</script>
</body>
</html>