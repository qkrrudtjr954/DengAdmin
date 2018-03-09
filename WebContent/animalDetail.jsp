<%@page import="dto.AnimalBbsDto"%>
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
					<h1 class="h2">Animal Detail</h1>
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
						<h3>${animalDto.user_email }</h3>
						<button class="btn btn-outline-danger" onclick="forceDelete(${animalDto.seq })">관리자 권한 삭제</button>
					</div>
					<div class="ml-auto p-3">					
						<fmt:parseDate value="${animalDto.reg_date }" pattern="yyyy-MM-dd HH:mm:ss.S" var="tempRegDate"/>
						<fmt:formatDate value="${tempRegDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" var="regDate"/>
						<p>
							${regDate }<br>
							조회수 : ${animalDto.readcount }
						</p>
					</div>
				</div>
				
				
				<hr>
				<div class="row">				
				<div class="table-responsive col-md-8">
					<h4>게시글 상세 정보</h4>
					<span>( 진행 상태 : ${animalDto.del == 200 ? '<span data-feather="thumbs-up" style="color:green"></span> 분양 완료 ' : '<span data-feather="thumbs-down" style="color:red;"></span> 분양 진행중 ' } )</span>
					<hr>
					<table border="1" id="myTable" class="table table-striped">
						<tr>
							<th>No.</th>
							<td>${animalDto.seq }</td>
						</tr>
						<tr>
							<th>Title.</th>
							<td>${animalDto.title }</td>
						</tr>
						<tr>
							<th>Name.</th>
							<td>${animalDto.name }</td>
						</tr>
						<tr>
							<th>Age.</th>
							<td>${animalDto.age }</td>
						</tr>
						<tr>
							<th>Kinds.</th>
							<td>${animalDto.kinds }</td>
						</tr>
						<tr>
							<th>Type.</th>
							<td>${animalDto.type }</td>
						</tr>
						<tr>
							<th>State.</th>
							<td>
							<c:choose>
								<c:when test="${animalDto.del ==200 }">
									<span data-feather="thumbs-up" style="color:green"></span> 분양 완료
								</c:when>
								
								<c:when test="${animalDto.del ==0 }">
									<span data-feather="thumbs-down" style="color: orange;"></span> 분양 진행중
								</c:when>
								
								<c:when test="${animalDto.del ==1 }">
									<span data-feather="x-circle" style="color:red;"></span> 삭제됨 
								</c:when>
								
								<c:when test="${animalDto.del ==2 }">
									<span data-feather="user-x" style="color:red;"></span> 관리자에 의해 삭제됨 
								</c:when>
							</c:choose>
							</td>
						</tr>				
						<tr>
							<th>Medicine.</th>
							<td>
							<c:choose>
								<c:when test="${animalDto.medicine ==1 }">
									<span style="color:green">예방 접종 진행함</span>
								</c:when>
								
								<c:when test="${animalDto.medicine ==0 }">
									<span style="color: orange;">예방 접종 진행 안함</span> 
								</c:when>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th>Neutralization.</th>
							<td>
							<c:choose>
								<c:when test="${animalDto.neutralization ==1 }">
									<span style="color:green">중성화 진행함</span>
								</c:when>
								
								<c:when test="${animalDto.neutralization ==0 }">
									<span style="color: orange;">중성화 진행 안함</span> 
								</c:when>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th>Gender.</th>
							<td>
							<c:choose>
								<c:when test="${animalDto.gender ==1 }">
									<span style="color:blue">수컷 </span>
								</c:when>
								
								<c:when test="${animalDto.gender ==0 }">
									<span style="color:pink;">암컷</span> 
								</c:when>
							</c:choose>
							</td>
						</tr>
						<tr>
							<th>Descripttion.</th>
							<td>${animalDto.descripttion }</td>
						</tr>
						<tr>
							<th>UserDetail</th>
							<td><a href="AdminControl?command=userDetail&seq=${animalDto.userSeq }">유저 정보 보기</a></td>
						</tr>
						<tr>
							<th>Contact.</th>
							<td>${animalDto.contact }</td>
						</tr>
						<tr>
							<th>Description.</th>
							<td>${animalDto.description }</td>
						</tr>
						<tr>
							<th>Last_update.</th>
							<td>${animalDto.last_update }</td>
						</tr>
						
						<tr>
							<th>Content.</th>
							<td>${animalDto.content }</td>
						</tr>
					
					</table>
				</div>
				<div class="col-md-4">
					<div class="map-title">
						<h4>약속 장소 정보</h4>
						<span>${animalDto.location }</span> 
					</div>
					<hr>
					<div class="map-content">
						<div id="map" style="height: 500px;"></div>
					</div>
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
    <!-- daum post code api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${initParam.DAUM_API_KEY }&libraries=services"></script>
	
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    
    <script>
	    function drawMap(addr) {
		    var mapContainer = document.getElementById('map');
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        /* 
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">hello</div>'
			        });
			        infowindow.open(map, marker);
			 		*/
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			drawMap('${animalDto.location}');
		});
		
		function forceDelete(seq) {
			$.ajax({
				url : 'AdminControl',
				data : {command : 'animalDelete', seq : seq },
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