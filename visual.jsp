<%-- 
    Document   : visual
    Created on : 1 Mar, 2018, 12:01:55 AM
    Author     : hari-pt1875
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP visual Page</title>
         <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <%
            String[] ngo={"aaa","bbb","ccc","ddd","eee"};
            float[] amt={12000,4000,8000,6700,9800};
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
  if(amount[i]<=5000){
  	temp[2] = "green";
  }else if(amount[i]>=10000){
  	temp[2]="red";
  }else{
  temp[2]="yellow";
  }
	finalArray[i+1] =temp;
}

google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable(finalArray);


      var options = {
        title: "NGO",
        width: 1600,
        height: 600,
        bars:'horizontal'
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_material"));
      chart.draw(data, options);
  }
        </script>
        <form>
            <input type="text" name="amt">
            <input type="submit" value="Proceed to Pay"/>
        </form>  
    </center>    
    </body>
</html>
