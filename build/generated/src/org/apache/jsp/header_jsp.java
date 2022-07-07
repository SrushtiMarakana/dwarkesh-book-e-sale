package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("                <a class=\"link\" href=\"index.jsp\">Login</a> | <a class=\"link\" href=\"register.jsp\">Register</a> | <a href=\"viewcartdemo.jsp\" class=\"link\">View Cart</a><br>\r\n");
      out.write("                <div class=\"cart\">\r\n");
      out.write("                    <span style=\"color: blue\"> Total Quantity : 0</span><br>\r\n");
      out.write("                    <span style=\"color: blue\"> Total Amount : 0.0</span><br>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("        <br>\r\n");
      out.write("        <div class=\"search\" align=\"center\">\r\n");
      out.write("            <input class=\"searcharea\" type=\"text\" name=\"search\">\r\n");
      out.write("            <input class=\"searchbox\" type=\"submit\" name=\"Search\" value=\"Search\"> \r\n");
      out.write("        </div>\r\n");
      out.write("        <br>    \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <form method=\"post\" action=\"AddImage\" enctype=\"multipart/form-data\">\r\n");
      out.write("            choose image:\r\n");
      out.write("            <input type=\"file\" name=\"image\">\r\n");
      out.write("            <input type =\"submit\" name=\"submit\" value=\"submit\">\r\n");
      out.write("        </form>\r\n");
      out.write(" \r\n");
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
