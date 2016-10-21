<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IWTW | Home</title>
  <link href="https://fonts.googleapis.com/css?family=Raleway:300" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="static/style.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>
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
              <li><a>WHO</a></li>
              <li><a href="showAllMovies.jsp">Library</a></li>
              <li><a href="getMovieData.jsp">Add movie</a></li>
          </ul>
          </div>
      </div>
  </nav>
  <div class="container">
  <div class="row">
  <h1 class="movieTitle" style="text-align: center; margin-bottom: 40px;">Movies You watched</h1>
    
      </div>
      <div class="row">
      <div class="col-md-6 col-md-offset-3">
      <canvas id="myChart" width="400" height="400"></canvas>
      </div>
      </div>
</div>

  

  <script>
var ctx = $("#myChart");
var data = {
    labels: [
        "Watched",
        "Unwatched"
    ],
    datasets: [
        {
            data: [
            <%=(Integer)request.getAttribute("watched")%>, 
            <%=(Integer)request.getAttribute("unwatched")%>
            ],
            backgroundColor: [
                "#36A2EB",
                "#FFCE56"
            ],
            hoverBackgroundColor: [
                "#36A2EB",
                "#FFCE56"
            ]
        }]
}
var options = {
    maintainAspectRatio: true,
    responsive: false
    }
var myPieChart = new Chart(ctx,{
    type: 'pie',
    data: data,
    options: options
})

</script>
</body>
</html>