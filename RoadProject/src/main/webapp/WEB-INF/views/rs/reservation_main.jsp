<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/reservation_index.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="../resources/js/jquery.min.js"></script>        
<script src="../resources/js/script.js"></script>
<script src="../resources/js/rsCal.js"></script>
    <div id="containerM">
        
        <div class="rsmain">
            <img src="../resources/images/main.png" alt="main"> 
            <div class="rsMainbox1">
                <div class="rsMainlogoBox"><img src="../resources/images/Frame 1000002523.png" alt="logo"></div>
                <div class="MaininputBox">
                    <form action="#">
                        <div>
                        <img src="../resources/images/Search.png" alt="search">
                        <input type="text" name="search" id="search" placeholder="원하는 장소, 혹은 스페이스 입력">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="rsMainbox2">
                    <div>
                        <img src="../resources/images/symbol.png" alt="symbol">
                        Linkisy 선정 상반기 &nbsp;
                        <span>TOP 30</span> &nbsp;
                         스페이스
                         <img src="../resources/images/icons _ emoji/Eyes.png" alt="eyes">
                    </div>
                    <div class="rsbtnmain">
                    <div>
							<div class="rsbtnbox1">
								<div class="rsbtn1">전체 <span>30</span></div>
								<div class="rsbtns">{카테고리}<span>10</span></div>
								<div class="rsbtns">{카테고리}<span>2</span></div>
								<div class="rsbtns">{카테고리}<span>2</span></div>
								<div class="rsbtns">{카테고리}<span>2</span></div>
								<div class="rsbtns">{카테고리}<span>2</span></div>
							</div>
                    </div>
                    <div class="rsbtnbox2">
								<span>인기순</span>
								<img src="../resources/images/Ellipse 67.png" alt="small">
								이름순
								<img src="../resources/images/Ellipse 67.png" alt="small">
								거리순
							</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
										<img src="../resources/images/bookmark.png" alt="redmark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div id="storebtn1" class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1" id="store_waiting">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3" id="smart_map2">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rspagebox">
								<div class="rspageboxs">
									<img src="../resources/images/angle-double-left.png" alt="left double">
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-left.png" alt="left">
								</div>
								<div class="rspageboxs rspageboxs_active">
									1
								</div>
								<div class="rspageboxs ">
									2
								</div>
								<div class="rspageboxs">
									3
								</div>
								<div class="rspageboxs">
									4
								</div>
								<div class="rspageboxs">
									5
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-right-bold.png" alt="right">
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-double-right-bold.png" alt="right double">
								</div>
							</div>
        </div>
        
                <div class="rsMainbox2">
                    <div>
                        <img src="../resources/images/symbol.png" alt="symbol">
                        Linkisy 선정 상반기 &nbsp;
                        <span>TOP 30</span> &nbsp;
                         스페이스
                         <img src="../resources/images/icons _ emoji/Fire.png" alt="fire">
                    </div>
                    <div class="rsbtnmain">
                    <div>
							<div class="rsbtnbox1">
								<div class="rsbtn1">전체 <span>12</span></div>
								<div class="rsbtns">
									<img src="../resources/images/icons _ emoji/Clapper Board.png" alt="clboard">
									{tag name}
								</div>
								<div class="rsbtns">
									<img src="../resources/images/icons _ emoji/Clapper Board.png" alt="clboard">
									{tag name}
								</div>
								<div class="rsbtns">
									<img src="../resources/images/icons _ emoji/Clapper Board.png" alt="clboard">
									{tag name}
								</div>
								<div class="rsbtns">
									<img src="../resources/images/icons _ emoji/Clapper Board.png" alt="clboard">
									{tag name}
								</div>
								<div class="rsbtns">
									<img src="../resources/images/icons _ emoji/Clapper Board.png" alt="clboard">
									{tag name}
								</div>
							</div>
                    </div>
                    <div class="rsbtnbox2">
								<span>인기순</span>
								<img src="../resources/images/Ellipse 67.png" alt="small">
								이름순
								<img src="../resources/images/Ellipse 67.png" alt="small">
								거리순
							</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
										<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rsstorelist">
								<div class="storelist">
									<div class="listsq">
									<img src="../resources/images/bookmark (1).png" alt="mark">
									</div>
									<div class="listview">
										<div class="storesetting">
											<div class="storename">
												<span>가게명</span>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												<div>{카테고리}</div>
												<img src="../resources/images/Ellipse 67.png" alt="small">
												리뷰 100개
											</div>
											<div class="storerun">
												오픈런 시간
												<span>남은 시간까지 00:05:50</span>
											</div>
										</div>
										<div class="storedetail">
											<div class="storedetail1">
												분위기 좋은 24시 베이커리카페
											</div>
											<div class="storedetail2">
												경기도 김포시 장기동
												<img src="../resources/images/Ellipse 67.png" alt="small">
												031-123-1234
											</div>
										</div>
										<div class="storebtns">
											<div class="storebtn1">
												<img src="../resources/images/icons _ emoji/Person Running.png" alt="running">
												스피드예약
											</div>
											<div class="storebtn2">
												<img src="../resources/images/icons _ emoji/Spiral Calendar.png" alt="calendar">
												일반 예약
											</div>
											<div class="storebtn3">
												<img src="../resources/images/icons _ emoji/Magic Wand.png" alt="wand">
												스마트 예약
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="rspagebox">
								<div class="rspageboxs">
									<img src="../resources/images/angle-double-left.png" alt="left double">
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-left.png" alt="left">
								</div>
								<div class="rspageboxs rspageboxs_active">
									1
								</div>
								<div class="rspageboxs ">
									2
								</div>
								<div class="rspageboxs">
									3
								</div>
								<div class="rspageboxs">
									4
								</div>
								<div class="rspageboxs">
									5
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-right-bold.png" alt="right">
								</div>
								<div class="rspageboxs">
									<img src="../resources/images/angle-double-right-bold.png" alt="right double">
								</div>
							</div>
        </div>
   </div>