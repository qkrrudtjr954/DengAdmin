<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.css' />
	<link href="./css/dashboard.css" rel="stylesheet">
    <title>Hello, world!</title>
  </head>
<body>

    <%@include file="./layout/header.jsp" %>

    <div class="container-fluid">
    		
		<div class="row">
			<%@include file="./layout/nav.jsp"%>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
				<c:choose>
					<c:when test="${cookies.notice.value eq 'addsuccess' }">
						<div class="alert alert-primary" role="alert">
							일정이 등록 되었습니다. 
						</div>
					</c:when>
					<c:when test="${cookies.notice.value eq 'addfail' }">
						<div class="alert alert-primary" role="alert">
							일정을 등록할 수 없습니다. 
						</div>
					</c:when>
					
					
				</c:choose>
				
				<div id="calendar-area"></div>
				
				<div class="modal" tabindex="-1" role="dialog" id="addEvent">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">일정 등록하기</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="AdminControl" method="POST">
								<div class="modal-body">
									<input type="hidden" name="command" value="addEvent">
									<div class="row">
										<div class="col"> 행사 제목 </div>
									</div>
									<div class="row ">
										<div class="col">
											<input type="text" class="form-control" name="title">
										</div>
									</div>
									
									<br>
									
									<div class="row">
										<div class="col"> 행사 일정 </div>
									</div>
									<div class="row">
										<div class="col">
											<input type="text" class="form-control" readonly id="start" name="start_date">
										</div>
										
										<div class="col">
											<input type="text" class="form-control" readonly id="end" name="end_date">
										</div>
									</div>
									
									<br>
									
									<div class="row">
										<div class="col"> 행사 내용 </div>
									</div>
									<div class="row ">
										<div class="col">
											<textarea name="content" rows="5" class="form-control" style="width: 100%;"></textarea>
										</div>
									</div>
									
									<br>
									
									<div class="row">
										<div class="col"> 행사 장소 </div>
									</div>
									<div class="row justify-content-between">
										<div class="col-8">
											<input type="text" class="form-control" name="location" id="roadAddress" placeholder="도로명주소" readonly> 
										</div>
										<div class="col">
											<input type="button" class="btn btn-primary" onclick="execDaumPostcode()" value="우편번호 찾기"> 
										</div>
									</div>
									<div class="row" style="margin-top:10px;">
										<div id="map"></div>
										<span id="guide" style="color: #999"></span>
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-primary" value="일정 등록하기">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="modal" tabindex="-1" role="dialog" id="showEvent">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title show-event-title"></h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body show-event-body">
								<div class="show-event-range">
									<div class="col">
										<span id="start2"></span>
									</div>
									<div class="col">
										<span id="end2"></span>
									</div>
								</div>
								<div class="show-event-location"></div>
								<div class="show-event-content"></div>
								<div id="map2"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="deleteEvent" >일정 삭제</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- fullcalendar and moment javascript -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.2/fullcalendar.min.js'></script>

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
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('roadAddress').value = fullRoadAddr;
	                
	                
	                
	                //	지도 그리기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	                	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	                	$('#map').css('width', '100%');
	                	$('#map').css('height', '350px');
	                drowMap(fullRoadAddr, mapContainer);
					//	지도 그리기~~~~~~~~~~~~~~~
	                
	                
	
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	
	                } else {
	                    document.getElementById('guide').innerHTML = '';
	                }
	            }
	        }).open();
	    }
	    
	    
	    function drowMap(addr, mapContainer) {
		    
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
	
		$(document).ready(function() {
			
		    drawCalendar();
			
		});
		
		function drawCalendar() {
			$.ajax({
				url : 'AdminControl',
				data : { command : 'getEvents' },
				method : 'POST',
				success : function (data) {
					var events = [];
					var temp = JSON.parse(data);
					
					for(var i=0; i<temp.length; i++){
						var obj = {};
						obj.title = temp[i].title;
						obj.start = temp[i].start;
						obj.end = temp[i].end;
						obj.target = temp[i].seq;
						
						events[i] = obj;
					}
					
					$('#calendar-area').fullCalendar({
					    events: events,
					    selectable: true,
					    select: function (start, end, jsEvent, view) {
							//	modal
							$('#addEvent').on('show.bs.modal', function () {
								$('#start').val(start.format());
								$('#end').val(end.format());
							});
							
							$('#addEvent').modal();
						},
						eventClick: function(calEvent, jsEvent, view) {
							showEvent(calEvent.target);
						}
				    })
				}
			})
		}
		
		function showEvent(target) {
			$.ajax({
				url : 'AdminControl',
				method : 'POST',
				data : { command : 'getEvent', target : target},
				success : function (data) {
					var event = JSON.parse(data);
					$('#showEvent').modal();
					$('.show-event-title').html(event.title);
					$('#start2').html(event.start);
					$('#end2').html(event.end);
					$('.show-event-location').html(event.location);
					$('.show-event-content').html(event.content);
					$('button#deleteEvent').attr('onclick', 'deleteEvent('+event.seq+')');
					
					var mapContainer = document.getElementById('map2');
					$('#map2').css('width', '100%');
					$('#map2').css('height', '350px');
					drowMap(event.location, mapContainer);
				}
			})
		}
		
		function deleteEvent(seq) {
			if(confirm('정말 삭제하겠습니까?')){
				$.ajax({
					url: 'deleteEvent',
					data : { seq : seq },
					method : 'GET',
					success : function (data) {
						if(data =='true'){
							alert('삭제 되었습니다. ');
						}else {						
							alert('삭제할 수 없습니다. ');
						}
						drawCalendar();
					}
				})
			}
		}
		 
		</script>
</body>

</html>