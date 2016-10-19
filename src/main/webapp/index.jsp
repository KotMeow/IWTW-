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
      <div class="jumbotron">
      <h1>Welcome to IWTW</h1>
      <p>Site where you can manage movies YOU Want To Watch</p>
      <p><a class="btn btn-default btn-lg" href="showAllMovies.jsp" role="button">Show library</a></p>
</div>
  </div>
</body>
</html>
