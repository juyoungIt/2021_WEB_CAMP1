<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<style>
h1 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#edit {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#edit td {
  border: 1px solid #ddd;
  padding: 8px;
}

table,
th,
td {
	text-align: center;
}

.first {
	width: 20%;
	background-color: gold;
	color: white;
}
</style>
</head>
<body>
<h1>글 수정하기</h1>
<form:form commandName="u" method="POST" action="../editok">
	<form:hidden path="req_id"/>
	<table id="edit">
		<tr><td class="first">(국문) 성</td><td><form:input path="kor_first_name" /></td></tr>
		<tr><td class="first">(국문) 이름</td><td><form:input path="kor_last_name" /></td></tr>
		<tr><td class="first">(eng) first name</td><td><form:input path="eng_first_name" /></td></tr>
		<tr><td class="first">(eng) last name</td><td><form:input path="eng_last_name" /></td></tr>
		<tr><td class="first">생년월일</td><td><form:input path="birth_date" /></td></tr>
		<tr><td class="first">전화번호</td><td><form:input path="phone" /></td></tr>
		<tr><td class="first">주소</td><td><form:input path="address" /></td></tr>
	</table>
	<input type="submit" value="수정하기" />
	<input type="button" value="취소하기" onclick="history.back()" />
</form:form>
</body>
</html>