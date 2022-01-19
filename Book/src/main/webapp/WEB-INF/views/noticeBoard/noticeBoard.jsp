<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />

<section>
	<div id="info"
		style="height: 180px; text-align: center;">
		<div id="info_image">
			<img alt="" src="/image/background2.jpg"
				style="height: 180px; width: 100%">
		</div>
		<div id="info_text" style="position: relative; bottom: 150px;">
			<h1>참여마당</h1>
			<br> <h5>${title }</h5>
		</div>
	</div>
	<div class = "container">
	<div style="width: 240px; height:1000px; text-align: center; display: inline-block; position: absolute; ">
		<ul style="list-style-type: none;">
			<li class = "menu_left btn" onclick="location.href='/noticeBoard?page=noticeBoard01&title=공지사항'"><h3>공지사항</h3></li>
			<li class = "menu_left btn" onclick="location.href='/noticeBoard?page=noticeBoard02&title=질문과 답변'"><h3>질문과 답변</h3></li>
			<li class = "menu_left btn" onclick="location.href='/noticeBoard?page=noticeBoard03&title=FAQ'"><h3>FAQ</h3></li>
			<li class = "menu_left btn" onclick="location.href='/noticeBoard?page=noticeBoard04&title=설문조사'"><h3>설문조사</h3></li>
			<li class = "menu_left btn" onclick="location.href='/noticeBoard?page=noticeBoard05&title=자유게시판'"><h3>자유게시판</h3></li>
		</ul>
	</div>
	
	<div align="center" id = "section" style="display:inline-block;  width: 1000px; min-height:1000px; padding: 100px;  float: right;">
		<jsp:include page="${page }.jsp"/>
	</div>
	</div>
		
		<jsp:include page="../footer.jsp"></jsp:include>

	
</section>