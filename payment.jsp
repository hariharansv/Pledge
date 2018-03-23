<%-- 
    Document   : payment
    Created on : 26-Feb-2018, 22:14:01
    Author     : SOOSAI NIVEK
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.myapp.struts.SplitMoney"%>
<%@page import="com.myapp.struts.Hash"%>
<%@page import="com.myapp.struts.KMeansClustering"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.myapp.struts.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Gateway</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <style>
            .tab td,tr,th{
                border: 1px solid black;
                 width: 640px;
                 background-color: bisque;
            }
            tr {
                width: 75%;
                 height: 75%;
            }
            .f1 input{
                
font-family: "Roboto", sans-serif;
text-transform: uppercase;
outline: 0;
background: #4CAF50;
background-color: beige;
width: 35%;
border: 0;
padding: 15px;
color: dimgrey;
font-size: 14px;
cursor: pointer;
            }
            .h2{
                color: ghostwhite;
            }
        </style>
    </head>
    <body>
         <h1 class="he1">Pledge</h1>
        <%
            String ngoid;
            int amnt,fun;
            Connection con=DbConnection.getConnection();
            Statement st=con.createStatement();
            Statement s=con.createStatement();
            ResultSet rs;
            KMeansClustering km=new KMeansClustering();
            int amt=Integer.parseInt(request.getParameter("amt"));
            int i=0;
            HashMap<String,Integer> hm=SplitMoney.getHashMap();
           // HashMap<String,Integer> hm2=SplitMoney.getHashMap();
           SplitMoney sm=new SplitMoney();
            int[] array=sm.mapToArray(hm);
            HashMap<String,Integer> hmap=new HashMap<String,Integer>();
            int cluster[]=km.getCluster(array);
            System.out.println("In jsp");
            int total=km.getCount();
            System.out.println(total);
            int l=cluster.length;
            System.out.println("Cluster Length :"+l);
            HashMap<String,Integer> res=sm.getHashMap();
            System.out.println("HashMap Values from db");
             for(Map.Entry<String,Integer> e:hm.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }
            String[] name;
            int[] amount;
               System.out.println("Inside  While in jsp amount is"+amt+" and total  is "+total);
            if(amt<total)
            {
                hmap=sm.split(hm, cluster, amt, total);
                 System.out.println("HashMap Values from while loop");
             /*for(Map.Entry<String,Integer> e:hmap.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }*/
            }
            else {
                hm=sm.getHashMap();
                array=SplitMoney.mapToArray(hm);
                cluster=KMeansClustering.getCluster(array);
                total=KMeansClustering.getCount();
                l=cluster.length;
                hmap=SplitMoney.split(hm, cluster, amt, total);
              }
            for(Map.Entry<String,Integer> e:hmap.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }
            amt=sm.getAmount(hmap,amt);
            System.out.println("Amount after end of if else :"+amt);
             while(amt>0)
           {
               System.out.println("In while");
            rs=st.executeQuery("select * from ngo where amount=(select max(amount) from ngo)");
            if(rs.next()){
                System.out.println("inside rs.next");
                 ngoid=rs.getString("id");
                         amnt=rs.getInt("amount");
                         int don;
                        fun=rs.getInt("fund");
                        //float don;
                        System.out.println("amount is "+amt+" and fund is "+fun);
                        //float tf,ta;
                        //int f,a;
                        if(amt<amnt){
                            amnt=amnt-amt;
                            fun=fun+amt;
                            don=amt;
                            amt=0;
                             
                        }
                        else {
                            amt=amnt-amt;
                            fun=fun+amnt;
                            don=amnt;
                            amnt=0; 
                        }  
                        System.out.println("ngoid is "+ngoid+" amt is "+fun);
                        hmap.put(ngoid,don);
                        s.executeUpdate("update ngo set amount="+amnt+",fund="+fun+" where id='"+ngoid+"'");
            }
            res=hmap;
           }
              for(Map.Entry<String,Integer> e:res.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }
           System.out.println("Out of while in jsp");
           name=Hash.getKeys(res);
           amount=Hash.getValues(res);
           for(i=0;i<res.size();i++)
           {
               System.out.println(name[i] +" "+amount[i]);
           }
           request.setAttribute("hashmap", hmap);
        %>
        
    <center>
        <h1 class="h2">Your amount has  been split up and donated to the following organisations </h1>
        <table class="tab">
            <tr>
            <th>Ngo Name</th>
            <th>Amount gone</th>
            </tr>
            <c:forEach items="${hashmap}" var="entry">
                 <tr>
                     <td>
                         <c:out value="${entry.key}"/> 
                     </td>
                     <td>
                         <c:out value="${entry.value}"/>
                     </td>
            </tr>
            </c:forEach>
           
        </table>
        <br/>
        <br/>
        <br/>
        <br/>
        <form class="f1" action="UserWelcome.jsp">
            <input type="submit" value="Click here to see the impact" />
        </form>
    </center>
    </body>
</html>
