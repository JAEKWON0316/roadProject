<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String selectedDate = request.getParameter("selectedDate");
String selectedDate2 = request.getParameter("selectedDate2");
String selectedTime = request.getParameter("selectedTime");
String personCount = request.getParameter("personCount");
String selectedKeywords = request.getParameter("keywords");

System.out.println("1. "+selectedDate+", 2. "+selectedTime+", 3. "+personCount+", 4. "+selectedKeywords+", 5. "+selectedDate2);
%>
<div id="containerA">
        
            <div class="aside_content">
                <div class="aside_top">
                     
                    <div class="row_main1_sub_inputBox">
                        <input type="text" placeholder="원하는 스페이스를 검색해보세요"> 
                    </div>
                    <div class="info">
                        <div class="frame29554">정확한 정보를 위해 위치 정보 제공에 동의해주세요!</div>
                        <a href="#" class="agree">위치 정보 제공 동의하기</a>
                    </div>
                    <div class="search">
                        <div class="frame29617">
                            <div class="search_title">
                                <img src="../resources/images/icons _ emoji/Person Tipping Hand.png" class="here" alt="here">
                                <p>경기도 김포시</p>
                            </div>
                            <div class="smalltab">
                           
                                <div class="btn_token">
                                    상세 옵션 설정
                                    <img src="../resources/images/Filter_alt.png" class="filtertab" alt="filtertab">
                                </div>
                            </div>
                        </div>
                        <div id="rs_table">
                        	<div id="rs_date">
                        		<img src="../resources/images/Calendar_light.png">
                        		<label><%= selectedDate != null ? selectedDate : "날짜를 선택하세요." %></label>
                        	</div>
                        	<div id="rs_person">
                        		<img src="../resources/images/User_light.png">
                        		<label><%= personCount != null ? personCount + "명" : "인원 수를 선택하세요." %></label>
                        		<img src="../resources/images/Expand_down_light.png">
                        	</div>
                        	<div id="rs_them">
                        		<label><%= selectedKeywords != null ? selectedKeywords : "카테고리를 선택하세요." %></label>
                        		<img src="../resources/images/Expand_down_light.png">
                        	</div>
                        	<div id="rs_time">
                        		<div id="rs_time1">
                        			<label><%= selectedTime != null ? selectedTime : "시간을 선택하세요." %></label>
                        			<img src="../resources/images/Expand_down_light.png">
                        		</div>
                        		~
                        		<div id="rs_time2">
                        			<label><%= selectedTime != null ? selectedTime : "시간을 선택하세요." %></label>
                        			<img src="../resources/images/Expand_down_light.png">
                        		</div>
                        	</div>
                        	<div id="rsbtnF">
                        		<div class="resetrs" id="resetrs" onclick="resetSettings()" style="cursor:pointer;">
                        			설정초기화
                        		</div>
                        		<div class="okrs" style="cursor:pointer;">
                        			설정하기
                        		</div>
                        	</div>
                        </div>
                        <div class="btntab_none">
                            <div class="filtercheck">
                                <span class="checkred">추천순</span><img src="../resources/images/Ellipse 68.png" class="checkone" alt="check"><span>이름순</span>
                                <img src="../resources/images/Ellipse 68.png" class="checkone" alt="check"><span>거리순</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p id="map_test">{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">{카테고리}</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p>{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">카페</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="spaceinfo">
                        <div class="checkbox">
                            <div class="contentinfo">
                                <div class="frameinfo">
                                    <div class="frameinfosec">
                                        <p>{상호명}</p>
                                    </div>
                                    <div class="frameinfotag">카페</div>
                                </div>
                                <div class="frameaddr">
                                    <span class="addr">인천광역시 부평구 부평대로</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>36.4km</span>
                                    <img src="../resources/images/Ellipse 67.png" class="ellipse67">
                                    <span>리뷰 100개</span>
                                </div>
                                <div class="photoframe">
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                    <div class="photo"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
                   <div id="map_con" style="width: 1332px;height: 1080px;">
    	
    </div>
        </div>
 
    
<script>
    function resetSettings() {
        // rs/reservation_main으로 이동
        window.location.href = "../rs/reservation_main";
    }
</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfGdSpW5kn_kMbCCsaJNyBiJLOnvEMkTU&callback=myMap"></script>