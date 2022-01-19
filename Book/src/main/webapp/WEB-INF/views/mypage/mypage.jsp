<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../top.jsp" />

<section>
	<div id="info" style="height: 180px; text-align: center;">
		<div id="info_image">
			<img alt="" src="/image/background2.jpg"
				style="height: 180px; width: 100%">
		</div>
		<div id="info_text" style="position: relative; bottom: 150px;">
			<h1>내 서재</h1>
			<br>
			<h5>${title }</h5>
		</div>
	</div>
	<div class="container">
		<div
			style="width: 240px; height: 1000px; text-align: center; display: inline-block;  position: absolute;">
			<ul style="list-style-type: none;">
				<li class="menu_left btn"
					onclick="location.href='/mypage?page=mypage01&title=대출현황조회'"><h3>대출현황조회</h3></li>
				<li class="menu_left btn"
					onclick="location.href='/mypage?page=mypage03&title=희망도서신청현황'"><h4>희망도서신청현황</h4></li>
				<li class="menu_left btn"
					onclick="location.href='/mypage?page=mypage04&title=회원정보수정'"><h3>회원정보수정</h3></li>
			</ul>
		</div>

		<c:if test="${loginCheck eq 'OK' }">
			<div align="center" id="section"
				style="display: inline-block;  width: 1000px; min-height: 1000px; padding: 100px; float: right;">
				<jsp:include page="${page }.jsp" />

			</div>
		</c:if>

		<c:if test="${loginCheck != 'OK' }">
			<c:if test="${page eq 'findIdPw' }">
				<div align="center" id="section"
					style="display: inline-block; border: 1px solid blue; width: 1000px; min-height: 1000px; padding: 100px; float: right;">
					<jsp:include page="findIdPw.jsp" />
				</div>
			</c:if>

			<c:if test="${page eq 'register' }">
				<div align="center" id="section"
					style="display: inline-block; border: 1px solid blue; width: 1000px; min-height: 1000px; padding: 100px; float: right;">
					<jsp:include page="register.jsp" />
				</div>
			</c:if>

			<c:if test="${page != 'findIdPw' && page !='register'}">
				<div align="center" id="section"
					style="display: inline-block; border: 1px solid blue; width: 1000px; min-height: 1000px; padding: 100px; float: right;">
					<jsp:include page="loginPage.jsp" />
				</div>
			</c:if>
		</c:if>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>


</section>
