<%@page import="dto.CommuBbsDto"%>
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
				<h1 class="h2">commu Detail</h1>
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
			<%
				CommuBbsDto commuDto = (CommuBbsDto)request.getAttribute("commuDto");
				//System.out.println(commuDto.toString());
			%>
			<div class="table-responsive">
				<table border="1" id="myTable">
					<tr>
						<th>No.</th>
						<td>${commuDto.seq }</td>
					</tr>
					<tr>
						<th>Title.</th>
						<td>${commuDto.title }</td>
					</tr>
					<tr>
						<th>Pic1.</th>
						<td>${commuDto.pic1 }</td>
					</tr>
					<tr>
						<th>Target_user_seq.</th>
						<td>${commuDto.target_user_seq }</td>
					</tr>
					<tr>
						<th> Target_category.</th>
						<td>${commuDto. target_category }</td>
					</tr>
					<tr>
						<th>Readcount.</th>
						<td>${commuDto.readcount }</td>
					</tr>
					<tr>
						<th>Reg_date.</th>
						<td>${commuDto.reg_date }</td>
					</tr>
					<tr>
						<th>Last_update.</th>
						<td>${commuDto.last_update }</td>
					</tr>
					<tr>
						<th>Del.</th>
						<td>${commuDto.del }</td>
					</tr>
					<tr>
						<th>Category_name.</th>
						<td>${commuDto.category_name }</td>
					</tr>
					<tr>
						<th>User_email.</th>
						<td>${commuDto.user_email }</td>
					</tr>
					<tr>
						<th>Content.</th>
						<td>${commuDto.content }</td>
					</tr>
					
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

</body>

</html>