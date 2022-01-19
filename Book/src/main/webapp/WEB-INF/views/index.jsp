<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<section>
	<img alt="" src="/image/background.jpg"
		style="width: 100%; height: 640px;">
		
	<div id = "directMenu" style="width: 80%; height: 260px; text-align: center;  margin-left: 10%;">
		<ul style="list-style-type: none;">
			<li><img alt="" src="/image/icon01.png"><br>도서 검색</li>
			<li><img alt="" src="/image/icon02.png"><br>대출 및 반납 조회</li>
			<li><img alt="" src="/image/icon03.png"><br>도서 기증</li>
			<li><img alt="" src="/image/icon04.png"><br>전자책</li>
		</ul>
	</div>
	<hr>
	<div>
		<!-- 메인페이지 공지사항 -->
		<div
			style="margin-top: 10px; height: 700px; width: 600px; border: 1px solid black; margin-left: 15%; display: inline-block;">
			공지사항 영역</div>

		<!-- 이달의도서, 추천도서. -->
		<div style="margin-top: 10px; height: 700px; width: 35%; border: 1px solid black; display: inline-block; float: right; margin-right: 15%; text-align: center;">
			<img alt="" src="/image/monthPickImg.png"><br><br>
			
				<c:forEach var="bookList" items="${bookList }">
					<h2>${bookList.title }</h2>
					저자 : ${bookList.writer }<br>
					출판사 : ${bookList.publisher }<br><br>
				</c:forEach>
			
			
		</div>
	</div>
</section>
	<jsp:include page="footer.jsp"/>

