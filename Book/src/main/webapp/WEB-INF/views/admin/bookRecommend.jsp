<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
<br><br>

<h1>추천도서 목록</h1>

<form action = "/cancleRecommend">
<table style="margin: auto;" border="1">
	<tr>
		<th>번호</th>
		<th>책 제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>발행일</th>
		<th>카테고리</th>
		<th>타입</th>
		<th>대출가능여부</th>
		<th><input type = "checkbox" id = "totalCheck" onclick="allCheck()"> </th>
	</tr>
	<c:forEach var="recommendBookList" items="${recommendBookList }">
		<tr>
			<td>${recommendBookList.book_idx }</td>
			<td style="width: 200px;">${recommendBookList.title }</td>
			<td>${recommendBookList.writer }</td>
			<td>${recommendBookList.publisher }</td>
			<td>${recommendBookList.reg_date }</td>
			<td>${recommendBookList.categori }</td>
			<td>${recommendBookList.type }</td>
			<td>${recommendBookList.inven }</td>
			<td><input type = "checkbox" value = "${recommendBookList.book_idx }" name = "rcheck"> </td>
		</tr>

	</c:forEach>
	<tr>
		<td colspan="9" align="right"><input type = "submit"  value = "추천도서해제"></td>
	</tr>
</table>
</form>
<i class="fas fa-chevron-left"></i>
<i class="fas fa-chevron-right"></i>
</section>
