<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/rsCal.css">
<link rel="stylesheet" href="../resources/css/rs_popup.css">
<script src="../resources/js/jquery.min.js"></script>        
<script src="../resources/js/script.js"></script>
<script src="../resources/js/rsCal.js"></script>
</head>
<%
    String selectedDate = request.getParameter("date");
    if (selectedDate != null) {
        session.setAttribute("selectedDate", selectedDate); // 세션에 날짜 저장
        System.out.println("날짜 저장 완료 : " + session.getAttribute("selectedDate"));
    } else {
        System.out.println("날짜 저장 실패");
    }
%>

<body>
    <div id="open_calendar">
        <div class="close_icon"></div>
        <p>스피드 예약</p>
        <div class="infor_box">
            <p>원하는 날짜를 선택하세요.</p>
        </div>
        <ul class="day_title">
            <li class="none"><a href="#" id="today">오늘</a></li>
            <li class="title"><a href="#" id="monthTitle"></a></li>
            <li class="today"><a href="#" id="todayLink">오늘</a></li>
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
        <div class="calendar" id="calendar">
            <!-- JavaScript가 이곳에 날짜를 추가합니다. -->
        </div>
        <div class="wait_btn">
            <div class="back_btn" id="prevBtn">이전</div>
            <div class="next_btn" id="nextBtn">다음</div>
        </div>
    </div>
    
           <script>
           
        document.querySelectorAll('.calendar a').forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 링크 동작 방지
                const selectedDate = this.getAttribute('data-date'); // data-date 속성에서 가져오기
                const [year, month, day] = selectedDate.split('-');
                
                window.opener.document.getElementById('dateInput').value = `${year}-${month}-${day}`; // 부모 페이지에 값 설정
                window.close(); // 팝업 닫기
            });
        });

        // 팝업이 닫힐 때 부모 페이지를 리다이렉트
        window.onunload = function() {
            window.opener.location.href = 'speedrs'; // 리다이렉트할 페이지 URL
            window.close();
        };
        </script>
        
</body>
</html>