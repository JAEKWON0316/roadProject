<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/smart_map.css">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfGdSpW5kn_kMbCCsaJNyBiJLOnvEMkTU&callback=myMap" async defer></script>

<div id="rscontainer">
    <div class="smart_map_div">
        <div class="content">
            <div class="smart_map_div1">스마트 예약</div>
            <div class="smart_map_img">
                <div class="vdiv2">가고 싶은 동네를 선택하세요.</div>
            </div>
            <div class="smart_map_div3">
                <img class="smart_map_bg-icon" alt="" src="bg.png">
                <div class="smart_map_input-box-token">
                    <img class="smart_map_search-light-icon" alt="" src="../resources/images/icons/Search_light.png">
                    <input type="text" class="smart_map_input-token" placeholder="원하는 스페이스를 검색해보세요" />
                </div>
            </div>
            <div class="smart_map_check-text">
                <input type="checkbox" id="locationConsent" onchange="toggleSelectButton()" />
                <label for="locationConsent">실시간 위치 추적 동의</label>
            </div>
            <div class="smart_map_div1"></div>
            <div class="smart_map_btn">
                <div class="smart_map_small-btn-for-madal">
                    <div class="smart_map_btn-token" onclick="goBack()">
                        <div class="smart_map_text3">뒤로 가기</div>
                    </div>
                </div>
                <div class="small-btn-for-madal1">
                    <div id="selectButton" class="smart_map_btn-token1" onclick="selectSpace()">
                        <div class="smart_map_text3">선택하기</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function myMap() {
        var mapOptions = {
            center: new google.maps.LatLng(37.5665, 126.978), // 서울의 위도, 경도
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    }

    function goBack() {
        window.location.href = "reservation_main";
    }

    function selectSpace() {
        const checkbox = document.getElementById('locationConsent');
        if (checkbox.checked) {
            window.location.href = "smartrs";
        } else {
            alert('실시간 위치 추적에 동의해야 합니다.');
        }
    }

    function toggleSelectButton() {
        const checkbox = document.getElementById('locationConsent');
        const selectButton = document.getElementById('selectButton');
        if (checkbox.checked) {
            selectButton.style.pointerEvents = 'auto'; // 클릭 가능
            selectButton.style.opacity = '1'; // 불투명도 1
        } else {
            selectButton.style.pointerEvents = 'none'; // 클릭 불가능
            selectButton.style.opacity = '0.5'; // 불투명도 0.5
        }
    }

    // 초기 상태 설정
    toggleSelectButton();
</script>
