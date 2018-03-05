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
          <!-- <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          	
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
          </div> -->

		<div class="row dash-container">
			<div class="col main-dash-box">
				<div class="dash-title">
					Animal BBS
				</div>
				<div class="dash-content">
				
				</div>
			</div>
			<div class="col main-dash-box">
				<div class="dash-title">
					After BBS
				</div>
				<div class="dash-content">
				
				</div>
			</div>
			<div class="col main-dash-box">
				<div class="dash-title">
					Community BBS
				</div>
				<div class="dash-content">
				
				</div>
			</div>
			<div class="col main-dash-box">
				<div class="dash-title">
					Completed
				</div>
				<div class="dash-content">
				
				</div>
			</div>
			<div class="col main-dash-box">
				<div class="dash-title">
					Users
				</div>
				<div class="dash-content">
				
				</div>
			</div>
		</div>
		
		<hr>
		
		<div class="row justify-content-between chart-container">
			<div class="col-md-3">
				<h4>기간별 게시글 Report</h4>
			</div>
			
			<div class="dropdown">
				<button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span data-feather="database"></span>&nbsp;&nbsp;게시판 선택
				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#" onclick="changeAnimalBbs()">분양글</a> 
					<a class="dropdown-item" href="#" onclick="changeAfterBbs()">분양 후기</a> 
					<a class="dropdown-item" href="#" onclick="changeCommuBbs()">커뮤니티</a>
				</div>
			</div>
		</div>
		<canvas class="my-4" id="myChart" width="900" height="380"></canvas>
        </main>
      </div>
    </div>

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
    			drowInfo();
    			changeAnimalBbs();
		});
    		
    		function drowInfo() {
			$.ajax({
				url : 'AdminControl',
				method : 'POST',
				data : { command: 'drowInfo' },
				success : function (data) {
					var info = JSON.parse(data);
					var dashbox = $('div.main-dash-box div.dash-content');
					
					dashbox[0].innerText = info.animalCount;
					dashbox[1].innerText = info.afterCount;
					dashbox[2].innerText = info.commuCount;
					dashbox[3].innerText = info.completeCount;
					dashbox[4].innerText = info.userCount;
				}
			})
		}
    		
    		function changeAnimalBbs() {
			drowChart('animalbbs');
		}
    		
    		function changeAfterBbs() {
			drowChart('afterbbs');	
		}
    		
    		function changeCommuBbs() {
			drowChart('commubbs');
		}
    		
    		function drowChart(table) {
    			$.ajax({
    				url : 'AdminControl',
    				data : { command : 'drowChart', table : table },
    				method : 'POST',
    				success : function (data) {
    					var chartdata = JSON.parse(data);
    					
    					var labels = [];
    					var dateCounts = [];
    					for(var i=0; i<chartdata.length; i++){
    						labels[i] = chartdata[i].date;
    						dateCounts[i] = chartdata[i].count;
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
							legend:{
								display:false,
							}
						}
					});
    				}
    			});
		}
</script>
</body>

</html>