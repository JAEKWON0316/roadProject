<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String selectedDate = request.getParameter("selectedDate");
    String selectedTime = request.getParameter("selectedTime");
    String personCount = request.getParameter("personCount");
    String selectedKeywords = request.getParameter("selectedKeywords");

    if (selectedDate != null) {
        session.setAttribute("selectedDate", selectedDate);
    }
    if (selectedTime != null) {
        session.setAttribute("selectedTime", selectedTime);
    }
    if (personCount != null) {
        session.setAttribute("personCount", personCount);
    }
    if (selectedKeywords != null) {
        session.setAttribute("selectedKeywords", selectedKeywords);
    }
%>
