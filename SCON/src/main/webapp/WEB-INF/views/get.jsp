<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL Core 태그 라이브러리를 사용하기 위한 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- JSTL Format 태그 라이브러리를 사용하기 위한 선언 -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Core theme JS-->
    <script src="../resources/js/scripts.js"></script>
    <link href="../resources/css/styles.css" rel="stylesheet" />
    <style>
        *{
           padding:0; margin:0; text-decoration:none; 
        }
        
	</style>

</head>
<body>
   <div id="header"><!--전체 감싸기-->
        <div class="logo">로고</div>
        <div class="logo2">
            <a href="/main">
                <img src="../resources/img/로고 copy.png" alt="로고 위치" >
            </a>
        </div>
        <div class="mypage">
            <a class="btn btn-primary" href="#top">관리자</a>
        </div>
  </div>
         <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <button class="navbar-toggler ml-auto" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">최신뉴스</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">자연</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">과학</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">it</a></li>
                        <li class="nav-item"><a class="nav-link" href="/main?ccode=${ca.ccode}">${ca.name}</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4" >
                            <!-- Post title-->
                            <p class="btn btn-primary me-2">카<c:out value="${board.ccode}"/></p>
                            <h1 class="fw-bolder mb-1"><c:out value="${board.title}"/></h1>
                             <!-- Post categories-->
                             <p class="badge bg-secondary text-decoration-none link-light"><c:out value="${board.writer}"/></p>
                             <a class="badge bg-secondary text-decoration-none link-light" href="${board.newlink}">원본링크</a>
                             
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">
                            	<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm" />
                            </div>
                           
                        <div class="ms-auto2">
                            <a class="badge2 bg-secondary text-decoration-none link-light" href="#!">수정</a>
                            <a class="badge2 bg-secondary text-decoration-none link-light" href="#!">삭제</a>
                        </div>
                        </header>
                         <!-- 메인 광고1 -->
                        <div class="card mb-4">
                        	<a href="https://www.naver.com/">
                            	<img src="../resources/img/ad3.gif" class="card-img-top" alt="광고 이미지" width="900" height="150">
                         	</a>
                        </div>
                        <!-- Preview image figure-->
                        <figure class="mb-4">
	                        <c:choose>
								<c:when test="${empty board.fileurl}">
									<img src="../resources/img/noimage.jpg" style="width: 900px; height: 400px;"  >
								</c:when>
								<c:otherwise>
									<img src="../resources/img/${board.fileurl}"
										class="img-fluid rounded" alt="기사 사진" style="width: 900px; height: 400px;"  />
								</c:otherwise>
							</c:choose>
						</figure>

						<p><c:out value="*사진정보: ${board.fileinfo}"/></p>
						<br>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4"><pre><c:out value="${board.content}"/></pre>
                        </section>
                        
                    </article>
                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4">
                                    <div class="row">
                                        <div class="col-md-5 mb-2">
                                            <input class="form-control" name='replyer' placeholder="닉네임">
                                        </div>
                                        <div class="col-md-5 mb-2">
                                            <input class="form-control" name='password' placeholder="비밀번호">
                                        </div>
                                        <div class="col-md-2">
                                            <button id='modalRegisterBtn' class="btn btn-primary me-2" type="button">등록</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <textarea class="form-control" rows="3" name='reply' placeholder="댓글을 입력하세요"></textarea>
                                        </div>
                                    </div>
                                </form>
                                
                                <!-- Comment with nested comments-->
                                <div class="d-flex mb-4">
                                    <!-- Parent comment-->
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                        
                                    </div>
                                </div>
                                <!-- Single comment-->
                                <div class="d-flex">
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div>
                    <!-- 좌측 광고1 -->
                    <div class="card mb-4">
					    <a href="https://www.tiktok.com/explore">
					        <img src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
					    </a>
					</div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">기사랭킹</div>
                        <div class="card-body" style="height: 290px;">
                            <div class="ranking-tabs">
                                <ul class="tabs">
                                    <li class="tab-link current" data-tab="tab-1" style="width: 32%;">일간</li>
                                    <li class="tab-link" data-tab="tab-2" style="width: 32%;">주간</li>
                                    <li class="tab-link" data-tab="tab-3" style="width: 32%;">월간</li>
                                </ul>
                                <div id="tab-1" class="tab-content current" style="border: none;">
                                    <!-- 일간 내용 -->
                                    <ul>
                                        <li>이경무 CSS 짱</li>
                                        <li>황윤기 그만 하고 쉬어</li>
                                        <li>홍상기 폰코딩 대단해 폰코딩 어떻게 하는거야</li>
                                        <li>정다은 필기대마왕 나중에 필기노트 꼭 공유해</li>
                                        <li>이원준 억까 맨날당해 이제 그만 당해</li>
                                       
                                        <!-- 기타 일간 기사들 -->
                                    </ul>
                                </div>
                                <div id="tab-2" class="tab-content" style="border: none;">
                                    <!-- 주간 내용 -->
                                    <ul>
                                        <li>홍종효 아메리카노 마니 먹으면 잠 안와</li>
                                        <li>김기정 아샷추 빠돌이</li>
                                        <li>설희민 경주 너무 멀어</li>
                                        <li>우나희 9시20분까지 와라 나희봇</li>
                                        <li>이연 파이널때 무조건 PM 확정</li>
                                       
                                        <!-- 기타 주간 기사들 -->
                                    </ul>
                                </div>
                                <div id="tab-3" class="tab-content" style="border: none;">
                                    <!-- 월간 내용 -->
                                    <ul>
                                        <li>구건모 통합관리자 고마워</li>
                                        <li>박지해 해? 헤? 햬? 혜? 헷갈려 정확히 말해</li>
                                        <li>박수민 목소리 너무 커 귀에서 피나와</li>
                                        <li>정인수 오늘 점심 뭐먹어</li>
                                        <li>이소담 식단 너무 힘들어</li>
                                        
                                        <!-- 기타 월간 기사들 -->
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <!-- 좌측 광고2 -->
                    <div class="card mb-4">
                    	<a href="https://www.tiktok.com/explore">
                        	<img src="../resources/img/ad2.jpg" class="card-img-top" alt="광고 이미지">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; </p></div>
        </footer>

<!-- JavaScript 코드 시작 ------------------------------------------------------------------------------------->
<script>
//JavaScript 코드 시작
function showList(page){
    // 부모글 번호 가져오기
    var bnoValue='<c:out value="${board.bno}"/>';
    // 댓글 목록 및 개수 가져오기
    replyService.getList({bno:bnoValue,page:page||1},function(replyCnt,list){
        console.log("replyCnt : "+replyCnt);
        console.log("page : "+page);
        // page가 -1이면 마지막 페이지로 이동
        if(pageNum==-1){
            pageNum=Math.ceil(replyCnt/10.0);
            showList(pageNum);
            return;
        }
        var str="";
        // 댓글목록이 없으면 중지
        if(list==null || list.length==0){
            return;
        }
        // 댓글 목록을 문자열로 구성
        for(var i=0,len=list.length || 0;i<len;i++){
            str+="<li class='left clearfix' data-rno='"+list[i].rno+"' style='cursor:pointer'>";
            str+="<div><div class='header'><strong class='primary-font'>["+list[i].rno+"] "+list[i].replyer+"</strong>";
            str+=" <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
            str+=" <p>"+list[i].reply+"</p></div></li>"  
        }
        // 과제 페이징 없이 스크롤, 더보기 추가
        $(".chat").append(str);
        showMoreReply(replyCnt,page);
    });            
}

</script>


</body>
</html>