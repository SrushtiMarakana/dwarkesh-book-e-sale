package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/dwarkesh.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/register.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"line\"></div>\r\n");
      out.write("        <header>        \r\n");
      out.write("        <div class=\"align_left\">\r\n");
      out.write("                <img src=\"images/logo.jpg\" height=\"80px\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"align_right\">\r\n");
      out.write("                <a class=\"link\" href=\"index.jsp\">Login</a> | <a class=\"link\" href=\"register.jsp\">Register</a> | <a href=\"viewcart.jsp\" class=\"link\">View Cart</a><br>\r\n");
      out.write("                <div class=\"cart\">\r\n");
      out.write("                    <span style=\"color: blue\"> Total Quantity : 0</span><br>\r\n");
      out.write("                    <span style=\"color: blue\"> Total Amount : 0.0</span><br>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("        <br>\r\n");
      out.write("        <div class=\"search\">\r\n");
      out.write("        <form action=\"\" mathod=\"post\" align=\"center\">\r\n");
      out.write("            <input class=\"searcharea\" type=\"text\" name=\"search\">\r\n");
      out.write("            <input class=\"searchbox\" type=\"submit\" name=\"Search\" value=\"Search\"> \r\n");
      out.write("        </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <br>    \r\n");
      out.write("        \r\n");
      out.write(" \r\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"accountbody\">\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("    <footer>\n");
      out.write("    </footer>\n");
      out.write("    <div class=\"footer\">\n");
      out.write("        <img src=\"images/logo.jpg\" height=\"90px\"><br>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"copyright\">\n");
      out.write("        <span> &copy; 2022 Dwarkesh.com. All rights reserved.</span>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"line1\"></div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write('\n');
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
