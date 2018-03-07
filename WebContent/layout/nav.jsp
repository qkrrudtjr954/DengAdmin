<%@ page pageEncoding="UTF-8"%>

<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<div class="sidebar-sticky">
		<ul class="nav flex-column">
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=main" id="main"> 
					<span data-feather="home"></span> Dashboard <span class="sr-only">(current)</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=animalList" id="animalList"> 
					<span data-feather="github"></span> 분양글 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=afterList" id="afterList"> 
					<span data-feather="heart"></span> 분양 완료 글 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=commuList" id="commuList"> 
					<span data-feather="message-circle"></span> 커뮤니티 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=userList" id="userList"> 
					<span data-feather="users"></span> 사용자 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link menu-link" href="AdminControl?command=badWord" id="badWord"> 
					<span data-feather="book"></span> 나쁜말 사전
				</a>
			</li>
			<li class="nav-item menu-link">
				<a class="nav-link" href="AdminControl?command=calendar" id="calendar"> 
					<span data-feather="calendar"></span> 행사 일정 등록 
				</a>
			</li>
			<li class="nav-item menu-link">
				<a class="nav-link" href="AdminControl?command=category" id="category"> 
					<span data-feather="align-center"></span> 게시판 메뉴 등록 
				</a>
			</li>
		</ul>

		<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Saved reports</span> 
			<a class="d-flex align-items-center text-muted" href="#"> 
				<span data-feather="plus-circle"></span>
			</a>
		</h6>
		
		<ul class="nav flex-column mb-2">
			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<span data-feather="file-text"></span> Current month
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<span data-feather="file-text"></span> Last quarter
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<span data-feather="file-text"></span> Social engagement
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<span data-feather="file-text"></span> Year-end sale
				</a>
			</li>
		</ul>
	</div>
</nav>


<script type="text/javascript">
	var temp = '<%=request.getParameter("command") %>';
	var command = (temp == 'null' || temp == '') ? 'main' : temp;
	
	var elements = document.getElements
	var element = document.getElementById(command);
    element.classList.add("active");
</script>