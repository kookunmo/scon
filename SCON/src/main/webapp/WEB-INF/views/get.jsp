<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL Core 태그 라이브러리를 사용하기 위한 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- JSTL Format 태그 라이브러리를 사용하기 위한 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <script>
$(document).ready(function(){
    // 마우스 올렸을 때 이벤트
    $(".tab-link").mouseenter(function(){
        var tab_id = $(this).attr('data-tab');

        $(".tab-link").removeClass('current');
        $(".tab-content").removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    // 마우스가 모든 탭에서 벗어났을 때 일간 탭으로 돌아가기
    $(".ranking-tabs").mouseleave(function(){
        $(".tab-link").removeClass('current');
        $(".tab-content").removeClass('current');

        $('.tab-link[data-tab="tab-1"]').addClass('current');
        $('#tab-1').addClass('current');
    });

    // 페이지 로드 시 일간 탭 활성화
    $('.tab-link[data-tab="tab-1"]').addClass('current');
    $('#tab-1').addClass('current');
    

  
});
</script>
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
                <button class="navbar-toggler ml-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/main?ccode=0">New</a></li>
                        <li class="nav-item"><a class="nav-link" href="/main?ccode=1">AI</a></li>
                        <li class="nav-item"><a class="nav-link" href="/main?ccode=2">IT</a></li>
                        <li class="nav-item"><a class="nav-link" href="/main?ccode=3">우주</a></li>
                        <li class="nav-item"><a class="nav-link"  href="/main?ccode=4">자연</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- 카테고리 코드 -->
        <article>
                        <div class="card mb-4">
                        </div>
                        <c:if test="${ccode == '0'}">최신</c:if>
                        <c:if test="${ccode == '1'}">AI</c:if>
                        <c:if test="${ccode == '2'}">IT</c:if>
                        <c:if test="${ccode == '3'}">우주</c:if>
                        <c:if test="${ccode == '4'}">자연</c:if>
                        <!-- Post content-->
                        <section class="mb-5" style="height: auto;">
                            <c:forEach items="${list}" var="main"> 
                                <div style="width: auto; height: 120px; overflow: auto;">
                             <div style="width: 150px; height: 105px; margin: 5px; padding: 5px; float: left;">
                             <img src="../resources/img/${main.fileurl}" alt="이미지" style="width: 100%; height: 100%; object-fit: cover;">
                             </div>
                             <div style="width: 670px; height: 105px; margin: 5px; padding: 5px; float: left;">
                                <a href="/get?bno=${main.bno}">
                                         <p><strong><c:out value="${main.title}"></c:out></strong></p>
                                         
                                         <c:out value="${fn:substring(main.content, 0, 80)}"/> ${fn:length(main.content) > 80 ? '...' : ''}
                                      </a>
                                
                             </div>
                         </div>
                         <hr>
     
                                </c:forEach>
                        </section>
                        
                    </article>
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
                        
                            <a class="badge2 bg-secondary text-decoration-none link-light" href="/modify?bno=${board.bno}">수정</a>
                            <a class="badge2 bg-secondary text-decoration-none link-light" href="/remove?bno=${board.bno}">삭제</a>
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
                        <div class="card-header">검색하기</div>
                        <div class="card-body">
                            <form id="searchForm" action="/main" method="get">
                                     <select name="type" style="width: 90px; height: 35px;">
                                       <option value="T" selected>제목</option>
                                        <option value="C">내용</option>
                                        <option value="W">작성자</option>
                                     </select>
                                    <input name="keyword" style="width: 200px; height: 35px;">
                                    <input type="hidden" name="pageNum" value="${cri.pageNum}">
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                    
                                    <button class="btn btn-primary" id="button-search" type="submit" style="width: 80px;">검색</button>
                             </form>
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
                                    <li class="tab-link" data-tab="tab-1" style="width: 24%;">AI</li>
                                    <li class="tab-link" data-tab="tab-2" style="width: 24%;">IT</li>
                                    <li class="tab-link" data-tab="tab-3" style="width: 24%;">우주</li>
                                    <li class="tab-link" data-tab="tab-4" style="width: 24%;">자연</li>
                                </ul>
                                <div id="tab-1" class="tab-content current" style="border: none;">
                                    <!-- 일간 내용 -->
                                    <ul>
                                    <c:forEach items="${IT}" var="IT"> 
                                        <li><a href="/get?bno=${IT.bno}">
                                        <c:out value="${fn:substring(IT.title, 0, 20)}"/> ${fn:length(IT.title) > 20 ? '...' : ''}
                                        </a></li>
                                    </c:forEach>
                                        <!-- 기타 일간 기사들 -->
                                    </ul>
                                </div>
                                <div id="tab-2" class="tab-content" style="border: none;">
                                    <!-- 주간 내용 -->
                                    <ul>
                                        <c:forEach items="${AI}" var="AI"> 
                                        <li><a href="/get?bno=${AI.bno}">
                                        <c:out value="${fn:substring(AI.title, 0, 20)}"/> ${fn:length(AI.title) > 20 ? '...' : ''}
                                        </a></li>
                                    </c:forEach>
                                       
                                        <!-- 기타 주간 기사들 -->
                                    </ul>
                                </div>
                                <div id="tab-3" class="tab-content" style="border: none;">
                                    <!-- 월간 내용 -->
                                    <ul>
                                        <c:forEach items="${SPACE}" var="SPACE"> 
                                        <li><a href="/get?bno=${SPACE.bno}">
                                        <c:out value="${fn:substring(SPACE.title, 0, 20)}"/> ${fn:length(SPACE.title) > 20 ? '...' : ''}
                                        </a></li>
                                    </c:forEach>
                                        
                                        <!-- 기타 월간 기사들 -->
                                    </ul>
                                </div>
                                <div id="tab-4" class="tab-content" style="border: none;">
                                    <!-- 월간 내용 -->
                                    <ul>
                                        <c:forEach items="${NATURE}" var="NATURE"> 
                                        <li><a href="/get?bno=${NATURE.bno}">
                                        <c:out value="${fn:substring(NATURE.title, 0, 20)}"/> ${fn:length(NATURE.title) > 20 ? '...' : ''}
                                        </a></li>
                                       </c:forEach>
                                        
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