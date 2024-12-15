<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>날짜 선택</title>
    <link rel="stylesheet" href="../resources/css/rsCal.css">
    <link rel="stylesheet" href="../resources/css/rs_popup.css">
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/rsCal2.js"></script>
</head>
<body>

    <div id="open_calendar">
        <div class="close_icon"></div>
        <p>스마트 예약</p>
        <div class="infor_box">
            <p>원하는 날짜를 선택하세요.</p>
        </div>
        <ul class="day_title">
            <li class="none"><a href="#" id="today2">오늘</a></li>
            <li class="title"><a href="#" id="monthTitle2"></a></li>
            <li class="today"><a href="#" id="todayLink2">오늘</a></li>
        </ul>
        <ul class="weeks">
            <li><a href="#">일</a></li>
            <li><a href="#">월</a></li>
            <li><a href="#">화</a></li>
            <li><a href="#">수</a></li>
            <li><a href="#">목</a></li>
            <li><a href="#">금</a></li>
            <li><a href="#">토</a></li>
        </ul>
        <div class="calendar" id="calendar2">
            <!-- JavaScript가 이곳에 날짜를 추가합니다. -->
        </div>
        <div class="wait_btn">
            <div class="back_btn" id="prevBtn2">뒤로가기</div>
            <div class="next_btn" id="nextBtn2">선택하기</div>
        </div>
    </div>

    <script>
    let firstDateSelected = false; // 첫 번째 날짜 선택 여부

    document.querySelectorAll('#calendar2 a').forEach(item => {
        item.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            const selectedDate = this.getAttribute('data-date'); // data-date 속성에서 가져오기
            
            console.log('선택된 날짜:', selectedDate); // 로그 추가

            const [year, month, day] = selectedDate.split('-');

            // 날짜 저장
            if (!firstDateSelected) {
                // 첫 번째 날짜 선택 시
                const startDate = `${year}-${month}-${day}`;
                localStorage.setItem('selectedStartDate', startDate);
                console.log('시작 날짜 저장:', startDate);
                firstDateSelected = true; // 첫 번째 날짜가 선택되었음을 기록
            } else {
                // 두 번째 날짜 선택 시
                const endDate = `${year}-${month}-${day}`;
                localStorage.setItem('selectedEndDate', endDate);
                console.log('종료 날짜 저장:', endDate);

                // 부모 페이지에 날짜 업데이트
                const dateInput = window.opener.document.getElementById('dateInput');
                if (dateInput) {
                    dateInput.value = `${localStorage.getItem('selectedStartDate')} ~ ${endDate}`;
                    console.log('부모 페이지에 날짜 업데이트:', dateInput.value);
                } else {
                    console.error('부모 페이지에서 dateInput 요소를 찾을 수 없습니다.');
                }
                window.close(); // 팝업 닫기
            }
        });
    });


    // 팝업이 닫힐 때 부모 페이지를 리다이렉트
    window.onunload = function() {
        if (window.opener) {
            window.opener.location.href = 'smartrs3'; // 리다이렉트할 페이지 URL
        }
    };
    </script>
</body>
</html>
