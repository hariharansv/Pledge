<%-- 
    Document   : UserWelcome
    Created on : 25-Feb-2018, 19:07:22
    Author     : SOOSAI NIVEK
--%>

<%@page import="com.myapp.struts.Hash"%>
<%@page import="com.myapp.struts.SplitMoney"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        
        <style>
            .inp{
font-family: "Roboto", sans-serif;
outline: 1;
background-color: pink;
width: 16%;
border: 0;
margin: 0 0 5px;
padding: 10px;
box-sizing: border-box;
font-size: 24px;
}
.h2{
    color: darkred;
}
        </style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
         <h1 class="he1">Pledge</h1>
        <%
            HashMap<String,Integer> hm=SplitMoney.getHashMap();
            String[] ngo=Hash.getKeys(hm);
            int size=ngo.length;
            float[] amt=SplitMoney.getAmount(ngo);
            System.out.println("Ngo names and values");
            for(int i=0;i<size;i++){
                System.out.println("Name "+ngo[i]+"Amount "+amt[i]);
            }
            %>
    <center>
        <div id="barchart_material"></div>
   <div id="barchart_values" style="width: 900px; height: 200px;"></div>
        <script>
            var ngo = <%
out.print("["); 
boolean first=true;
for(int i=0;i<ngo.length;i++){
if(first){
out.print("'"+ngo[i]+"'");
first=false;
}else{

out.print(",'"+ngo[i]+"'");
}
}
out.print("]");
%>;
    var amount= <%
        out.print("["); 
boolean f=true;
for(int i=0;i<amt.length;i++){
if(f) {
out.print(amt[i]);
f=false;
}

else{

out.print(","+amt[i]);
}
}
out.print("]");
        %>;
            
            var finalArray = [
        ["NGO","Amount", { role: "style" } ]
      ];
      
for(var i=0;i<ngo.length;i++){
	var temp= [ngo[i],amount[i]];
  if(amount[i]<=2000){
  	temp[2] = "green";
  }else{
  temp[2]="red";
  }
	finalArray[i+1] =temp;
}

google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable(finalArray);


      var options = {
        title: "NGO",
        width: 1200,
        height: 400,
        bars:'horizontal'
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_material"));
      chart.draw(data, options);
  }
        </script>
    </center>         
    <center>
            <form action="payment.jsp">
                <h2 class="h2">Enter the amount</h2>
                
                <input type="text" name="amt" class="inp"/>
                <br/><br/>
                <input class="inp"  type="submit" value="Proceed to Pay"/>
            </form>
            </center>
    
    </body>
</html>
