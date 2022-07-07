package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/body.jsp");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <img src=\"images/logo.jpg\" height=\"80px\">\r\n");
      out.write("        <a href=\"index.jsp\">Login</a> | <a href=\"register.jsp\">Register</a>  <a href=\"viewcart.jsp\">Cart</a>\r\n");
      out.write("        <br>\r\n");
      out.write("        <form action=\"\" mathod=\"post\">\r\n");
      out.write("        <input type=\"text\" name=\"search\">\r\n");
      out.write("        <input type=\"submit\" name=\"Search\" value=\"search\"> \r\n");
      out.write("        </form>\r\n");
      out.write("        <br>    \r\n");
      out.write("        \r\n");
      out.write(" \r\n");
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("Home > <a href=\"index.jsp\">Login</a> \n");
      out.write("<h2>Login or Create an Account</h2>\n");
      out.write("<h3>New Customer</h3>\n");
      out.write("<h4>Registration is free and easy</h4>\n");
      out.write("<ul>\n");
      out.write("    <li>Faster checkout</li>\n");
      out.write("    <li>Save Multiple shopping address</li>\n");
      out.write("    <li>View and orders and more</li>\n");
      out.write("</ul>\n");
      out.write("<a href=\"register.jsp\">Create an Account</a>\n");
      out.write("<br>\n");
      out.write("<h3>Registered Customers</h3>\n");
      out.write("<h4>If you have an account with us,please log in </h4>\n");
      out.write("<form method=\"post\" action=\"\">\n");
      out.write("    <label for=\"email\">Email Address</label><br>\n");
      out.write("    <input type=\"email\" name=\"email\" required=\"\"><br>\n");
      out.write("    <label for=\"password\">Password</label><br>\n");
      out.write("    <input type=\"password\" name=\"password\" maxlength=\"10\" minlength=\"8\" required=\"\"><br><br>\n");
      out.write("    <input type=\"submit\" name=\"submit\" value=\"Login\">    \n");
      out.write("</form>\n");
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<img src=\"images/logo.jpg\" height=\"80px\">\n");
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
