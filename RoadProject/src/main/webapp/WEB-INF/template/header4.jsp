<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/reservation_index.css">
    <link rel="stylesheet" href="../resources/css/rsCal.css">
    <link rel="stylesheet" href="../resources/css/rs_popup.css">
    <link rel="stylesheet" href="../resources/css/speedrs.css">
        <link rel="stylesheet" href="../resources/css/openrun_popup.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="../resources/js/jquery.min.js"></script>        
<script src="../resources/js/script.js"></script>
<script src="../resources/js/rsCal.js"></script>
<%
	String uname = (String) session.getAttribute("nickname");
	String uphone = (String) session.getAttribute("phone");
	
	System.out.println("name : "+uname+", uphone : "+uphone);
%>
</head>
<body>
<div class="header">
    <div class="toolbar">
        <div class="logoBox"><a href="../index.html"><img id="logo" src="../resources/images/LOGO.png" alt="logo"></a></div>

        <%
       		Integer role = (Integer) session.getAttribute("role");
        
        	if(role != null){
        	if(role == 1){
        %>
            <div class="hdtextBox">
            	            	<div><img src="../resources/images/icons _ emoji/Person Running.png" alt="map">스피드 예약하기</div>
            	<div id="line"></div>
            	<div><img src="../resources/images/icons _ emoji/Magic Wand.png" alt="Calendar">스마트 예약하기</div>
        	</div>
        	
        	<div class="loginBox">
        		<img src="../resources/images/icons _ emoji/Hugging Face.png" alt="hugging face"><a href="../myPage.html">마이페이지</a>
        		<div id="line"></div>
        		<a href="../logout">로그아웃</a>	
        	</div>
        <%
        			
        	}
        	else if(role == 2){
        %>
        	<div class="loginBox">
        		<img src="../resources/images/icons _ emoji/Camping.png" alt="Camping.png"><a href="partnerPage.html">마이 스페이스</a>
        		<div id="line"></div>
        		<a href="logout">로그아웃</a>
        	</div>		
        <%
        	}
        	else if(role == 99){
        %>
        	<div class="hdtextBox">
            	            	<div><img src="../resources/images/icons _ emoji/Person Running.png" alt="map">스피드 예약하기</div>
            	<div id="line"></div>
            	<div><img src="../resources/images/icons _ emoji/Magic Wand.png" alt="Calendar">스마트 예약하기</div>
        	</div>
        	
        	<div class="loginBox">
        		<img src="../resources/images/icons _ emoji/Hugging Face.png" alt="hugging face"><a href="admin/adminPage">관리페이지</a>	
        		<div id="line"></div>
        		<a href="logout">로그아웃</a>
        	</div>		
        <%
        	}
        	}
            else{
        %>
        	<div class="hdtextBox">
            	<div><img src="../resources/images/icons _ emoji/Person Running.png" alt="map">스피드 예약하기</div>
            	<div id="line"></div>
            	<div><img src="../resources/images/icons _ emoji/Magic Wand.png" alt="Calendar">스마트 예약하기</div>
        	</div>
        	
        	<div class="loginBox">
        		<img src="../resources/images/icons _ emoji/Hugging Face.png" alt="hugging face"><a href="../login.html">로그인</a>
        	</div>
        <%
            }
        %>
    </div>
</div>