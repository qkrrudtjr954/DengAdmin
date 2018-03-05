<%@ page pageEncoding="UTF-8"%>

<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<div class="sidebar-sticky">
		<ul class="nav flex-column">
			<li class="nav-item">
				<a class="nav-link active" href="AdminControl?command=main"> 
					<span data-feather="home"></span> Dashboard <span class="sr-only">(current)</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="AdminControl?command=animalList"> 
					<span data-feather="file"></span> 분양글 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="AdminControl?command=afterList"> 
					<span data-feather="shopping-cart"></span> 분양 완료 글 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="AdminControl?command=userList"> 
					<span data-feather="users"></span> 사용자 전부 보기
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="AdminControl?command=badWord"> 
					<span data-feather="bar-chart-2"></span> 나쁜말 사전
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