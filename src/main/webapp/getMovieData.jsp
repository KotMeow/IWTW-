<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Yellowtail" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/style.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>IWTW | Add</title>
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
              <ul class="nav navbar-nav">
                  <li><a>WHO</a>
                  </li>
                  <li><a href="showAllMovies.jsp">Library</a>
                  </li>
                  <li><a href="getMovieData.jsp">Add movie</a>
                  </li>
              </ul>
          </div>
      </div>
    </nav>
    <jsp:useBean id="storage" class="com.example.iwtw.service.StorageService" scope="application" />
    <jsp:useBean id="movie" class="com.example.iwtw.domain.Movie" scope="session" />
    <div class="container-fluid">
        <div class="col-md-4">
            <form class="form-horizontal" action="addMovie.jsp">
                <div class="form-group">
                    <label class="control-label" for="title">Title</label>
                    <input class="form-control" id="title" type="text" name="title" value="" required/>
                </div>
                <div class="form-group">
                    <label class="control-label" for="releaseYear">Release Year</label>
                    <input class="form-control" type="number" name="releaseYear" value="" min="1920" max="3000" required/>
                </div>
                <div class="form-group">
                    <label class="control-label" for="genre">Genre</label>
                    <input class="form-control" type="text" name="genre" value="" required/>
                </div>
                <div class="form-group">
                    <label class="control-label" for="coverUrl">Picture url</label>
                    <input class="form-control" type="url" name="coverUrl" value="" required/>
                </div>
                <div class="form-group">
                  <a class="btn btn-default" href="showAllMovies.jsp">Back</a>
                  <input class="btn btn-primary" type="submit" value="Add">
                </div>
            </form>
        </div>
    </div>
</body>

</html>