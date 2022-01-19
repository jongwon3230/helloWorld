<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${userRentalList.size() != 0 }">
<table border="1">
	<tr height="50px;">
	<th width="450px;">책 제목</th>
	<th width="100px;">대여일</th>
	<th width="100px;">반납예정일</th>
	</tr>
	<c:forEach items="${userRentalList }" var="userRentalList">
	<tr height="50px;">
	<td>${userRentalList.title }</td>
	<td>${userRentalList.start_date }</td>
	<td>${userRentalList.deadline }</td>
	</tr>
	
</c:forEach>
</table>
</c:if>
<c:if test="${userRentalList.size() == 0 }">
	<h2>대출내역이 없습니다.</h2>
</c:if>