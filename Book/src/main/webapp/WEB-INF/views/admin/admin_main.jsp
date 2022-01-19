<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/css/adminStyle.css" rel="stylesheet" type="text/css">
<script src="/js/adminScript.js"></script>

<!-- 폰트 -->
<script src="https://kit.fontawesome.com/5e665b3af1.js" crossorigin="anonymous"></script>

 <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<h3 align="center" style="background: #C8FFFF; padding: 5px; margin: 0px;">관리자페이지</h3>
<div class ="row" style="width: 1000px;">
	<div class = "col-sm-3 btn" id="bookListtag" onclick="location.href='/admin?adminpage=showBookList'">도서목록</div>
	<div class = "col-sm-3 btn" id="bookInserttag" onclick="location.href='/admin?adminpage=bookInsert'">도서등록</div>
	<div class = "col-sm-3 btn" id="bookRecommendtag" onclick="location.href='/admin?adminpage=bookRecommend'">추천도서관리</div>
	<div class = "col-sm-3 btn" id="bookRentaltag" onclick="location.href='admin?adminpage=bookRental'">대출관리</div>
	
</div>


<!--도서 조회  -->

<c:if test="${adminpage eq 'showBookList' }">
	<div class = "adminSection" style="width: 100%; height: 650px;">
 	<jsp:include page="bookList.jsp"/> 
	</div>
	
</c:if>

<!-- 도서 등록 -->

<c:if test="${adminpage eq 'bookInsert' }">
	<div class = "adminSection" style="width: 100%; height: 650px;">
	<jsp:include page="bookInsert.jsp"/>
	</div>
</c:if>

<!-- 추천도서 관리 -->
<c:if test="${adminpage eq 'bookRecommend' }">
	<div class = "adminSection" style="width: 100%; height: 650px;">
	<jsp:include page="bookRecommend.jsp"/>
	</div>
</c:if>

<!-- 책 정보 수정 -->
<c:if test="${adminpage eq 'bookDetail' }">
	<div class = "adminSection" style="width: 100%; height: 650px;">
	<jsp:include page="bookDetail.jsp"/>
	</div>
</c:if>


<!-- 대출 관리 -->
<c:if test="${adminpage eq 'bookRental' }">
	<div class = "adminSection" style="width: 100%; height: 650px;">
	<jsp:include page="bookRental.jsp"/>
	</div>
</c:if>



<script>
	 <c:if test="${adminpage eq 'showBookList'}">
		document.getElementById("bookListtag").style.background='#b4b4b4';
		document.getElementsByClassName("adminSection")[0].style.background='#b4b4b4';
	</c:if>
	
 	<c:if test="${adminpage eq 'bookRecommend'}">
		document.getElementById("bookRecommendtag").style.background='#b4b4b4	';
		document.getElementsByClassName("adminSection")[0].style.background='#b4b4b4';
	</c:if>
	
	<c:if test="${adminpage eq 'bookInsert'}">
		document.getElementById("bookInserttag").style.background='#b4b4b4	';
		document.getElementsByClassName("adminSection")[0].style.background='#b4b4b4';
	</c:if> 
	
	<c:if test="${adminpage eq 'bookDetail'}">
		document.getElementById("bookListtag").style.background='#b4b4b4	';
		document.getElementsByClassName("adminSection")[0].style.background='#b4b4b4';
	</c:if>
	
	<c:if test="${adminpage eq 'bookRental'}">
	document.getElementById("bookRentaltag").style.background='#b4b4b4	';
	document.getElementsByClassName("adminSection")[0].style.background='#b4b4b4';
	</c:if>
</script>
</body>
</html>