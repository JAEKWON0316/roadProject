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
        <p>스마트 예약</p>
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
        <form action="smart_loading" method="POST">
        <div class="input_box">
            <div class="day">
                <p>이용일 <span>*</span></p>
                <div class="day_box">
                    <input type="text" id="dateInput" placeholder="날짜 선택"
                    value="<%= selectedDate != null ? selectedDate : "" %>" 
                     readonly >
                    <img src="../resources/images/icons/Calendar_light.png" alt="캘린더 아이콘" id="cal_btn">
                </div>
            </div>
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
            <div class="theme">
                <p>키워드 설정 <span>*</span></p>
                <div class="theme_box">
                    <ul class="them_list">
                    	<li id="them_li_f">선택하기를 눌러 키워드를 추가하세요!</li>
                    </ul>
                    <input type="hidden" name="keywords" id="keywordsInput"  />
                    <div class="theme_cho" id="theme_cho">
                        선택하기
                    </div>
                </div>
            </div>
        </div>
        <!-- 버튼 박스 -->
        <div class="wait_btn">
            <button type="reset" class="back_btn" id="cancelBtn">취소하기</button>
            <button type="submit" class="next_btn rsactive">예약하기</button>
        </div>    
        </form>
    </div>

        </div>
        
<script>

document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');

    form.addEventListener('submit', function(event) {
        // 요소 선택
        const dateInput = document.getElementById('dateInput');
        const timeInput = document.getElementById('timeInput');
        const keywordsInput = document.getElementById('keywordsInput');
        const themList = document.querySelector('.them_list');
        const main = document.getElementById('them_li_f');

        // 키워드가 선택되었는지 확인
        const keywordsSelected = keywordsInput.value && !themList.contains(main);

        // 모든 조건 확인
        if (!dateInput.value) {
            event.preventDefault();
            alert('날짜를 선택해 주세요.');
        } else if (!timeInput.value) {
            event.preventDefault();
            alert('시간대를 선택해 주세요.');
        } else if (!keywordsSelected) {
            event.preventDefault();
            alert('키워드를 선택해 주세요.');
        } else {
            // 모든 조건이 충족되면 폼이 제출됨
            console.log('폼이 제출되었습니다.');
        }
    });
});

cal_btn.addEventListener('click', function() {
    const popup = window.open("rsCalendar2", "CalendarPopup", "width=800,height=700,scrollbars=yes,resizable=yes");

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
                    const dateInput = popup.document.getElementById("dateInput");
                    if (dateInput) {
                        dateInput.value = data; // 값 설정
                    } else {
                        console.error("dateInput 요소를 찾을 수 없습니다.");
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
dropdownIcon.addEventListener('click', function() {
    const popup = window.open("timeselect", "CalendarPopup", "width=840,height=700,scrollbars=yes,resizable=yes");

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
                    const dateInput = popup.document.getElementById("dateInput");
                    if (dateInput) {
                        dateInput.value = data; // 값 설정
                    } else {
                        console.error("dateInput 요소를 찾을 수 없습니다.");
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
document.querySelector('.theme_cho').addEventListener('click', function() {
    const popup = window.open("kwselect.html", "KeywordSelectPopup", "width=800,height=700,scrollbars=yes,resizable=yes");

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
                    const dateInput = popup.document.getElementById("dateInput");
                    if (dateInput) {
                        dateInput.value = data; // 값 설정
                    } else {
                        console.error("dateInput 요소를 찾을 수 없습니다.");
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
            	localStorage.clear(); // 로컬 스토리지 비우기
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

cal_btn.addEventListener('click', function() {
    const popup = window.open("rsCalendar2", "CalendarPopup", "width=800,height=700,scrollbars=yes,resizable=yes");

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
                    const dateInput = popup.document.getElementById("dateInput");
                    if (dateInput) {
                        dateInput.value = data; // 값 설정
                    } else {
                        console.error("dateInput 요소를 찾을 수 없습니다.");
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


//선택된 키워드를 them_list에 추가하고, hidden input에 저장하는 함수
function addKeywordsToParent(selectedKeywords) {
    const themList = document.querySelector('.them_list');
    const keywordsInput = document.getElementById('keywordsInput');
    const main = document.getElementById('them_li_f');

    // 기존 리스트 초기화
    	themList.innerHTML ='';
    const keywordsArray = []; // 선택된 키워드를 담을 배열

    selectedKeywords.forEach(({ tagName }) => {
        const listItem = document.createElement('li');
        listItem.innerHTML = "<a>" + tagName + "</a>"; // tagName 추가
        themList.appendChild(listItem);
        keywordsArray.push(tagName); // 배열에 추가
    });

    if (!themList.contains(main)) {
        // 배열을 문자열로 변환하여 hidden input에 설정
        keywordsInput.value = keywordsArray.join(','); // 예: "키워드1,키워드2"
    }
}



</script>
