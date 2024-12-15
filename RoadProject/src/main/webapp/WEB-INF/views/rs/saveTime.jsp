<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String selectedTime = request.getParameter("selectedTime");
    if (selectedTime != null) {
        session.setAttribute("selectedTime", selectedTime); // 세션에 시간 저장
        System.out.println("시간 저장 완료 : " + session.getAttribute("selectedTime"));
    } else {
        System.out.println("시간 저장 실패");
    }
%>
<!-- 이후 페이지로 리다이렉트 -->
<script>
    // 팝업이 열린 부모 창을 새로고침하고 팝업을 닫기
    window.opener.location.reload(); // 부모 창 새로고침
    window.close(); // 팝업 닫기
</script>