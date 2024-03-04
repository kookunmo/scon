<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <link href="../resources/css/styles.css" rel="stylesheet" />
    <style>
        *{
           padding:0; margin:0; text-decoration:none; 
        }
        /*헤더부분***********************************/
        #header{ 
           display: block;  
           width: 100%; 
           height:80px; 
           background-color:black; 
           position: relative;
       } 
       .logo{
            position: absolute; 
            left: 0;
            width:30%;
            height: 100%;
            background: #212529;

        }
        .logo2{
            position: absolute;
            left:28%; 
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
        .mypage{
            position: absolute;
            left:75%; 
            width: auto;
            height: 100%;
            background:#212529;
        }
        /*헤더부분***********************************/
        #nav{
           display: block; 
           width: 100%; 
           height:50px; 
           background-color:blue;
           position: relative;
       }
/*네비게이션 바***********************************/

.tabs {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: flex;
}

.tab-link {
    padding: 10px;
    cursor: pointer;
    background-color: #f0f0f0;
    margin-right: 5px;
}

.tab-content {
    display: none;
    padding: 20px;
    border: 1px solid #ddd;
    margin-top: 5px;
}

.tab-content.current {
    display: block;
}

.tab-link.current {
    background-color: #ddd;
}


       
       </style>
</head>
<body>
    <div id="header"><!--전체 감싸기-->
        <div class="logo">로고</div>
        <div class="logo2">
            <a href="링크주소">
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">New</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">AI</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">물리</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">지구과학</a></li>
                        <li class="nav-item"><a class="nav-link"  href="#">생물</a></li>
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
                        <div class="card mb-4">
                        </div>
                        
                        <%-- <c:if>
                        <h4>헤드라인 뉴스</h4>
                        </c:if>
                        
                        <c:if>
                        <h4>검색결과 </h4>
                        </c:if> --%>
                        
                        <!-- Post content-->
                        <section class="mb-5" style="height: auto;">
                            <c:forEach items="${list}" var="main"> 
                                <div style="width: auto; height: 120px; overflow: auto;">
							        <div style="width: 150px; height: 105px; margin: 5px; padding: 5px; float: left;">
							        <img src="../resources/img/${main.fileurl}" alt="이미지" style="width: 100%; height: 100%; object-fit: cover;">
							        </div>
							        <div style="width: 670px; height: 105px; margin: 5px; padding: 5px; float: left;">
							        <c:out value="${main.title}"></c:out>
							        <br><br>
							        <c:out value="${main.content}"></c:out>
							        </div>
							    </div>
						    	<hr>
     
                                </c:forEach>
                        </section>
                    </article>
                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                               <a href="#" style="width: 100%; border: none; display: block; text-align: center; color: black; padding: 10px 0; text-decoration: none;">더보기 +</a>
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
                    <div class="card mb-4">
                        <div class="card-header">광고</div>
                        <img src="이미지_경로_또는_URL" class="card-img-top" alt="광고 이미지">
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
                    <div class="card mb-4">
                        <div class="card-header">광고</div>
                        <img src="이미지_경로_또는_URL" class="card-img-top" alt="광고 이미지">
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; </p></div>
        </footer>


</body>
</html>