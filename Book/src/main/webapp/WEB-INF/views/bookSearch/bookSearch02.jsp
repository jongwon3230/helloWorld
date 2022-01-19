<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<BR>
<h1>신작도서 목록</h1>
<BR>
<table border = "1">
<c:forEach var="bookList" items="${bookList }">
	<tr height="250px" align="center">
		<th width="220px" style="border: 1px solid black">그림</th>
		<th width="700px" style="text-align: center; border: 1px solid black">
			<h4 style="color: blue;">${bookList.title }</h4><br>
			<br> 저자 : ${bookList.writer }<br>
			<br> 출판사 : ${bookList.publisher }<br>
			<br> 발행년도 : ${bookList.reg_date }<br>
			<br> 대출여부 : ${bookList.inven }<br>
	</tr>
</c:forEach>
</table>
