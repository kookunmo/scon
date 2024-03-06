<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴스 수정</title>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<link href="/resources/css/styles.css" rel="stylesheet" />
<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
}

/*헤더부분***********************************/
#header {
	display: block;
	width: 100%;
	height: 80px;
	background-color: red;
	position: relative;
}

.logo {
	position: absolute;
	left: 0;
	width: 30%;
	height: 100%;
	background: #212529;
}

.logo2 {
	position: absolute;
	left: 28%;
	width: 50%;
	height: 100%;
	background: #212529;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
}

.logo2 img {
	width: 80%;
	height: 100%;
	object-fit: cover;
}

.mypage {
	position: absolute;
	left: 75%;
	width: 50%;
	height: 100%;
	background: #212529;
}

/*헤더부분***********************************/
#nav {
	display: block;
	width: 100%;
	height: 50px;
	background-color: blue;
	position: relative;
}

/*네비게이션 바***********************************/
</style>
</head>
<body>
	<div id="header" class="text-center">
		<!--전체 감싸기-->
		<div class="logo">로고</div>
		<div class="logo2">
			<a href="링크주소"> <img src="/img/로고 copy.png" alt="로고 위치">
			</a>
		</div>
		<div class="mypage">
			<a class="btn btn-primary" href="#top">관리자</a>
		</div>

	</div>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<button class="navbar-toggler ml-auto" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center"
				id="navbarSupportedContent">
				<ul class="navbar-nav mb-2 mb-lg-0 text-center">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">최신뉴스</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">자연</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">과학</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">it</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이경무</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container mt-5 text-center">
		<div class="row">
			<div class="col-lg-8">
				<form action="/modify" method="post">
					<!-- Post content-->
					<article>
						<input class="form-control box1" type="hidden" name="bno"
							value="${board.bno}" />
						<!-- Post title-->
						<div class="container">
							<div class="row">
								<!-- 카테고리 -->
								<div class="container">
									<div class="row">
										<!-- 카테고리 선택란 -->
										<div class="col-md-6 mb-3">
											<div class="row">
												<div class="col-md-12">
													<select class="custom-select d-block" id="hint"
														name="ccode">
														<option value="" disabled>카테고리</option>
														<option value="1" ${board.ccode == 1 ? 'selected' : ''}>자연</option>
														<option value="2" ${board.ccode == 2 ? 'selected' : ''}>과학</option>
														<option value="3" ${board.ccode == 3 ? 'selected' : ''}>IT</option>
														<option value="4" ${board.ccode == 4 ? 'selected' : ''}>경무</option>
													</select>
												</div>
											</div>
										</div>
										<!-- 제목 입력란 -->
										<div class="col-md-6 mb-3">
											<div class="row">
												<div class="col">
													<div class="input-form-backgroud">
														<div class="input-form">

															<div align="center" id="titlebox">
																<div class="form-group">
																	<input class="form-control box1" type="text"
																		name="title" value='<c:out value="${board.title}"/>'>
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 사진 input 창 -->
								<div class="container">
									<div class="row">
										<div class="col">
											<div class="input-form-backgroud">
												<div class="input-form">

													<div align="center" id="titlebox">
														<div class="form-group">
															<input class="form-control box1" type="text"
																name="writer" value='<c:out value="${board.writer}"/>'>
														</div>
													</div>

												</div>
											</div>
										</div>
										<div class="col">
											<div class="form-group">
												<input class="form-control box1" type="text" name="fileurl"
													value='<c:out value="${board.fileurl}"/>'>
											</div>
										</div>
										<div class="col">
											<a class="btn btn-primary me-2" href="#top">찾아보기</a>
										</div>
									</div>
								</div>
								<!-- Post categories-->
								<div class="text-center">
									<a class="badge bg-secondary text-decoration-none link-light"
										href="#!">작성자</a> <a
										class="badge bg-secondary text-decoration-none link-light"
										href="#!">원본링크</a>
								</div>

								<figure class="text-center mb-4">
									<img class="img-fluid rounded"
										src="https://dummyimage.com/900x400/ced4da/6c757d.jpg"
										alt="..." />
								</figure>

								<div class="col">
									<div class="input-form-backgroud">
										<div class="input-form">

											<div align="center" id="titlebox">
												<div class="form-group">
													<input class="form-control box1" type="text"
														name="fileinfo" value='<c:out value="${board.fileinfo}"/>'>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Post content-->
						<div class="form-group" id="contentbox">
							<textarea class="form-control" cols="80" rows="10"
								id="contentbox" name="content"><c:out
									value="${board.content}" /></textarea>
						</div>

						<!-- Comments section-->

						<div class="btn-wrapper">
							<input type="submit" class="btn btn-md  mr-2"
								style="background-color: #f58b34; color: white;" value="수정">
							<input type="button" class="btn btn-md  mr-2"
								style="background-color: #f58b34; color: white;" value="취소"
								onclick="history.back()">
						</div>
					</article>
				</form>
			</div>
		</div>
	</div>
</body>
</html>