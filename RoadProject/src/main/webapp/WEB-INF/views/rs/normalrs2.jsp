<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String selectedDate = (String) session.getAttribute("selectedDate"); // 세션에서 날짜 값 가져오기
    System.out.println("세션에 저장된 날짜 : "+selectedDate);
    
    String selectedTime = (String) session.getAttribute("selectedTime");
    System.out.println("세션에 저장된 시간 : "+selectedTime);
    
    int personCount = request.getParameter("personCount") != null ? Integer.parseInt(request.getParameter("personCount")) : 1; // 기본값 1
    int pricePerPerson = 2000; // 1인당 예약금
    int totalPrice = personCount * pricePerPerson; // 총합 계산
    System.out.println("확인용 : "+request.getParameter("personCount"));
    System.out.println("인원 : "+personCount);
    System.out.println("총 금액 : "+totalPrice);
%>
<form id="reservationForm" method="post" action="normalrs_ok"> <!-- 폼 시작 -->
    <div id="rscontainer">
        <div class="div">
            <div class="content">
                <div class="div1">일반 예약</div>
                <div class="forminput-parent">
                    <div class="forminput">
                        <div class="tokenlabel">
                            <div class="label">예약자 성명</div>
                            <div class="div2">*</div>
                        </div>
                        <div class="input-box">
                            <div class="input-box-token">
                                <div class="input-token">
                                    <div class="text">홍길동</div>
                                </div>
                                <img class="calendar-light-icon" alt="" src="../resources/images/icons/Calendar_light.png">
                            </div>
                        </div>
                    </div>

                    <!-- 예약자 전화번호 입력 필드 -->
                    <div class="forminput1">
                        <div class="tokenlabel">
                            <div class="label">예약자 전화번호</div>
                            <div class="div2">*</div>
                        </div>
                        <div class="input-box">
                            <div class="input-box-token">
                                <div class="input-token">
                                    <div class="text">010-1234-7422</div>
                                </div>
                                <img class="calendar-light-icon" alt="" src="../resources/images/icons/Expand_down_light.png">
                            </div>
                        </div>
                    </div>

                    <!-- 결제 수단 선택 -->
                    <div class="frame-child"></div>
                    <div class="div4">
                        <div class="tokenlabel2">
                            <div class="label">결제 수단 선택</div>
                            <div class="div2">*</div>
                        </div>
                        <div class="parent">
                            <div class="div6">
                                <input type="radio" class="radio-input" id="creditCard" name="paymentMethod" value="creditCard">
                                <label for="creditCard" class="radio-label div8">신용 카드</label>
                            </div>
                            <div class="div6">
                                <input type="radio" class="radio-input" id="mobilePayment" name="paymentMethod" value="mobilePayment">
                                <label for="mobilePayment" class="radio-label div8">휴대폰 결제</label>
                            </div>
                            <div class="div6">
                                <input type="radio" class="radio-input" id="kakaoPay" name="paymentMethod" value="kakaoPay">
                                <label for="kakaoPay" class="radio-label div8">카카오페이</label>
                            </div>
                        </div>
                    </div>

                    <!-- 예약금 및 총합 -->
                    <div class="frame-child"></div>
                    <div class="frame-wrapper">
                        <div class="group">
                            <div class="div8">예약금</div>
                            <div class="container1">
                                <div class="div8">1인당 </div>
                                <div class="div17"><%= pricePerPerson %>원</div>
                            </div>
                        </div>
                    </div>
                    <div class="frame-child"></div>
                    <div class="frame-wrapper">
                        <div class="group">
                            <div class="div8"></div>
                            <div class="container1">
                                <div class="div8">총합</div>
                                <div class="div20"><%= totalPrice %>원</div>
                            </div>
                        </div>
                    </div>

                    <!-- 동의 체크박스 -->
                    <div class="div21">
                        <div class="parent2">
                            <div class="div8"></div>
                            <div class="wrapper">
                                <div class="div23">본 예약금은 가게 내에서 차감 형식으로 사용되며, 이후 환불이나 노쇼로 인한 환불 또한 불가능합니다.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 추가 정보 및 동의 체크박스 -->
                <div class="img">
                    <div class="container2">
                        <img class="../info-alt-light-icon" alt="" src="resources/images/Info_alt_red.png">
                        <div class="div24">노쇼 방지를 위해 해당 가게는 예약금을 결제해야 예약 완료가 됩니다.</div>
                    </div>
                    <div class="check-text">
                        <input type="checkbox" id="agreement" class="checkbox-input" required>
                        <label for="agreement" class="checkbox-label">
                            <span class="text2">위 사항에 동의</span>
                        </label>
                    </div>
                </div>

                <!-- 버튼 -->
                <div class="btn">
                    <div class="small-btn-for-madal">
                        <div class="btn-token">
                            <div class="text3">취소하기</div>
                        </div>
                    </div>
                    <div class="small-btn-for-madal1">
                        <div class="btn-token1">
                            <div class="text3" onclick="document.getElementById('reservationForm').submit();">예약하기</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
        <script>
        window.addEventListener('DOMContentLoaded', (event) => {
            const agreeCheckbox = document.getElementById('agreement');
            const radioButtons = document.querySelectorAll('input[name="paymentMethod"]');
            const submitButton = document.querySelector('.small-btn-for-madal1 .btn-token1');

            // 초기 상태 체크
            updateCheckboxState();

            // 라디오 버튼 선택 시 체크박스 상태 업데이트
            radioButtons.forEach(radio => {
                radio.addEventListener('change', updateCheckboxState);
            });

            // 체크박스 상태에 따라 제출 버튼 비활성화
            agreeCheckbox.addEventListener('change', toggleSubmitButton);

            function updateCheckboxState() {
                // 라디오 버튼 중 하나라도 선택되었는지 확인
                const isSelected = Array.from(radioButtons).some(radio => radio.checked);
                
                if (isSelected) {
                    agreeCheckbox.disabled = false; // 체크박스 활성화
                } else {
                    agreeCheckbox.disabled = true; // 체크박스 비활성화
                    agreeCheckbox.checked = false; // 체크 해제
                }
                
                toggleSubmitButton();
            }

            function toggleSubmitButton() {
                // 체크박스가 체크되었는지 확인
                submitButton.style.pointerEvents = agreeCheckbox.checked ? 'auto' : 'none'; // 클릭 가능 여부 설정
                submitButton.style.opacity = agreeCheckbox.checked ? '1' : '0.5'; // 버튼 투명도 설정
            }

            // 예약하기 버튼 클릭 시 폼 제출
            submitButton.addEventListener('click', function(event) {
                const isSelected = Array.from(radioButtons).some(radio => radio.checked); // 결제 수단 선택 여부 확인
                const isKakaoPaySelected = document.getElementById('kakaoPay').checked; // 카카오페이 체크 여부 확인

                if (isKakaoPaySelected) {
                    // 카카오페이가 선택된 경우 speedrs_fail로 이동
                    window.location.href = 'normalrs_fail'; 
                } else if (isSelected && agreeCheckbox.checked) { // 결제 수단이 선택되었고 체크박스도 체크된 경우
                    document.getElementById('reservationForm').submit(); // 폼 제출
                } else {
                    event.preventDefault(); // 폼 제출 중단
                    if (!isSelected) {
                        alert('결제 수단을 선택해 주세요.'); // 결제 수단 선택하지 않은 경우 알림
                    } else {
                        alert('위 사항에 동의해 주세요.'); // 체크박스가 체크되지 않은 경우 알림
                    }
                }
            });
        });

        document.querySelector('.text3').addEventListener('click', function() {
            window.location.href = 'normalrs';
        });



        </script>
        