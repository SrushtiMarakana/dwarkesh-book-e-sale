package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.FileInputStream;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.io.InputStream;

public final class userdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String uname = request.getParameter("uname");
    int uid = Integer.parseInt(request.getParameter("uid"));

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/adminpanel.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/dwarkesh.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/booklisting.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"line\"></div>\n");
      out.write("        <header>        \n");
      out.write("        <div class=\"align_left\">\n");
      out.write("            <img src=\"images/logo.jpg\" height=\"80px\">\n");
      out.write("        </div>  \n");
      out.write("        <div class=\"align_right\">\n");
      out.write("            <span style=\"color: blue; font-size: 18px;font-weight:500;margin-left: 10px;margin-right: 10px;\"> Welcome ");
      out.print(uname);
      out.write("</span> |  <a class=\"link\" href=\"adminpanel.jsp?uname=");
      out.print(uname);
      out.write("&uid=");
      out.print(uid);
      out.write("\">Product List</a> | <a class=\"link\" href=\"adminrights.jsp?uname=");
      out.print(uname);
      out.write("&uid=");
      out.print(uid);
      out.write("\">Admin Rights</a> | <a class=\"link\" href=\"userdetails.jsp?uname=");
      out.print(uname);
      out.write("&uid=");
      out.print(uid);
      out.write("\">User Details</a> |\n");
      out.write("            <a class=\"link\" href=\"updateprofileadmin.jsp?uname=");
      out.print(uname);
      out.write("&uid=");
      out.print(uid);
      out.write("\">Update Profile</a> | <a class=\"link\" href=\"logout.jsp\">LOG OUT</a><br>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"search\" align=\"center\">\n");
      out.write("            <input class=\"searcharea\" type=\"text\" name=\"search\">\n");
      out.write("            <input class=\"searchbox\" type=\"submit\" name=\"Search\" value=\"Search\"> \n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("    <footer>\n");
      out.write("    </footer>\n");
      out.write("    <div class=\"footer\">\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/logo.jpg\" height=\"90px\"><br>\n");
      out.write("    </div>\n");
      out.write("    <div>\n");
      out.write("        <span class=\"copyright\"> &copy; 2022 Srushti Marakana & co. All rights reserved.</span>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"line1\"></div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
