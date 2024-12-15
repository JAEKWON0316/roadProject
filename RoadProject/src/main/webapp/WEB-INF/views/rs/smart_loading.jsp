<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스마트 예약 - 로딩</title>
    <link rel="stylesheet" href="../resources/css/smartcs.css">
    <%
    String uname = (String) session.getAttribute("nickname");
    String uphone = (String) session.getAttribute("phone");
%>
    <script>
    // 3초 후에 다음 페이지로 이동
    setTimeout(function() {
        const selectedKeywords = '<%= request.getParameter("keywords") != null ? request.getParameter("keywords") : "" %>';
        const personCount = '<%= request.getParameter("personCount") != null ? request.getParameter("personCount") : "1" %>'; // 기본값을 1로 설정
        window.location.href = "smart_ok?keywords=" + encodeURIComponent(selectedKeywords) + "&personCount=" + encodeURIComponent(personCount);
    }, 3000);
</script>
</head>
<body>
<div id="rscontainer">
    <!-- 1. 스마트 예약 옵션 로딩 창 -->
    <div id="option_loading">
        <div class="title">
            <p class="title"> <%= uname != null ? uname : "null" %>님이 선택한 조건으로 탐색 중이에요!</p>
            <p>잠시만 기다려주세요.</p>
        </div>
        <img src="../resources/images/loading.gif" alt="로딩중 아이콘">
    </div>
</div>
</body>
</html>
