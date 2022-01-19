<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>우리 도서관</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/api.js"></script>
<script src="/js/script.js"></script>
<!-- 폰트 -->
<script src="https://kit.fontawesome.com/5e665b3af1.js" crossorigin="anonymous"></script>


<link href="/css/style.css" rel="stylesheet" type="text/css">

</head>
<header>
	<div class="container">
		<ul class="container p-2  nav justify-content-end">
			<li class="nav-item bg-dark text-white px-2"><a href="/"><button
						type="button" class="btn btn-dark">홈으로</button></a></li>
			
			<!-- 로그인중이면 로그아웃 아니면 로그인으로. -->
			<c:if test="${loginCheck eq 'FAIL' || loginCheck == null}">
			<li class="nav-item bg-dark text-white px-2"><a href="/mypage?page=loginPage"><button
						type="button" class="btn btn-dark">로그인</button></a></li>
			</c:if>
			<c:if test="${loginCheck eq 'OK' }">
			<li class="nav-item bg-dark text-white px-2"><a href="/logout"><button
						type="button" class="btn btn-dark">로그아웃</button></a></li>
			</c:if>
			
			<!-- -------------------------------------------- -->
			
			<!-- 관리자 접속시 마이페이지 대신 관리자페이지로 전환 -->
			<c:if test="${loginUser != 'admin' }">
			<li class="nav-item bg-dark text-white px-2"><a href="*"><button
						type="button" class="btn btn-dark">마이페이지</button></a></li>
			</c:if>
			<c:if test="${loginUser eq 'admin' }">
			<li class="nav-item bg-dark text-white px-2"><a href="/admin" onclick="window.open(this.href, '_blank', 'width=1000px,height=700px,toolbars=no,scrollbars=no'); return false;">
			<button type="button" class="btn btn-dark">관리자페이지</button></a></li>
			</c:if>
			<!--         ----        -->
			
		</ul>

		<div style="width: 100%; height: 90px; vertical-align: center;">
		<div style="display: inline;">
			<a href="/"><img alt="" src="/image/logo.png" style="height: 50px;"></a>
		</div>
			<ul class = "contatner nav" style="display: inline;" >
				<li class = "nav-item menus btn"><h5 onclick="location.href='/intro?page=intro01'">도서관 소개</h5></li>
				<li class = "nav-item menus btn"><h5 onclick="location.href='/infor?page=infor01'">이용안내</h5></li>
				<li class = "nav-item menus btn"><h5 onclick="location.href='/bookSearch?page=bookSearch01'">자료검색</h5></li>
				<li class = "nav-item menus btn"><h5 onclick="location.href='/noticeBoard?page=noticeBoard01'">참여마당</h5></li>
				<li class = "nav-item menus btn"><h5 onclick="location.href='/mypage?page=mypage01'">내 서재</h5></li>
			</ul>
		</div>
	</div>
	


</header>
