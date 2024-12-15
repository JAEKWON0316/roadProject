<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/smartcs.css">
</head>
<body>
<div id="keyword">
        <div class="title">
            <p>키워드 설정</p>
        </div>
        <div class="input">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                <circle cx="7.3335" cy="7.33331" r="4" stroke="#222222"/>
                <path d="M13.3335 13.3333L11.3335 11.3333" stroke="#222222" stroke-linecap="round"/>
                </svg>
            <input type="text" placeholder="원하는 키워드를 입력해보세요">
        </div>
        <ul class="keywords_list">
            <li class="keyword" data-tag="tag name1"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name1}</li>
            <li class="keyword" data-tag="tag name2"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name2}</li>
            <li class="keyword" data-tag="tag name3"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name3}</li>
            <li class="keyword" data-tag="tag name4"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name4}</li>
            <li class="keyword" data-tag="tag name5"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name5}</li>
                        <li class="keyword" data-tag="tag name6"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name6}</li>
            <li class="keyword" data-tag="tag name7"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name7}</li>
            <li class="keyword" data-tag="tag name8"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name8}</li>
            <li class="keyword" data-tag="tag name9"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name9}</li>
                        <li class="keyword" data-tag="tag name10"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name10}</li>
            <li class="keyword" data-tag="tag name11"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name11}</li>
            <li class="keyword" data-tag="tag name12"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name12}</li>
            <li class="keyword" data-tag="tag name13"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name13}</li>
                        <li class="keyword" data-tag="tag name14"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name14}</li>
            <li class="keyword" data-tag="tag name15"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name15}</li>
            <li class="keyword" data-tag="tag name16"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name16}</li>
            <li class="keyword" data-tag="tag name17"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name17}</li>
                        <li class="keyword" data-tag="tag name18"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name18}</li>
            <li class="keyword" data-tag="tag name19"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name19}</li>
            <li class="keyword" data-tag="tag name20"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name20}</li>
            <li class="keyword" data-tag="tag name21"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name21}</li>
                        <li class="keyword" data-tag="tag name22"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name22}</li>
            <li class="keyword" data-tag="tag name23"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name23}</li>
            <li class="keyword" data-tag="tag name24"><img src="../resources/images/icons _ emoji/Clapper Board.png" alt="Clapper Board">{tag name24}</li>
            
        </ul>
        <div class="keywords_select">
            <div class="num">
                <span>0</span><p>/5</p>
            </div>
            <ul class="list">
                
            </ul>
        </div>
        <div class="btn_list">
            <div class="second_btn small">취소</div>
            <div class="main_btn small">설정하기</div>
        </div>
    </div>
    <script>
    const keywords = document.querySelectorAll('.keyword');
    const numDisplay = document.querySelector('.num span');
    const selectedList = document.querySelector('.list');
    const maxKeywords = 5;

    keywords.forEach(keyword => {
        keyword.addEventListener('click', () => {
            const tagName = keyword.textContent.trim(); // 클릭한 키워드의 텍스트를 가져옴
            const isSelected = keyword.classList.toggle('on');
            const imgSrc = keyword.querySelector('img').src;

            console.log("tag : " + tagName);
            console.log("img : " + imgSrc);

            if (isSelected) {
                if (selectedList.children.length < maxKeywords) {
                    const listItem = document.createElement('li');
                    listItem.className = 'keyword on'; // 클래스 설정
                    listItem.innerHTML = "<img src='" + imgSrc + "' alt=''>" + tagName; // 원하는 형식으로 HTML 설정
                    selectedList.appendChild(listItem);
                    numDisplay.textContent = selectedList.children.length;
                } else {
                    keyword.classList.remove('on'); // 최대 개수 초과 시 선택 해제
                    alert("최대 5개의 키워드만 선택할 수 있습니다.");
                }
            } else {
            	// 선택 해제 시 리스트에서 태그 제거
                Array.from(selectedList.children).forEach((item) => {
                    const currentTagName = item.textContent.trim(); // 현재 리스트 항목의 태그 이름

                    console.log("Comparing:", tagName, "with:", currentTagName); // 비교 출력

                    if (tagName === currentTagName) { // 태그 이름 비교
                        console.log("Removing item:", item.innerHTML);
                        selectedList.removeChild(item);
                        numDisplay.textContent = selectedList.children.length;
                    }
                });
            }
        });
    });

    const saveButton = document.querySelector('.main_btn');
    saveButton.addEventListener('click', () => {
        const selectedKeywords = Array.from(selectedList.children).map(item => {
            const tagName = item.textContent.trim();
            const imgSrc = item.querySelector('img').src; // 이미지 소스 가져오기
            return { tagName, imgSrc }; // 객체 형태로 반환
        });
        window.opener.addKeywordsToParent(selectedKeywords); // 부모 함수 호출
        window.close(); // 팝업 닫기
    });



</script>
</body>
</html>