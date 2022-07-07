package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.HashMap;

public final class viewcart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    HashMap<Integer, Integer> cartDetails = null;
    int totalQty =0;
    float totalAmt = 0;

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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write('\n');

        cartDetails = (HashMap<Integer,Integer>)session.getAttribute("cart");
        if((Integer)session.getAttribute("totalQty") == null){
        totalQty = 0;
        session.setAttribute("totalQty", totalQty);
        totalAmt= (float)(0);
        session.setAttribute("totalAmt", totalAmt);
        }
        else{
           totalQty = (int)session.getAttribute("totalQty");
           totalAmt = (float)session.getAttribute("totalAmt");
        }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"images/logo.jpg\" height=\"80px\">\n");
      out.write("        <a href=\"updateprofile.jsp\">Update Profile</a>  <a href=\"viewcart.jsp\">Cart TotalQty:");
      out.print(totalQty);
      out.write(" TotalAmt:");
      out.print(totalAmt);
      out.write("</a><a href=\"logout.jsp\">LOG OUT</a>\n");
      out.write("        <br>\n");
      out.write("        <form action=\"\" mathod=\"post\">\n");
      out.write("        <input type=\"text\" name=\"search\">\n");
      out.write("        <input type=\"submit\" name=\"Search\" value=\"search\"> \n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <h2>Cart Page</h2>\n");
      out.write("        <h4>My Shopping Bag(");
      out.print(totalQty);
      out.write(" items)</h4>\n");
      out.write("        <h4>Total Price: ");
      out.print(totalAmt);
      out.write("</h4>\n");
      out.write("\n");

    if(session.getAttribute("cart")!=null){
        
        for(Integer key:cartDetails.keySet()){
        //out.println(key);
        int quantity = cartDetails.get(key);
        //out.println(quantity);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dwarkesh" , "root" , "");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("Select * from product where product_id="+key);
        while(rs.next())
            {
                int productid = rs.getInt(1);
                out.println("<tr>");
                out.println("<td>" +productid+"</td>");
                out.println("<td>" +rs.getString(2)+"</td>");
                out.println("<td>" +rs.getString(3)+"</td>");
                String path = rs.getString(4);
                out.println("<td>" +"<img height=100 width = 100 src= " + path + " />"+"</td>");
                Float price = rs.getFloat(5);
                out.println("<td>" +price+"</td>");
                out.println("<td><a href=addtocart.jsp?product_id=" + productid + "&quantity=1&price=" + price + ">AddQty:+</a></td>");
                out.println("<td>Quantity:"+quantity+"</td>");
                out.println("<td><a href=deletecart.jsp?product_id=" + productid + "&quantity=1&price=" + price + ">RemoveQty:</a></td>");
                out.println("<td><a href=deletecart.jsp?product_id=" + productid + "&quantity="+ quantity +"&price=" + price + ">Remove</a></td>");
                out.println("</tr>");
                out.println("<br>");                                
            }  
        }
    }

      out.write("\n");
      out.write("        <a href=\"logout.jsp\">Place Order</a>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<img src=\"images/logo.jpg\" height=\"80px\">\n");
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
