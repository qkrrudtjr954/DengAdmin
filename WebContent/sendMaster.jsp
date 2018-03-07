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
				<h1 class="h2">User Inquiry</h1>
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


			<div class="table-responsive">
				<table class="table table-striped table-sm" id="myTable">
					<thead>
						<tr>
							<th>No.</th>
							<th>Category</th>
							<th>User</th>
							<th>Title</th>
							<th>Reg Date</th>
							<th>Status</th>
							<th>Answer</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
			</main>
		</div>
	</div>

	<div class="modal" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">답변 하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="inquiry-title">Title</label> 
						<input type="text" class="form-control" id="inquiry-title" readonly="readonly">
					</div>					
					<div class="form-group">
						<label for="user-email">Email</label> 
						<input type="text" class="form-control" id="inquiry-email" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="inquiry-content">Content</label>
						<textarea class="form-control" id="inquiry-content" rows="3" readonly="readonly"></textarea>
					</div>
					<div class="form-group">
						<label for="inquiry-content">Response</label>
						<textarea class="form-control" id="inquiry-response" rows="3"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="answerBtn">답변 하기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
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
			url: 'AdminControl',
			data : { command : 'getInquiries' },
			method : 'POST', 
			success : function (data) {
				var inquiries = JSON.parse(data);
		
				var data = [	];
				for(var i=0; i < inquiries.length; i++) {
					var temp = [];
					temp[0] = i+1;
					temp[1] = inquiries[i].category;
					temp[2] = '<a href="AdminControl?command=userDetail&seq='+inquiries[i].target_user_seq+'">'+inquiries[i].email+'</a>';
					temp[3] = inquiries[i].title;
					temp[4] = changeDay(inquiries[i].reg_date);
					temp[5] = (inquiries[i].complete == 0) ?'<span data-feather="thumbs-down" style="color:red;"></span>' :  '<span data-feather="thumbs-up" style="color:green"></span>';
					temp[6] = (inquiries[i].complete == 0) ?'<button class="btn btn-sm btn-primary" onclick="answer('+inquiries[i].seq+')">답변 하기</button>' : '<button class="btn btn-sm btn-outline-primary" onclick="cancel('+inquiries[i].seq+', '+inquiries[i].complete+')">완료 취소</button>' ;
					
					data[i] = temp;
				}
				
				$('#myTable').DataTable().rows.add(data).draw();
				
				feather.replace();
			}
		});
	}
	
	function changeDay(date) {
		var temp = new Date(date);
		return temp.getFullYear()+'년 '+(temp.getMonth()+1)+'월 '+temp.getDate()+'일';
	}
	
	function answer(seq) {
		$('#myModal').modal();
		$.ajax({
			url : 'AdminControl', 
			data : {command : 'getInquiry', seq : seq},
			method : 'POST',
			success : function (data) {
				var inquiry = JSON.parse(data);
				
				$('#inquiry-title').val(inquiry.title);
				$('#inquiry-content').val(inquiry.content);
				$('#inquiry-email').val(inquiry.email);
				$('#answerBtn').attr('onclick', 'addAnswer('+seq+')');	
			}
		})
	}
	
	function addAnswer(seq) {
		$.ajax({
			url : 'AdminControl',
			data : {command : 'addInquiry', seq : seq, content : $('#inquiry-response').val()},
			method : 'POST',
			success : function (data) {
				if(data == 'true'){
					alert('답변이 완료되었습니다.');
				
					$('input[data-dismiss="modal"]').click();
					$('#myTable').DataTable().clear().draw();
					drawTable();
				} else {
					alert('작업을 완료할 수 없습니다. 다시 시도해주세요.');
				}
			}
		})
	}
	function cancel(seq, complete) {
		$.ajax({
			url : 'AdminControl',
			data : {command : 'changeComplete', seq : seq },
			method : 'POST',
			success : function (data) {
				if(data == 'true'){
					alert('정상적으로 완료되었습니다.');
				
					$('input[data-dismiss="modal"]').click();
					$('#myTable').DataTable().clear().draw();
					drawTable();
				} else {
					alert('작업을 완료할 수 없습니다. 다시 시도해주세요.');
				}
			}
		})
	}

	</script>
</body>

</html>