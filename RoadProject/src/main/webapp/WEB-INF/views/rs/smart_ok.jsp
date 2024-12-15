<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스마트 예약 - 옵션 확인</title>
    <link rel="stylesheet" href="../resources/css/smartcs.css">
    <%
	String uname = (String) session.getAttribute("nickname");
	String uphone = (String) session.getAttribute("phone");
	
	System.out.println("name : "+uname+", uphone : "+uphone);
%>
    <style>
    .hidden-divider {
        display: none; /* 숨김 */
    }
</style>
    <script>
    	let displayDate;
    	let displayTime;
    
        // 로컬 스토리지에서 selectedDate 가져오기
        function getLocalStorageDate() {
            return localStorage.getItem('selectedDate');
        }

        // 페이지 로드 시 로컬 스토리지에서 날짜 가져오기
        window.onload = function() {
            const localStorageDate = getLocalStorageDate();
            const sessionDate = "<%= session.getAttribute("selectedDate") != null ? session.getAttribute("selectedDate") : "" %>";
            const sessionTime = "<%= session.getAttribute("selectedTime") != null ? session.getAttribute("selectedTime") : "" %>";

            // 날짜와 시간 표시
            displayDate = sessionDate ? sessionDate : (localStorageDate ? localStorageDate : "날짜를 선택하세요.");
            displayTime = sessionTime ? sessionTime : "시간을 선택하세요.";
			
            console.log(displayDate);
            console.log(displayTime);
            // 날짜와 시간을 특정 위치에 설정
            document.getElementById("selectedDateDisplay").innerHTML = 
            displayDate + ", "+displayTime;
        };
        
        
    </script>
</head>
<body>
<div id="rscontainer">
    <!-- 2. 스마트 예약 옵션 확인 창 -->
    <div id="option_confirm">
        <div class="title">
            <p><%= uname != null ? uname : "null" %>님이 좋아하실 가게를 찾았어요!</p>
        </div>
        <div class="content">
            <p>선택한 옵션</p>
            <ul class="option">
                <li>
                    <h3><img src="../resources/images/World Map.png" alt="선택한 위치">선택한 위치</h3>
                    <p>{선택한 위치 값}</p>
                </li>
                <li>
                    <h3><img src="../resources/images/Two Oclock.png" alt="선택한 위치">선택한 시간</h3>
                    <p id="selectedDateDisplay">
                        
                    </p>
                </li>
                <li>
                    <h3><img src="../resources/images/Keyboard.png" alt="선택한 위치">선택한 키워드</h3>
                    <p>
                        <%
                            String selectedKeywords = request.getParameter("keywords");
                            out.print(selectedKeywords != null ? selectedKeywords : "키워드를 선택하세요.");
                        %>
                    </p>
                </li>
                <li>
                    <h3><img src="../resources/images/People Holding Hands.png" alt="선택한 위치">인원 수</h3>
                    <p>
                        <%
                            String personCount = request.getParameter("personCount");
                            out.print(personCount != null ? personCount + "명" : "인원 수를 선택하세요.");
                        %>
                    </p>
                </li>
            </ul>
           
        </div>
        <div class="main_btn" onclick="goToRsMap()" style="cursor:pointer;">{n}개의 맛집 보러가기</div>
    </div>
</div>
<form id="redirectForm" action="../map/rsmap" method="POST" style="display:none;">
    <input type="hidden" name="selectedDate" id="hiddenSelectedDate">
    <input type="hidden" name="selectedDate2" id="hiddenSelectedDate2">
    <input type="hidden" name="selectedTime" id="hiddenSelectedTime"> <!-- 시간 추가 -->
    <input type="hidden" name="keywords" id="hiddenKeywords">
    <input type="hidden" name="personCount" id="hiddenPersonCount">
</form>

<script>
    function goToRsMap() {
    	const selectedDateTime = document.getElementById("selectedDateDisplay").innerText;

        // 정규 표현식을 사용하여 두 개 이상의 공백으로 분리
        const dateTimeParts = selectedDateTime.split(","); // 두 개 이상의 공백으로 분리
        const dateRange = dateTimeParts[0]; // 첫 번째 요소로 날짜 범위
        const displayTime = dateTimeParts[1]; // 두 번째 요소로 시간
        
        console.log(displayDate+" || "+displayTime);
        
        const selectedTime = "없다..";
        const selectedKeywords = "<%= selectedKeywords %>";
        
        const personCount = "<%= personCount %>";

        // hidden 필드에 값 설정
        document.getElementById("hiddenSelectedDate").value = selectedDateTime;
        document.getElementById("hiddenSelectedDate").value = dateRange; // 날짜 범위
        document.getElementById("hiddenSelectedTime").value = displayTime; // 시간
        document.getElementById("hiddenKeywords").value = selectedKeywords;
        document.getElementById("hiddenPersonCount").value = personCount;

        // 폼 제출
        document.getElementById("redirectForm").submit();
        console.log("얍");
    }
</script>
</body>
</html>
