<%@page import="dto.AfterBbsDto"%>
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
				<h1 class="h2">after Detail</h1>
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
						<h3>${afterDto.user_email }</h3>
						<button class="btn btn-outline-danger" onclick="forceDelete(${afterDto.seq })">관리자 권한 삭제</button>
					</div>
					<div class="ml-auto p-3">					
						<fmt:parseDate value="${afterDto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
						<fmt:formatDate value="${tempRegDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" var="regDate"/>
						<p>
							${regDate }<br>
							조회수 : ${afterDto.read_count }
						</p>
					</div>
				</div>
			<hr>
			<div class="row">				
			<div class="table-responsive col-md-8">
				<table border="1" id="myTable" class="table table-striped">
					<tr>
						<th>No.</th>
						<td>${afterDto.seq }</td>
					</tr>
					<tr>
						<th>Title.</th>
						<td>${afterDto.title }</td>
					</tr>
					<tr>
						<th>Pic1.</th>
						<td>${afterDto.pic1 }</td>
					</tr>
					<tr>
						<th>UserDetail</th>
						<td><a href="AdminControl?command=userDetail&seq=${afterDto.target_user_seq }">유저 정보 보기</a></td>
					</tr>
					<tr>
						<th>Del.</th>
						<td>
						<c:choose>
							<c:when test="${afterDto.del ==0 }">
								<span data-feather="thumbs-up" style="color: green;"></span> 게시중 
							</c:when>
							
							<c:when test="${afterDto.del ==1 }">
								<span data-feather="x-circle" style="color:red;"></span> 삭제됨 
							</c:when>
							
							<c:when test="${afterDto.del ==2 }">
								<span data-feather="user-x" style="color:red;"></span> 관리자에 의해 삭제됨 
							</c:when>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>Content.</th>
						<td>${afterDto.content }</td>
					</tr>
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
		
		function forceDelete(seq) {
			$.ajax({
				url : 'AdminControl',
				data : {command : 'afterDelete', seq : seq },
				method : 'POST',
				success : function (data) {
					if(data == 'true'){
						location.reload();
					} else {
						alert('삭제를 할 수 없습니다.');
					}
				}
			})
		}
	</script>
</body>

</html>