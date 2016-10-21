package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class favorite_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>IWTW | Home</title>\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Raleway:300\" rel=\"stylesheet\">\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Yellowtail\" rel=\"stylesheet\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"static/style.css\">\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("  <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("   <nav class=\"navbar navbar-primary\">\n");
      out.write("       <div class=\"container-fluid\" id=\"line\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("          <span class=\"icon-bar\"></span>\n");
      out.write("          <span class=\"icon-bar\"></span>\n");
      out.write("          <span class=\"icon-bar\"></span>\n");
      out.write("          <span class=\"icon-bar\"></span>\n");
      out.write("        </button>\n");
      out.write("        <a class=\"navbar-brand\" href=\"index.jsp\">IWTW</a>\n");
      out.write("        </div>\n");
      out.write("          <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("          <ul  class=\"nav navbar-nav\">\n");
      out.write("              <li><a>WHO</a></li>\n");
      out.write("              <li><a href=\"showAllMovies.jsp\">Library</a></li>\n");
      out.write("              <li><a href=\"getMovieData.jsp\">Add movie</a></li>\n");
      out.write("          </ul>\n");
      out.write("          </div>\n");
      out.write("      </div>\n");
      out.write("  </nav>\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("  \n");
      out.write("  <div class=\"col-md-6\">\n");
      out.write("  <h1 class=\"movieTitle\" style=\"text-align: center; margin-bottom: 40px;\">Movies You watched</h1>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"col-md-6\">\n");
      out.write("  <canvas id=\"myChart\" width=\"400\" height=\"400\"></canvas>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("  <script>\n");
      out.write("var ctx = $(\"#myChart\");\n");
      out.write("var data = {\n");
      out.write("    labels: [\n");
      out.write("        \"Watched\",\n");
      out.write("        \"Unwatched\"\n");
      out.write("    ],\n");
      out.write("    datasets: [\n");
      out.write("        {\n");
      out.write("            data: [\n");
      out.write("            ");
      out.print((Integer)request.getAttribute("watched"));
      out.write(", \n");
      out.write("            ");
      out.print((Integer)request.getAttribute("unwatched"));
      out.write("\n");
      out.write("            ],\n");
      out.write("            backgroundColor: [\n");
      out.write("                \"#50A8E1\",\n");
      out.write("                \"#E0523D\"\n");
      out.write("            ],\n");
      out.write("            hoverBackgroundColor: [\n");
      out.write("                \"#50A8E1\",\n");
      out.write("                \"#E0523D\"\n");
      out.write("            ]\n");
      out.write("        }]\n");
      out.write("}\n");
      out.write("var options = {\n");
      out.write("    maintainAspectRatio: true,\n");
      out.write("    responsive: false\n");
      out.write("    }\n");
      out.write("var myPieChart = new Chart(ctx,{\n");
      out.write("    type: 'pie',\n");
      out.write("    data: data,\n");
      out.write("    options: options\n");
      out.write("})\n");
      out.write("\n");
      out.write("</script>\n");
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
