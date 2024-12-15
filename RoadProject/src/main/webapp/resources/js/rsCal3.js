document.addEventListener('DOMContentLoaded', function() {
    const calendarElement = document.getElementById("calendar");
    const monthTitle = document.getElementById("monthTitle");
    const todayText = document.getElementById("today");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    const todayLink = document.getElementById("todayLink");

    let currentDate = new Date();

    function renderCalendar() {
        const year = currentDate.getFullYear();
        const month = currentDate.getMonth();
        const today = new Date();

        monthTitle.innerText = `${year}년 ${month + 1}월`;
        

        // Clear previous calendar
        calendarElement.innerHTML = '';

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
                days.push(`<li class="${isToday ? 'today' : 'white'}"><a href="#" class="date-item">${date}</a></li>`);
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

        calendarElement.innerHTML = weeks.join('');

        calendarElement.addEventListener('click', (event) => {
            const target = event.target;
            if (target.classList.contains('date-item') && !target.classList.contains('disabled')) {
                const selectedDate = `${year}.${month + 1}.${target.textContent.padStart(2, '0')}`; // YYYY.MM.DD 형식
                window.location.href = `rsCalendar2?date=${encodeURIComponent(selectedDate)}`; // 페이지 전환
            }
        });
    }

    prevBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });

    nextBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });

    todayLink.addEventListener('click', (event) => {
        event.preventDefault(); // 기본 링크 동작 방지
        currentDate = new Date(); // 현재 날짜로 설정
        renderCalendar(); // 달력 다시 렌더링
    });

    // Initial render
    renderCalendar();
});
