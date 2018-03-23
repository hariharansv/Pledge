<%-- 
    Document   : ngohome
    Created on : 24-Feb-2018, 23:31:38
    Author     : SOOSAI NIVEK
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.myapp.struts.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ngo Homepage</title>
        <link rel="stylesheet" href="style.css"/>
        <style>
            
.he2,.he3{
    color: azure;
    font-size: 25px;
}
.form1 {
    font-family: sans-serif;
    font-size: 20px;
    color: antiquewhite;
}
            </style>
    </head>
    <body>
        <h1 class="he1">Pledge</h1>
        
        <div class="div1">
            <center><h2 class="he2">Welcome</h2></center>
            <h3 class="he3">Current Details regarding the organisation and needs</h3>
            <%-- 
--%>
            <%
                String name=null;
                String space=null;
                String amount=null;
                String loc=null;
                String ngoid=null,fund=null;
                HttpSession ses=request.getSession();
                try{
                System.out.println("Inside try");
                if(ses.getAttribute("id")!=null)
                {
                    System.out.println("Empty");
                    ngoid=(String)ses.getAttribute("id");
                    System.out.println("After Session "+ngoid);
                }
                else 
                {
                ngoid=request.getParameter("mail");
                System.out.println(ngoid);
                System.out.println("ngooid is "+ngoid);
                }
                Connection con=DbConnection.getConnection();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from ngo where id='"+ngoid+"'");
                if(rs.next()){
                name=rs.getString("name");
                space=rs.getString("sampspace");
                loc=rs.getString("location");
                amount=rs.getString("amount");
                fund=rs.getString("fund");}
                ses.setAttribute("id",ngoid);
                }
                catch(Exception e){
                    System.out.println("Exception "+e);
                }
                %>
                
                <form class="form1" action="NgoDataSuccess.jsp">
                Ngo  ID       :    <input type="text" name="ngoid" value="<%=ngoid%>" disabled="true"/>
                Ngo Name      :    <input type="text" name="ngoname" value="<%=name%>" disabled="true"/>
                Location      :    <input type="text" name="ngoloc" value="<%=loc%>"/>
                Sample Space  :    <input type="text" name="ngospace" value="<%=space%>"/>
                Amount in need:    <input type="text" name="ngoamount" value="<%=amount%>"/>
                
                Fund raised   :     <input type="text" name="ngoid" value="<%=fund%>" disabled="true"/>
                <br/>
                <br/>
                <input type="submit" value="Update"/>
                </form>         
       
          </div>
    </body>
</html>
