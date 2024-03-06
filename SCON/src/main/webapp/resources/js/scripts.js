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