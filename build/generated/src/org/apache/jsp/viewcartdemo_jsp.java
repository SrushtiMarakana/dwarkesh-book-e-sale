package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class viewcartdemo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/dwarkesh.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/register.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"line\"></div>\n");
      out.write("        <header>        \n");
      out.write("        <div class=\"align_left\">\n");
      out.write("                <img src=\"images/logo.jpg\" height=\"80px\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"align_right\">\n");
      out.write("                <a class=\"link\" href=\"index.jsp\">Login</a> | <a class=\"link\" href=\"register.jsp\">Register</a> | <a href=\"viewcartdemo.jsp\" class=\"link\">View Cart</a><br>\n");
      out.write("                <div class=\"cart\">\n");
      out.write("                    <span style=\"color: blue\"> Total Quantity : 0</span><br>\n");
      out.write("                    <span style=\"color: blue\"> Total Amount : 0.0</span><br>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"search\">\n");
      out.write("        <form action=\"\" mathod=\"post\" align=\"center\">\n");
      out.write("            <input class=\"searcharea\" type=\"text\" name=\"search\">\n");
      out.write("            <input class=\"searchbox\" type=\"submit\" name=\"Search\" value=\"Search\"> \n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"viewcart\">\n");
      out.write("            <span class=\"text2\">Cart Page</span>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"viewcartline\"></div>\n");
      out.write("        <br><br>\n");
      out.write("        <span class=\"shoppingbag\">My Shopping Bag(0 items)</span>\n");
      out.write("        <span class=\"totalprice\">Total Price: 0.0</span>\n");
      out.write("        <br><br>\n");
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
