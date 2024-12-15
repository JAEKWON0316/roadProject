document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const dateInput = document.getElementById('dateInput');
    const calendarElement2 = document.getElementById("calendar2");
    const monthTitle2 = document.getElementById("monthTitle2");
    const prevBtn2 = document.getElementById("prevBtn2");
    const nextBtn2 = document.getElementById("nextBtn2");
    const todayLink2 = document.getElementById("todayLink2");

    let currentDate2 = new Date();
    let firstDateSelected = false; // 첫 번째 날짜 선택 여부
    let selectedStartDateElement = null; // 첫 번째 선택된 날짜 요소 저장
    let selectedEndDateElement = null; // 두 번째 선택된 날짜 요소 저장
    let clickCount = 0; // 클릭 횟수

    function getTodayDate() {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }

    function renderCalendar() {
        const year = currentDate2.getFullYear();
        const month = currentDate2.getMonth();
        const today = new Date();

        monthTitle2.innerText = `${year}년 ${month + 1}월`;

        // Clear previous calendar
        calendarElement2.innerHTML = '';

        const firstDay = new Date(year, month, 1).getDay();
        const lastDate = new Date(year, month + 1, 0).getDate();

        const days = [];
        for (let i = 0; i < firstDay; i++) {
            days.push('<li class="no_day gray"><a href="#"></a></li>'); // 빈 공간 추가
        }
        for (let date = 1; date <= lastDate; date++) {
            const currentDay = new Date(year, month, date);
            const isToday = currentDay.toDateString() === today.toDateString();
            const isPastDate = currentDay < today && !isToday;

            if (isPastDate) {
                days.push(`<li class="past" style="color: #ccc; pointer-events: none; opacity: 0.6;"><a href="#" class="date-item disabled">${date}</a></li>`); // 비활성화된 날짜
            } else {
                const isSelectedStart = selectedStartDateElement && selectedStartDateElement.getAttribute('data-date') === `${year}-${month + 1}-${date}`;
                const isSelectedEnd = selectedEndDateElement && selectedEndDateElement.getAttribute('data-date') === `${year}-${month + 1}-${date}`;
                const selectedClass = isSelectedStart ? 'selected' : isSelectedEnd ? 'selected' : '';
                
                days.push(`<li class="${isToday ? 'today' : 'white'}"><a href="#" class="date-item ${selectedClass}" data-date="${year}-${month + 1}-${date}">${date}</a></li>`);
            }
        }

        // 마지막 주 조정
        while (days.length % 7 !== 0) {
            days.push('<li class="no_day gray"><a href="#"></a></li>'); // 비어있는 공간 추가
        }

        const weeks = [];
        for (let i = 0; i < days.length; i += 7) {
            weeks.push(`<ul class="week">${days.slice(i, i + 7).join('')}</ul>`);
        }

        calendarElement2.innerHTML = weeks.join('');

        // 날짜 선택 이벤트 리스너 추가
        calendarElement2.querySelectorAll('.date-item').forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 링크 동작 방지
                const selectedDate = this.getAttribute('data-date'); // data-date 속성에서 가져오기
                const [year, month, day] = selectedDate.split('-');

                console.log('선택된 날짜:', selectedDate); // 로그 추가
                clickCount++; // 클릭 횟수 증가

                const todayDate = getTodayDate(); // 오늘 날짜 구하기
                const parentLi = this.parentElement; // <li> 요소 선택

                

                if (clickCount === 1) {
                    // 첫 번째 날짜 선택 시
                    const startDate = `${year}-${month}-${day}`;
                    localStorage.setItem('selectedStartDate', startDate);
                    console.log('시작 날짜 저장:', startDate);
                    this.classList.add('selected'); // 선택된 스타일 추가
                    selectedStartDateElement = this; // 현재 선택된 시작 날짜 요소 저장
                    firstDateSelected = true; // 첫 번째 날짜가 선택되었음을 기록
                      // 오늘 날짜 스타일 변경 로직
                calendarElement2.querySelectorAll('.date-item').forEach(dateItem => {
                    const dateValue = dateItem.getAttribute('data-date');
                    console.log('날짜 값:', dateValue); // 로그 추가

                    if (dateValue === todayDate) {
                        const parentLi = dateItem.parentElement; // <li> 요소 선택
                        if (parentLi) {
                            parentLi.classList.remove('today'); // 'today' 클래스 제거
                            parentLi.classList.add('no-today'); // 'no-today' 클래스 추가
                            parentLi.style.background = 'transparent'; // 배경을 투명하게 설정
                            console.log("LI 스타일 변경 완료");
                        } else {
                            console.error('부모 <li> 요소를 찾을 수 없음');
                        }
                    }
                });
                    
                } else if (clickCount === 2) {
                     // 두 번째 날짜 선택 시
                    const endDate = `${year}-${month}-${day}`;
                    localStorage.setItem('selectedEndDate', endDate);
                    console.log('종료 날짜 저장:', endDate);
                    this.classList.add('selected'); // 선택된 스타일 추가
                    selectedEndDateElement = this; // 현재 선택된 종료 날짜 요소 저장

                    // 두 날짜가 모두 선택된 경우, localStorage에 선택된 날짜 업데이트
                    const startDate = localStorage.getItem('selectedStartDate');
                    if (startDate && endDate) {
                        localStorage.setItem('selectedDate', `${startDate} ~ ${endDate}`); // 선택된 날짜 업데이트
                    }
                    
                    
                    
              
                } else if (clickCount === 3) {
                    // 모든 선택된 날짜에서 'selected' 클래스 제거
                    calendarElement2.querySelectorAll('.date-item').forEach(dateItem => {
                        dateItem.classList.remove('selected');
                        dateItem.classList.remove('between'); // 모든 선택 스타일 제거
                    });

                    // 클릭 초기화
                    clickCount = 1; // 클릭 횟수 초기화
                    selectedStartDateElement = this; // 새로운 시작 날짜로 설정
                    this.classList.add('selected'); // 선택 스타일 추가
                    localStorage.setItem('selectedStartDate', selectedDate); // 시작 날짜 저장
                }
                
                // 사이에 있는 날짜에 'between' 클래스 추가
                const startDate = new Date(localStorage.getItem('selectedStartDate'));
                const endDate = new Date(selectedDate);

                // 시작 날짜와 종료 날짜의 날짜 객체로 변환
                const [startYear, startMonth, startDay] = localStorage.getItem('selectedStartDate').split('-').map(Number);
                const [endYear, endMonth, endDay] = selectedDate.split('-').map(Number);

                const start = new Date(startYear, startMonth - 1, startDay + 1);
                const end = new Date(endYear, endMonth - 1, endDay);

                calendarElement2.querySelectorAll('.date-item').forEach(dateItem => {
                    const dateValue = new Date(dateItem.getAttribute('data-date'));
                    // 시작과 종료 날짜 사이의 날짜에 'between' 클래스 추가 (시작과 종료 제외)
                    if (dateValue > start && dateValue < end) {
                        dateItem.classList.add('between'); // 'between' 클래스 추가
                    }
                });
            });
        });
    }

    prevBtn2.addEventListener('click', () => {
        currentDate2.setMonth(currentDate2.getMonth() - 1);
        renderCalendar();
    });

    nextBtn2.addEventListener('click', () => {
        const startDate = localStorage.getItem('selectedStartDate');
        const endDate = localStorage.getItem('selectedEndDate');

        if (startDate && endDate) {
            // 부모 페이지에 날짜 업데이트
            if (window.opener) {
                if (dateInput) {
                    dateInput.value = `${startDate} ~ ${endDate}`;
                    console.log('부모 페이지에 날짜 업데이트:', dateInput.value);
                } else {
                    console.error('부모 페이지에서 dateInput 요소를 찾을 수 없습니다.');
                }
            }
            window.close(); // 팝업 닫기
        } else {
            alert('시작 및 종료 날짜를 모두 선택해 주세요.'); // 날짜가 선택되지 않은 경우 경고
        }
    });

    todayLink2.addEventListener('click', (event) => {
        event.preventDefault(); // 기본 링크 동작 방지
        currentDate2 = new Date(); // 현재 날짜로 설정
        renderCalendar(); // 달력 다시 렌더링
    });

    // Initial render
    renderCalendar();

});
