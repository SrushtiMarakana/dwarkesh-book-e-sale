package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.HashMap;

public final class placeorder_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    HashMap<Integer, Integer> cartDetails = null;
    HashMap<Integer, Integer> placeorder = new HashMap<>(); 

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');

    int uid = Integer.parseInt(request.getParameter("uid"));
    String uname = request.getParameter("uname");
    cartDetails = (HashMap<Integer,Integer>)session.getAttribute("cart");
    if(session.getAttribute("cart")!=null){
        
        int qty = 0;
        int finalqty =0;
        int pid =0;
        for(Integer key:cartDetails.keySet()){
            out.println(key);
            int quantity = cartDetails.get(key);
            out.println(quantity);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select book"+key+" from placeorder where userid="+uid);
            while(rs.next()){
                qty = rs.getInt(1);
                out.println(qty);
            }
            finalqty = qty + quantity;
            out.println(finalqty);
            pid = key;
            placeorder.put(pid, finalqty);
            out.println("<br>");
        }
        out.println("<br>");
        for(Integer key:placeorder.keySet()){
            out.println(key);
            int finalquantity = placeorder.get(key);
            out.println(finalquantity);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
            Statement stmt = con.createStatement();
            String query = "UPDATE placeorder SET book"+key+"="+finalqty+" where userid="+uid;
            stmt.executeUpdate(query);
        }
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
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
      out.write("</span> |\n");
      out.write("            <a class=\"link\" href=\"updateprofile.jsp?uid=");
      out.print(uid);
      out.write("\">Update Profile</a> | <a href=\"viewcart.jsp?uname=");
      out.print(uname);
      out.write("&uid=");
      out.print(uid);
      out.write("\" class=\"link\">View Cart</a> | <a class=\"link\" href=\"logout.jsp\">LOG OUT</a><br>\n");
      out.write("                <div class=\"cart1\">\n");
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
      out.write("        <br>");
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
