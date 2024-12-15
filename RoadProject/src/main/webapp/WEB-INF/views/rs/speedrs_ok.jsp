<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <link rel="stylesheet" href="../resources/css/speedrs_popup.css">
<%
    String selectedDate = (String) session.getAttribute("selectedDate"); // 세션에서 날짜 값 가져오기
    System.out.println("세션에 저장된 날짜 : "+selectedDate);
    
    String selectedTime = (String) session.getAttribute("selectedTime");
    System.out.println("세션에 저장된 시간 : "+selectedTime);
%>
<div id="rscontainer">
    <div id="succese">
        <div class="close_icon"></div>
        <p class="title">스피드 예약</p>
        <div class="subtitle">
            <p class="title">축하합니다!</p>
            <img src="../resources/images/icons/Partying Face.png" alt="성공아이콘">
            <p>축하합니다! 예약에 성공했습니다! <br>자세한 사항은 가게에 문의 하시기 바랍니다!</p>
        </div>
        <div class="line-parent">
<div class="group-child">
</div>
<div class="group-item">
</div>
<div class="component-2">
<img class="off-icon" alt="" src="../resources/images/Credit card_light.png">
<div class="div3">옵션 선택</div>
</div>
<div class="component-4">
<img class="icon-on" alt="" src="../resources/images/Done_light.png">
<div class="div3">예약 성공!</div>
</div>
<div class="component-3">
<img class="off-icon" alt="" src="../resources/images/icons/User_light.png">
<div class="div3">기다리는 중</div>
</div>
</div>
        <!-- 상황 아이콘 -->
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
        <div id="rshome">홈으로</div>
    </div>
 </div>
  <script>
    document.querySelector('#rshome').addEventListener('click', function() {
        window.location.href = 'reservation_main';
    });
</script>
        