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
    <div id="fail">
        <div class="close_icon"></div>
        <p class="title">일반 예약</p>
        <div class="subtitle">
            <p class="title">예약 실패</p>
            <img src="../resources/images/icons/Pensive Face.png" alt="실패아이콘">
            <p>
                현재 예약이 불가합니다. <br>잠시 후에 다시 시도해주시기 바라며 지속적으로 문제가 발생하는 경우 <br>스페이스로 문의주시기 바랍니다.
            </p>
        </div>
        <div class="market_info">
            <div class="name">
                <p>{상호명}</p>
                <p>카테고리</p>
            </div>
            <ul class="adds">
                <li>인천광역시 부평구 부평대로 44</li>
                <li>09:00 ~ 18:00</li>
                <li>36.4km</li>
                <li>리뷰 100개</li>
            </ul>
        </div>
        <div class="back_btn">뒤로 가기</div>
    </div>
 </div>
 
 <script>
    document.querySelector('.back_btn').addEventListener('click', function() {
        window.location.href = 'speedrs2'; // 뒤로 가기 클릭 시 speedrs2로 이동
    });
</script>
        