<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="rscontainer">
    <!-- popup_wait_1 -->
    <div id="popup_wait_1">
        <div class="close_icon"></div>
        <p>스피드 예약</p>
        <div class="market_info">
            <div class="name">
                <p>{상호명}</p>
                <p class="name_p">카테고리</p>
            </div>
            <ul class="adds">
                <li>인천광역시 부평구 부평대로 44</li>
                <li>09:00 ~ 18:00</li>
                <li>36.4km</li>
                <li>리뷰 100개</li>
            </ul>
        </div>
        <div class="wait_infor">
            <ul class="wait_num">
                <li>내 대기 번호 순서</li>
                <li>28번</li>
                <li>
                    <p>현재 @@@ 님 앞에 27팀이 있어요!</p>
                    <p>대기 소요 시간 : 30분 예상</p>
                </li>
            </ul>

            <div class="wait_icon_box">
                <div class="wait"></div>
                <div class="choice"></div>
                <div class="check"></div>
            </div>
        </div>
        <div id="back_btn" class="back_btn">뒤로 가기</div>
    </div>
    </div>
     <script>
    document.querySelector('.back_btn').addEventListener('click', function() {
        window.location.href = 'reservation_main'; // 뒤로 가기 클릭 시 speedrs2로 이동
    });
</script>