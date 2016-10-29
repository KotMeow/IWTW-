<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <jsp:include page="imports.jsp"/>
    <title>IWTW | Home</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <div class="jumbotron">
        <h1>Welcome to <span class="brand">IWTW</span></h1>
        <p>Site where you can manage movies YOU Want To Watch</p>
        <p>You can start here:</p>
        <p><a class="btn btn-default btn-lg" href="showAllMovies.jsp">Show library</a></p>
    </div>
</div>
</body>
</html>
