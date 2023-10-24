<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<link rel="stylesheet" href="/css/search-bar.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../resources/mainboard/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

<style>
body {
    		font-family: 'Nanum Gothic', sans-serif;
    	}

.card {
	box-shadow: 0 20px 27px 0 rgba(0, 0, 0, 0.05);
	padding-bottom:20px;

}

.avatar.sm {
	width: 2.25rem;
	height: 2.25rem;
	font-size: .818125rem;
}

.table-nowrap .table td, .table-nowrap .table th {
	white-space: nowrap;
}

.table>:not(caption)>*>* {
	padding: 0.75rem 1.25rem;
	border-bottom-width: 1px;
}

table th {
	font-weight: 600;
	background-color: #eeecfd !important;
}

.fa-arrow-up {
	color: #00CED1;
}

.fa-arrow-down {
	color: #FF00FF;
}

.hover-lift-light {
	transition: box-shadow .25s ease, transform .25s ease, color .25s ease,
		background-color .15s ease-in;
}

.text-decoration-none {
	text-decoration: none !important;
}

.py-4 {
	padding-top: 1.5rem !important;
	padding-bottom: 1.5rem !important;
}

.align-items-center {
	align-items: center !important;
}

.border-0 {
	border: 0 !important;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(30, 46, 80, .09);
	border-radius: 0.25rem;
}

.icon-circle {
	position: relative;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 3.2rem;
	height: 3.2rem;
	border-radius: 50%;
}

.bg-pastel-primary {
	background-color: #e9f3ff !important;
}

.mt-6 {
	margin-top: 4rem !important;
}

.mb-4 {
	margin-bottom: 1.5rem !important;
}

.badge {
	padding: 0.4rem 0.65rem 0.25rem;
}

.text-uppercase-bold-sm {
	text-transform: uppercase !important;
	font-weight: 500 !important;
	letter-spacing: 2px !important;
	font-size: .85rem !important;
}

.icon-circle[class*=text-] [fill]:not([fill=none]), .icon-circle[class*=text-] svg:not([fill=none]),
	.svg-icon[class*=text-] [fill]:not([fill=none]), .svg-icon[class*=text-] svg:not([fill=none])
	{
	fill: currentColor !important;
}

.shadow-sm {
	box-shadow: 0 .125rem .25rem rgba(35, 38, 45, .09) !important;
}

.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3),
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu)
	{
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.input-group-lg>.btn, .input-group-lg>.form-control, .input-group-lg>.form-select,
	.input-group-lg>.input-group-text {
	padding: 0.5rem 1rem;
	font-size: 1.25rem;
	border-radius: 0.3rem;
}

.input-group-text {
	display: flex;
	align-items: center;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #1f2c73;
	text-align: center;
	white-space: nowrap;
	background-color: #fff;
	border: 1px solid #dee2e6;
	border-radius: 0.25rem;
}

/* 추가된 스타일: 드롭다운 초기 숨김 */
.sub-row {
	display: none;
}

/* 추가된 스타일: 드롭다운 표시 스타일링 */
.main-row.open .sub-row {
	display: table-row;
	margin-left: 20px; /* 들여쓰기를 조절하기 위한 스타일 추가 */
}

/* 추가된 스타일: 상위 행 클릭 가능한 커서 스타일 */
.main-row {
	cursor: pointer;
}
h6{
 margin:auto;
 padding:auto;
}
</style>

</head>

<body>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
			<!-- / Menu -->
			<div class="layout-page">
				<!-- Navbar -->
				<jsp:include page="../mainboard/navbar.jsp"></jsp:include>
				<!-- / Navbar -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">
							<div class="col-lg-12 mb-4 order-0 welcome-message">
								<div class="container-fluid">
									<div class="card">
									<div class="card-body bookmark-list-card-body">
										<div
											style="display: flex; justify-content: space-between; align-items: center;">
											<h3 style="font-size: 27px; font-weight: 800; color: #555">북마크</h3>

											<div style="display: flex; align-items: center;">
												<img src="../resources/project/img/projectboard/search.svg"
													style="margin-right: 7px; height: 30px; opacity: 0.4;">
												<form name="bookmark-search-form" autocomplete="off"
													method="post">
													<div class="search-bookmark">
														<div class="search-area">
															<input type="text" class="bookmark-search"
																id="searchInput" name="searchText"
																placeholder="검색어를 입력하세요">
														</div>
													</div>
												</form>
											</div>
										</div>

										<div class="bookmarkList">
											<hr>
											<div class="search-title">
												<span class="search-result-title">전체 <span
													class="all-bookmark-count"></span>
												</span>
											</div>

											<div class="bookmark-area">
												<c:forEach var="bookmark" items="${bookmark}">
												  <ul class="myBookmarkContent">
													<li class="bookmark-search-item">
														<div class="fixed-kind">
														  <i class="icons-task">
														   ::before
														  </i>
														  <span class="bookmark-category">${bookmark.category}</span>
														 </div>
															<div class="search-text-wrap">
																<div class="contentTitle">
																  <p class="contents-tit">${bookmark.title}</p>
																</div>
																<p class="content-project">
																 <em class="project-name">${bookmark.projectName}</em></p>
															</div>
															<div class="bookmark-list-right">
															  <div class="bookmark-list-name">${bookmark.writer}</div>
															  <div class="bookmark-list-date">	 
														      <div class="recent-modify">
															<c:set var="timeDiff" value="${bookmark.CURRENTTIME}" />

															<c:if test="${timeDiff lt 1}">
																<span>방금 전</span>
															</c:if>

															<c:if test="${timeDiff ge 1 and timeDiff lt 60}">
																<span>${timeDiff} 분 전</span>
															</c:if>

															<c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
																<span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
															</c:if>

															<c:if
																test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
																<span>${Integer.valueOf(timeDiff div (24*60))} 일
																	전</span>
															</c:if>

															<c:if
																test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
																<span>${Integer.valueOf(timeDiff div (7*24*60))}
																	주</span>
															</c:if>
														</div>
														</div>
													  </div>	
													</li>
												  </ul>	
												</c:forEach>
											</div>
										</div>
									</div>
							

								  <!--   북마크가 없는 경우 -->
	                    <c:if test="${empty myTotalWorks && empty search_word }">
	                       <h6>북마크한 글이 없습니다.</h6>
	                    </c:if>
	                    
	                    	
					
										
											
										</div>
									</div>
							</div>
						</div>
					</div>

				</div>
	                 
                       


				<!-- Footer -->
				<footer class="content-footer footer bg-footer-theme"
					style="padding-top: 20px;">
					<div
						class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
						<div class="mb-2 mb-md-0">
							©
							<script>
                    document.write(new Date().getFullYear());
                  </script>
							(주)WidUs
						</div>
						<div>
							<a href="https://themeselection.com/license/"
								class="footer-link me-4" target="_blank">License</a> <a
								href="https://themeselection.com/" target="_blank"
								class="footer-link me-4">More Themes</a> <a
								href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
								target="_blank" class="footer-link me-4">Documentation</a>

							<a
								href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
								target="_blank" class="footer-link me-4">Support</a>
						</div>
					</div>

				</footer>
				<!-- Footer -->

				<div class="content-backdrop fade"></div>
			</div>
		</div>
	</div>

	<!-- / Layout page -->


	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- / Layout wrapper -->
	
	
	

	<!-- Core JS -->
	<script
		src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
	<script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
	<script
		src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
	<!-- Vendors JS -->
	<script
		src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>
	<!-- Main JS -->
	<script src="../resources/mainboard/assets/js/main.js"></script>
	<!-- Page JS -->
	<script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>
	
</body>
</html>