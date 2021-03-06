package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.example.iwtw.domain.Movie;

public final class movieDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Raleway:300\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Yellowtail\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"static/style.css\">\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("    <title>IWTW | Edit</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    ");
      com.example.iwtw.service.StorageService storage = null;
      synchronized (application) {
        storage = (com.example.iwtw.service.StorageService) _jspx_page_context.getAttribute("storage", PageContext.APPLICATION_SCOPE);
        if (storage == null){
          storage = new com.example.iwtw.service.StorageService();
          _jspx_page_context.setAttribute("storage", storage, PageContext.APPLICATION_SCOPE);
        }
      }
      out.write("\n");
      out.write("    ");
 int id= Integer.parseInt(request.getParameter("id")); Movie movie=storage.getAllMovies().get(id); 
      out.write("\n");
      out.write("    <nav class=\"navbar navbar-primary\">\n");
      out.write("        <div class=\"container-fluid\" id=\"line\">\n");
      out.write("            <div class=\"navbar-header\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.jsp\">IWTW</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li><a>WHO</a></li>\n");
      out.write("                    <li><a href=\"showAllMovies.jsp\">Library</a></li>\n");
      out.write("                    <li><a href=\"getMovieData.jsp\">Add movie</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <div class=\"modal fade\" id=\"confirm-delete\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("        <div class=\"modal-dialog\">\n");
      out.write("            <div class=\"modal-content\">\n");
      out.write("            \n");
      out.write("                <div class=\"modal-header\">\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                    <h4 class=\"modal-title\" id=\"myModalLabel\">Confirm Delete</h4>\n");
      out.write("                </div>\n");
      out.write("            \n");
      out.write("                <div class=\"modal-body\">\n");
      out.write("                    <p>You are about to delete <strong>");
      out.print( movie.getTitle());
      out.write("</strong></p>\n");
      out.write("                    <p>Do you want to proceed?</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div class=\"modal-footer\">\n");
      out.write("                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("                    <a class=\"btn btn-danger btn-ok\">Delete</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("        <img class=\"img-responsive\" src=\"");
      out.print( movie.getCoverUrl());
      out.write("\"/>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("        <h1 class=\"movieTitle\">");
      out.print( movie.getTitle());
      out.write("\n");
      out.write("        <small>\n");
      out.write("        ");
 if (movie.getIsFavorite() == true) { 
      out.write("\n");
      out.write("            <a href=\"toggleFavorite.jsp?id=");
      out.print( id);
      out.write("\"><span class=\"glyphicon glyphicon-star-empty active\" aria-hidden=\"true\"></span></a>    \n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("            <a href=\"toggleFavorite.jsp?id=");
      out.print( id );
      out.write("\"><span class=\"glyphicon glyphicon-star-empty\" aria-hidden=\"true\"></span></a>      \n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        </small>\n");
      out.write("        </h1>  \n");
      out.write("        <h2>");
      out.print( movie.getGenre());
      out.write("</h2>\n");
      out.write("        <h2>");
      out.print( movie.getReleaseYear());
      out.write("</h2>\n");
      out.write("        <p> \n");
      out.write("            Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible - inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming.\n");
      out.write("        </p>\n");
      out.write("        <br>\n");
      out.write("        <a href=\"editMovie.jsp?id=");
      out.print( id );
      out.write("\" class=\"btn btn-primary btn-lg\" role=\"button\">Edit</a>       \n");
      out.write("        <button class=\"btn btn-danger btn-lg\" data-href=\"delete.jsp?id=");
      out.print( id );
      out.write("\" data-toggle=\"modal\" data-target=\"#confirm-delete\">Delete       \n");
      out.write("        </button>\n");
      out.write("        </div>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write(" <script>\n");
      out.write("        $('#confirm-delete').on('show.bs.modal', function(e) {\n");
      out.write("            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
