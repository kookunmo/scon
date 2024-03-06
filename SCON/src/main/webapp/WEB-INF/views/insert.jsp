<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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

/*네비게이션 바***********************************/
#contentbox {
	margin: 1rem 0;
}

.btn-wrapper {
	margin-bottom: 1rem
}
</style>
</head>
<body>


	<!-- Page content-->
	<div class="container mt-4 text-center">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<form action="/insert" method="post">
					<!-- Post content-->
					<article>
						<input type="hidden" name="readcount" value="0">
						<!-- Post title-->
						<div class="container">
							<div class="row">
								<!-- 카테고리 -->
								<div class="container">
									<div class="row">
										<!-- 카테고리 선택란 -->
										<div class="col-md-3 mb-3">
											<div class="row">
												<div class="col-md-12">
													<select class="form-select custom-select d-block" id="hint"
														name="ccode">
														<option value="" disabled selected>카테고리</option>
														<option value="1">자연</option>
														<option value="2">과학</option>
														<option value="3">it</option>
														<option value="4">경무</option>
													</select>
												</div>
											</div>
										</div>
										<!-- 제목 입력란 -->
										<div class="col-md-9 mb-3">
											<div class="row">
												<div class="col">
													<div class="input-form-backgroud">
														<div class="input-form">

															<div align="center" id="titlebox">
																<div class="form-group">
																	<input class="form-control box1" type="text"
																		name="title" placeholder="제목을 입력하세요">
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
										<div class="col-md-3">
											<div class="input-form-backgroud">
												<div class="input-form">

													<div align="center" id="titlebox">
														<div class="form-group">
															<input class="form-control box1" type="text"
																name="writer" placeholder="기자이름">
														</div>
													</div>

												</div>
											</div>
										</div>
										<div class="col-md-9">
											<div class="form-group">
												<input class="form-control box1" type="text" name="fileurl"
													placeholder="원본 기사 링크">
											</div>
										</div>

									</div>
								</div>
								<div class="container">
									<div class="row" style="margin: 20px 0px 20px 0px;">
										<div class="input-form-backgroud">
											<div class="col-md-9">
												<div class="input-form">
													<div class="form-group">
														<input type="file" class="form-control box1" value="찾아보기">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Post categories-->
								<div class="text-center"></div>

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
														name="fileinfo" placeholder="사진 설명란">
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
							<!-- Post content-->
							<div class="form-group" id="contentbox">
								<textarea class="form-control" cols="80" rows="10"
									id="contentbox" name="content" placeholder="내용을 입력하세요"></textarea>
							</div>
							<!-- Comments section-->

							<div class="btn-wrapper">
								<input type="submit" class="btn btn-md btn-primary  mr-2"
									style="color: white;" value="등록"> <input type="button"
									class="btn btn-md btn-primary  mr-2" style="color: white;"
									value="취소" onclick="history.back()">
							</div>
						</div>


					</article>
				</form>
			</div>
		</div>
	</div>
</body>
</html>