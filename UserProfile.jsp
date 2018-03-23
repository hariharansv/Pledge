<%-- 
    Document   : UserProfile
    Created on : 18 Mar, 2018, 3:03:44 PM
    Author     : hari-pt1875
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.myapp.struts.DbConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
        
        <%
            String uname=null;
            //String pwd=null;
            ArrayList<String> ngo=new ArrayList<String>();
            ArrayList<Double> amount=new ArrayList<Double>();
            ArrayList<Date> dat=new ArrayList<Date>();
            HttpSession ses=request.getSession();
          try{
              if(request.getParameter("name")!=null){
                  uname=request.getParameter("name");
                  System.out.println("Got user name from parameter");
              }
              else {
                  uname=(String)ses.getAttribute("user");
                  System.out.println("Got user details from session");
              }
              Connection con=DbConnection.getConnection();
              Statement st=con.createStatement();
              ResultSet rs=st.executeQuery("select * from feed where username='"+uname+"'");
              while(rs.next()){
                  ngo.add(rs.getString("ngoname"));
                  amount.add(rs.getDouble("amount"));
                  dat.add(rs.getDate("dat"));
              }
             // request.setAttribute("ngolist", ngo);
              //request.setAttribute("amountlist", amount);
              //request.setAttribute("datelist", dat);
          }
          catch(Exception e){
              System.out.println("Exception in profile "+e);
          }
            %>
        
        <h1> class="hel">Pledge</h1>
        <div class="div1">
<div class="div2">
    <center><h3 class="he">Welcome <%=uname%></h3></center>
    <table>
    <tr>
        <th>Date</th>
        <th>Ngo Name</th>
        <th>Amount Donated</th>
    </tr>
        <c:forEach begin="0" end="${fn:length(ngo) - 1}" var="index">
        <tr>
            <td><c:out value="${dat[index]}"/></td>
            <td><c:out value="${ngo[index]}"/></td>
            <td><c:out value="${amount[index]}"/></td>
        </tr>
        </c:forEach>
    </table>
</div>
        </div>
    </body>
</html>
