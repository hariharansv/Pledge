<%-- 
    Document   : NgoDataSuccess
    Created on : 25-Feb-2018, 12:25:38
    Author     : SOOSAI NIVEK
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.myapp.struts.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Updated</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <style>
            .h {
                color: blanchedalmond;
            }
            .bt {
                background-color: beige;
                color :black;
                width: 20%;
border: 0;
margin: 0 0 15px;
padding: 15px;
box-sizing: border-box;
font-size: 22px;
outline: 1;
            }
            </style>
            
    </head>
    
    <body>
         <h1 class="he1">Pledge</h1>
        <%
                String name=null;
                String space=null;
                
                String loc=null;
                String ngoid=null;
                try{
                ngoid=(String)session.getAttribute("id");
                loc=request.getParameter("ngoloc");
                space=request.getParameter("ngospace");
                float amount=Float.parseFloat(request.getParameter("ngoamount"))  ;
                //System.out.println("ngooid is "+ngoid);
                Connection con=DbConnection.getConnection();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from ngo where id='"+ngoid+"'");
                if(rs.next()){
                st.executeUpdate("update ngo set location='"+loc+"',sampspace='"+space+"',amount="+amount+" where id='"+ngoid+"'");
                }
                else
                response.sendRedirect("errror.jsp");
                }
                catch(Exception e){
                    System.out.println("Exception "+e);
                }
                HttpSession ses=request.getSession();
                ses.setAttribute("id",ngoid);
                %>
    <center>
                                <h1 class="h">Data updated successfully!</h1>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                <form action="ngohome.jsp">
                    <input type="submit" class="bt" value="Click here to see current details"/>
                </form>
    </center>
    </body>
</html>
