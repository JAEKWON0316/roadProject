<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/rs_popup.css">
<script src="../resources/js/jquery.min.js"></script>        
<script src="../resources/js/script.js"></script>
<script src="../resources/js/rsCal.js"></script>
</head>
<body>
 <div id="time_select">
        <div class="title">
            <p>스마트 예약</p>
        </div>
        <div class="subtitle">
            <p>이용 시간을 선택하세요.</p>
        </div>
         <form action="saveTime" method="post" id="timeForm">
            <ul class="time_list">
                <li>10:00</li>
                <li>11:00</li>
                <li>12:00</li>
                <li>13:00</li>
                <li>14:00</li>
                <li>15:00</li>
                <li>16:00</li>
                <li>17:00</li>
                <li>18:00</li>
                <li>19:00</li>
                <li>20:00</li>
                <li>21:00</li>
                <li>22:00</li>
                <li>23:00</li>
                <li>24:00</li>
            </ul>
            <input type="hidden" name="selectedTime" id="selectedTime" />
            <div class="btn_list">
                <button class="second_btn small" id="backButton">뒤로가기</button>
                <button class="main_btn small" id="selectButton" type="submit">선택하기</button>
            </div>
        </form>       
    </div>
</body>
<script>
    const timeListItems = document.querySelectorAll('.time_list li');

    timeListItems.forEach(item => {
        item.addEventListener('click', function() {
            // 모든 li에서 'on' 클래스를 제거
            timeListItems.forEach(i => i.classList.remove('on'));
            
            // 클릭한 li에 'on' 클래스 추가
            this.classList.add('on');

            // 클릭한 li의 텍스트 내용을 콘솔에 출력
            console.log(this.textContent);
        });
    });
    
    document.getElementById('selectButton').addEventListener('click', function(event) {
        const selectedItem = document.querySelector('.time_list li.on');
        
        if (selectedItem) {
            const selectedTime = selectedItem.textContent; // 선택된 시간 가져오기
            document.getElementById('selectedTime').value = selectedTime; // 숨겨진 입력 필드에 시간 저장
        } else {
            event.preventDefault(); // 선택된 시간이 없으면 폼 제출 방지
            console.log("선택된 시간이 없습니다.");
        }
    });
    
    document.getElementById('backButton').addEventListener('click', function() {
        window.close(); // 팝업 닫기
    });
</script>

</html>