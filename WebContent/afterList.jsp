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
				<h1 class="h2">After List</h1>
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
							<th>Title</th>
							<th>User</th>
							<th>Reg Date</th>
							<th>Detail</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${afterList }" varStatus="i" var="item">
							<tr>
								<td>${i.index+1 }</td>
								<td>${item.title }</td>
								<td>${item.user_email }</td>
								<fmt:parseDate value="${item.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
								<fmt:formatDate value="${tempRegDate }" pattern="yyyy년 MM월 dd일" var="regDate"/>
								<td>${regDate }</td>
								<td>
									<a href="AdminControl?command=afterDetail&seq=${item.seq }" class="btn btn-outline-secondary">상세 보기</a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
        $('#myTable').DataTable( {
	            "order": [[ 0, "asc" ]]
	        } );
	    } );
    </script>
</body>

</html>