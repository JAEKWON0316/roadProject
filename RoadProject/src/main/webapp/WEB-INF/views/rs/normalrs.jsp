<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String selectedDate = (String) session.getAttribute("selectedDate"); // 세션에서 날짜 값 가져오기
    System.out.println("세션에 저장된 날짜 : "+selectedDate);
    
    String selectedTime = (String) session.getAttribute("selectedTime");
    System.out.println("세션에 저장된 시간 : "+selectedTime);
%>
<div id="rscontainer">
                <div id="rs_popup">
        <p>일반 예약</p>
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

            <div class="pic_box">
                <div class="pic_box_1"></div>
                <div class="pic_box_2"></div>
                <div class="pic_box_3"></div>
            </div>
        </div> 
        <!-- 선택창 박스 -->
        <form action="normalrs2" method="POST">
        <div class="input_box">
  <div class="time">
    <p>이용시간대 <span>*</span></p>
    <div id="time_box" class="time_box">
        <input type="text" id="timeInput" placeholder="시간대 선택"
        value="<%= selectedTime != null ? selectedTime : "" %>"  />
        <img src="../resources/images/icons/Expand_down_light.png" alt="더보기 아이콘" id="dropdownIcon" class="dropdown-icon">
    </div>
</div>
            <div class="person">
                <p>인원수 선택 <span>*</span></p>
                <div class="person_box">
                    <img src="../resources/images/icons/Add_light_ma.png" alt="마이너스 아이콘" id="decreaseBtn">
        			 <input type="number" id="personCount" name="personCount" class="per_inone" value="1" min="1" />
        			<img src="../resources/images/icons/Add_light.png" alt="플러스 아이콘" id="increaseBtn">
                </div>
            </div>
        </div>

        <!-- 안내문 박스 -->
        <div class="pay_box">
            <div class="icon_text_box">
                <img src="../resources/images/icons/Info_alt_light.png" alt="">
                <p>해당 스페이스는 예약금 결제를 진행해야 예약이 완료됩니다.</p>
            </div>
            <div class="che_text_box">
                <input type="checkbox" id="agreeCheckbox" class="check_box" />
                <p>제 3자 정보 제공 동의</p>
            </div>
        </div>

        <!-- 버튼 박스 -->
        <div class="wait_btn">
            <button type="reset" class="back_btn" id="cancelBtn">취소하기</button>
            <button type="submit" class="next_btn">예약하기</button>
        </div>    
        </form>
    </div>

        </div>
        
<script>


dropdownIcon.addEventListener('click', function() {
    const popup = window.open("timeselect2", "CalendarPopup", "width=840,height=700,scrollbars=yes,resizable=yes");

    if (popup) {
        popup.onload = function() {
            fetch('getSessionValue')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.text();
                })
                .then(data => {
                    console.log("세션 값:", data);
                    const timeInput = popup.document.getElementById("timeInput");
                    if (timeInput) {
                        timeInput.value = data; // 값 설정
                    } else {
                        console.error("timeInput 요소를 찾을 수 없습니다.");
                    }
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
        };
    } else {
        alert('팝업 차단기가 활성화되어 있습니다. 설정에서 팝업을 허용해 주세요.');
    }
});

// Cancel 버튼 이벤트 리스너
document.getElementById("cancelBtn").addEventListener("click", function() {
    fetch('resetSession', { method: 'POST' })
        .then(response => {
            if (response.ok) {
                window.close(); // 팝업 닫기
                window.location.href = 'reservation_main';
            }
        });
});

const checkbox = document.getElementById('agreeCheckbox');
const submitButton = document.querySelector('.next_btn');

checkbox.addEventListener('change', function() {
    if (this.checked) {
        submitButton.classList.add('rsactive'); // 체크 시 클래스 추가
    } else {
        submitButton.classList.remove('rsactive'); // 체크 해제 시 클래스 제거
    }
});

const timeInput = document.getElementById('timeInput').value;
const agreeCheckbox = document.getElementById('agreeCheckbox');

window.addEventListener('DOMContentLoaded', (event) => {
    const timeInput = document.getElementById('timeInput').value;
    const agreeCheckbox = document.getElementById('agreeCheckbox');

    // 초기 상태 체크
    if (timeInput) {
        agreeCheckbox.disabled = false;
    } else {
        agreeCheckbox.disabled = true;
        agreeCheckbox.checked = false; // 체크 해제
    }
});

document.querySelector('form').addEventListener('submit', function(event) {
    const timeInput = document.getElementById('timeInput').value; // 현재 값 가져오기
    const agreeCheckbox = document.getElementById('agreeCheckbox');

    if (!timeInput || !agreeCheckbox.checked) {
        event.preventDefault(); // 폼 제출 중단
        console.log("시간대 또는 동의 체크가 필요합니다.");
    } else {
        console.log("시간대:", timeInput);
        // 폼은 여기서 정상적으로 제출됩니다.
    }
});


</script>
