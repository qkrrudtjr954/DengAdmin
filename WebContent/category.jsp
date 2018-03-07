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
				<h1 class="h2">Category</h1>
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
			
			<div class="alert col-md-12" id="alertDiv" style="display:none;"></div>
			<div class="row">
				<div class="table-responsive col-md-7">
					<table class="table table-striped table-sm" id="myTable" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>Title</th>
								<th>Status</th>
								<th>Description</th>
								<th>Reg Date</th>
								<th>Change Status</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="col-md-4">
					<form id="categoryForm" onsubmit="return false">
						<input type="hidden" name="command" value="addCategory">
						<div class="form-group">
							<label for="category-title">Title</label> 
							<input type="text" name="title" class="form-control" id="category-title" placeholder="Category Title">
						</div>

						<label for="category-status">Status</label>							
						<div class="form-group" style="text-align:center;">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="status" id="status1" value="200" checked> 
								<label class="form-check-label" for="status1"> Active </label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="status" id="status2" value="404"> 
								<label class="form-check-label" for="status2"> Non Active </label>
							</div>
						</div>
						<div class="form-group">
							<label for="category-description">Descripttion</label>
							<textarea class="form-control" name="description" id="category-description" rows="3"></textarea>
						</div>
						<div class="form-group">
							<button class="btn btn-outline-primary" id="addCategory" style="width:100%">카테고리 추가하기</button>
						</div>
					</form>
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
    <script type="text/javascript">
    $(document).ready(function() {
    		drawTable();
    });
    
    function drawTable() {
		$.ajax({
			url: 'AdminControl',
			data : { command : 'getCategories' },
			method : 'POST', 
			success : function (data) {
				var categories = JSON.parse(data);
				
				var data = [	];
				for(var i=0; i < categories.length; i++) {
					var temp = [];
					temp[0] = i+1;
					temp[1] = categories[i].title;
					temp[2] = (categories[i].status == 200) ? '<span data-feather="thumbs-up" style="color:green"></span>' : '<span data-feather="thumbs-down" style="color:red;"></span>';
					temp[3] = categories[i].description
					temp[4] = changeDay(categories[i].reg_date);
					temp[5] = '<button class="btn btn-sm btn-primary" onclick="changeStatus('+categories[i].seq+', '+categories[i].status+')">상태 변경</button>';
					temp[6] = '<button class="btn btn-sm btn-danger" onclick="deleteCategory('+categories[i].seq+')">X</button>';
					
					data[i] = temp;
				}
				
				$('#myTable').DataTable().rows.add(data).draw();
				
				feather.replace()
			}
		});
	}
    
    function changeDay(date) {
		var temp = new Date(date);
		return temp.getFullYear()+'년 '+(temp.getMonth()+1)+'월 '+temp.getDate()+'일';
	}
    
    function changeStatus(seq, status) {
		$.ajax({
			url: 'AdminControl',
			data : { command : 'changeState', seq : seq, status : status},
			method : 'POST', 
			success : function (data) {
				var result = JSON.parse(data);
				
				if(result){
					if($('#alertDiv').hasClass('alert-danger')){
						$('#alertDiv').removeClass('alert-danger');
					}
					$('#alertDiv').addClass('alert-success');
					$('#alertDiv').html('상태가 변경되었습니다.');
				} else {
					if($('#alertDiv').hasClass('alert-success')){
						$('#alertDiv').removeClass('alert-success');
					}
					$('#alertDiv').addClass('alert-danger');
					$('#alertDiv').html('상태가 변경할 수 없습니다.');
				}
				$('#alertDiv').css('display', 'block');
				
				$('#category-title').val('');
				$('#category-discription').val('');
				$('#myTable').DataTable().clear().draw();
				drawTable();
			}
		})
	}
    function deleteCategory(seq) {
		$.ajax({
			url: 'AdminControl',
			data : { command : 'deleteCategory', seq : seq },
			method : 'POST', 
			success : function (data) {
				var result = JSON.parse(data);
				
				if(result){
					if($('#alertDiv').hasClass('alert-danger')){
						$('#alertDiv').removeClass('alert-danger');
					}
					$('#alertDiv').addClass('alert-success');
					$('#alertDiv').html('삭제 되었습니다.');
				} else {
					if($('#alertDiv').hasClass('alert-success')){
						$('#alertDiv').removeClass('alert-success');
					}
					$('#alertDiv').addClass('alert-danger');
					$('#alertDiv').html('삭제할 수 없습니다.');
				}
				$('#alertDiv').css('display', 'block');
				$('#myTable').DataTable().clear().draw();
				drawTable();
			}
		})
	}
    
    $('#addCategory').on('click', function () {
    		var FormData = $('#categoryForm').serialize();
		$.ajax({
			url : 'AdminControl',
			data : FormData,
			method : 'POST',
			success : function (data) {
				var result = JSON.parse(data);
				
				if(result){
					if($('#alertDiv').hasClass('alert-danger')){
						$('#alertDiv').removeClass('alert-danger');
					}
					$('#alertDiv').addClass('alert-success');
					$('#alertDiv').html('상태가 변경되었습니다.');
				} else {
					if($('#alertDiv').hasClass('alert-success')){
						$('#alertDiv').removeClass('alert-success');
					}
					$('#alertDiv').addClass('alert-danger');
					$('#alertDiv').html('상태가 변경할 수 없습니다.');
				}
				$('#alertDiv').css('display', 'block');
				
				$('#myTable').DataTable().clear().draw();
				drawTable();
			}
		})
	})
    </script>
</body>

</html>