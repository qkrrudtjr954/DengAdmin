<%@page import="dto.User"%>
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
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<h1 class="h2">User Detail</h1>
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
			<div class="d-flex">
				<div class="p-3">
					<h3>${userDto.email }</h3>의 정보 
					<%-- <button class="btn btn-outline-danger" onclick="forceDelete(${userDto.seq })">관리자 권한 삭제</button> --%>
				</div>
				<div class="ml-auto p-3">					
					<fmt:parseDate value="${userDto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
					<fmt:formatDate value="${tempRegDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" var="regDate"/>
					<p>
						${regDate }<br>
					</p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="table-responsive offset-md-2 col-md-8">
					<table border="1" id="myTable" class="table table-striped">
						<tr>
							<th>No.</th>
							<td>${userDto.seq }</td>
						</tr>
						<tr>
							<th>Email.</th>
							<td>${userDto.email }</td>
						</tr>
						<tr>
							<th> Reg_date.</th>
							<td>${userDto. reg_date }</td>
						</tr>
						<tr>
							<th>Last_update.</th>
							<td>${userDto.last_update }</td>
						</tr>
						<tr>
							<th>Author.</th>
							<td>${userDto.author }</td>
						</tr>
					</table>
				</div>
			</div>
			
			
			<div class="row" style="margin-top: 50px;">
				<div class="col-md-1">
					<img src = "./image/heart.png" alt="" width="50px" height="50px">
				</div>
				<div class="col">
					<h4>${userDto.email } 님이 좋아하는 게시글 </h4>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-4">
					<h4>Animal Bbs</h4>
					<table id="animalTable" class="table table-dark">
						<thead>
							<tr>
								<th><img src = "./image/heart.png" alt="" width="20px" height="20px">No.</th>
								<th>Title.</th>
								<th>Move.</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<h4>After Bbs</h4>
					<table id="afterTable" class="table table-dark">
						<thead>
							<tr>
								<th><img src = "./image/heart.png" alt="" width="20px" height="20px">No.</th>
								<th>Title.</th>
								<th>Move.</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<h4>Community Bbs</h4>
					<table id="commuTable" class="table table-dark">
						<thead>
							<tr>
								<th><img src = "./image/heart.png" alt="" width="20px" height="20px">No.</th>
								<th>Title.</th>
								<th>Move.</th>
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
			data : { command : 'getLikedTable', seq : ${userDto.seq} },
			success : function (data) {
				var datas = JSON.parse(data);
				
				var animal = datas[0];
				var after = datas[1];
				var commu = datas[2];
				
				drawTableWithData(animal, 1);
				drawTableWithData(after, 2);
				drawTableWithData(commu, 3);
			}
		})
	}
	
	
	function drawTableWithData(datas, type) {
		var url = '';
		var table = '';
		
		if(type == 1){
			url = 'AdminControl?command=animalDetail&seq=';
			table = 'animalTable';
		}else if (type == 2){
			url = 'AdminControl?command=afterDetail&seq=';
			table = 'afterTable';
		}else if(type == 3){
			url = 'AdminControl?command=commuDetail&seq=';
			table = 'commuTable';
		}
		
		var result = [];
		for(var i=0; i<datas.length; i++){
			var temp = [];
			temp[0] = i+1;
			temp[1] = datas[i].title;
			temp[2] = '<a class="btn btn-outline-primary" href="'+url+datas[i].seq+'">상세보기</a>'
			
			result[i] = temp;
		}
		
		$('#'+table).DataTable().destroy();
		$('#'+table).DataTable({
			"order": [[ 0, "asc" ]],
			"columns" : [{width: '5%'},{width: '80%'},{width: '15%'}],
			"data" : result
		});
	}
	</script>
</body>

</html>