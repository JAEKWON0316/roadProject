<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String selectedDate = (String) session.getAttribute("selectedDate");
    if (selectedDate != null) {
        out.print(selectedDate); // 세션 값 반환
    } else {
        out.print("값이 없습니다.");
    }
%>
