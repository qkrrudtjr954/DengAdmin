<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="./css/dashboard.css" rel="stylesheet">
<title>Hello, world!</title>
</head>
<body>
	<%@include file="./layout/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<%@include file="./layout/nav.jsp"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<h1 class="h2">Badword Dictionary</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<button class="btn btn-sm btn-outline-secondary">Share</button>
						<button class="btn btn-sm btn-outline-secondary">Export</button>
					</div>
					<button class="btn btn-sm btn-outline-secondary dropdown-toggle">
						<span data-feather="calendar"></span> This week
					</button>
				</div>
			</div>
			
			<div class="row">
				<div class="offset-md-3 col-md-6">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="나쁜말을 사전에 추가하세요." id="badText">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" id="addBadWord">등록하기</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="table-responsive offset-md-3 col-md-6" style="border: 1px solid lightgray;padding:15px;">
					<table class="table table-dark table-striped table-sm" id="myTable" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>Word</th>
								<th>Delete</th>
								<th>Check</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-4" style="background: red; style="border: 1px solid lightgray;padding:15px;">
					<table class="table table-dark table-striped table-sm" id="animalTable" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>User</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				
				<div class="col-md-4" style="background: red; style="border: 1px solid lightgray;padding:15px;">
					<table class="table table-dark table-striped table-sm" id="afterTable" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>User</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				
				<div class="col-md-4" style="background: red; style="border: 1px solid lightgray;padding:15px;">
					<table class="table table-dark table-striped table-sm" id="commuTable" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>User</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				
			</div>
			</main>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
      feather.replace()
    </script>
    
    <script type="text/javascript">
	$(document).ready(function() {
		drawTable();
	});
	
	function drawTable() {
		$.ajax({
			url : 'AdminControl',
			method : 'POST',
			data : { command : 'getBadWords' },
			success : function (data) {
				
				var badwords = JSON.parse(data);
				
				var data = [];
				for(var i=0; i < badwords.length; i++){
					var badword=[];
					badword[0] = i+1;
					badword[1] = badwords[i].word;
					badword[2] = '<button class="btn btn-outline-danger" id="btn'+badwords[i].seq+'" onclick="deleteBadWordList('+badwords[i].seq+')">삭제하기</button>'
					badword[3] = '<button class="btn btn-outline-primary" onclick="drawEtcTable(\''+badwords[i].word+'\')">리스트</button>'
					
					
					data[i] = badword;
				}
				
				
				$('#myTable').DataTable({
					"order": [[ 0, "asc" ]],
					"data" : data
				});
				
			}
		})
	}
	
	
	
	$('#addBadWord').on('click', function () {
		if($('#badText').val() == ''){
			$('#badText').focus();
		} else {
			$.ajax({
				url : 'AdminControl',
				data : {command: 'addBadWord', word : $('#badText').val() },
				method : 'POST',
				success : function (data) {
					if(data == 'true'){
						$('#myTable').DataTable().destroy();
						drawTable();						
					}
				}
			})
		}
	})

	function deleteBadWordList(seq) {
		$.ajax({
			url : 'AdminControl',
			data : {command : 'deleteBadWord', seq : seq},
			method : 'POST',
			success : function (data) {
				if(data == 'true'){
					$('#myTable').DataTable().destroy();
					drawTable();
				}
			}
		})
	}
	
	function drawEtcTable(badword) {
		$.ajax({
			url : 'AdminControl',
			data : { command : 'getEtcTable', badword : badword },
			method : 'POST',
			success : function (data) {
				var test = JSON.parse(data);
			}
		})
	}
	</script>
</body>

</html>