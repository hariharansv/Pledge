






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
        </style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
         <h1 class="he1">Pledge</h1>
        
      
        <div id="barchart_material"></div>
   <div id="barchart_values" style="width: 900px; height: 200px;"></div>
        <script>
            var ngo = ['aaa','ccc','abc','bbb','ddd'];
    var amount= [5820.0,3000.0,6748.0,5697.0,5335.0];
            
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
        width: 800,
        height: 400;
        bars:'horizontal'
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_material"));
      chart.draw(data, options);
  }
        </script>
    </body>
</html>
