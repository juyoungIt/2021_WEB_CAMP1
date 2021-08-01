<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 추가하기</title>
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
	background-color: tomato;
	color: white;
}
</style>
</head>
<body>

<p>카카오뱅크 체크카드를 신청하기 위한 정보를 입력해주세요.</p>
<form action="addok" method="post">
	<table id="edit">
		<tr><td class="first">(국문) 성</td><td><input type="text" name="kor_first_name" /></td></tr>
		<tr><td class="first">(국문) 이름</td><td><input type="text" name="kor_last_name" /></td></tr>
		<tr><td class="first">(eng) first name</td><td><input type="text" name="eng_first_name" /></td></tr>
		<tr><td class="first">(eng) last name</td><td><input type="text" name="eng_last_name" /></td></tr>
		<tr><td class="first">생년월일</td><td><input type="text" name="birth_date" /></td></tr>
		<tr><td class="first">전화번호</td><td><input type="text" name="phone" /></td></tr>
		<tr><td class="first">주소</td><td><input type="text" name="address" /></td></tr>
	</table>
	<button type="button" onclick="location.href='list'">목록보기</button>
	<button type="submit">등록하기</button>
</form>

</body>
</html>