<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="./css/dashboard.css" rel="stylesheet">
    <title>Hello, world!</title>
  </head>
<body>

    <%@include file="./layout/header.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <%@include file="./layout/nav.jsp" %>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          	
            <h1 class="h2">Dashboard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">Share</button>
                <button class="btn btn-sm btn-outline-secondary">Export</button>
              </div>
              <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
            </div>
          </div>

		<div class="row">
			<div class="col main-dash-box">
			</div>
			<div class="col main-dash-box">
			</div>
			<div class="col main-dash-box">
			</div>
			<div class="col main-dash-box">
			</div>
			<div class="col main-dash-box">
			</div>
			
		</div>
          <canvas class="my-4" id="myChart" width="900" height="380"></canvas>
        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
      <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
    		$(document).ready(function () {
    			var chartdata = '';
    			
			$.ajax({
				url : 'AdminControl',
				data : { command : 'mainChart' },
				method : 'POST',
				success : function (data) {
					chartdata = JSON.parse(data);
					
					var dashbox = $('div.main-dash-box');
					dashbox[0].innerText = chartdata.counts.animalCount;
					dashbox[1].innerText = chartdata.counts.afterCount;
					dashbox[2].innerText = chartdata.counts.commuCount;
					dashbox[3].innerText = chartdata.counts.completeCount;
					dashbox[4].innerText = chartdata.counts.userCount;
					
					var labels = [];
					var dateCounts = [];
					for(var i=0; i<chartdata.days.length; i++){
						labels[i] = chartdata.days[i].date;
						dateCounts[i] = chartdata.days[i].count;
					}
					
					
					var ctx = document.getElementById("myChart");
				      var myChart = new Chart(ctx, {
				        type: 'line',
				        data: {
				          labels: labels,
				          datasets: [{
				            data: dateCounts,
				            lineTension: 0,
				            backgroundColor: 'transparent',
				            borderColor: '#007bff',
				            borderWidth: 5,
				            pointBackgroundColor: '#007bff'
				          }]
				        },
				        options: {
				          scales: {
				            yAxes: [{
				              ticks: {
				                beginAtZero: false
				              }
				            }]
				          },
				          legend: {
				            display: false,
				          }
				        }
				      });
				}
			})		
		});
    </script>
  </body>
  
</html>