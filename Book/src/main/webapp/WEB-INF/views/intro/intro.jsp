<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp" />

<section>
	<div id="info" style="height: 180px; text-align: center;">
		<div id="info_image">
			<img alt="" src="/image/background2.jpg"
				style="height: 180px; width: 100%">
		</div>
		<div id="info_text" style="position: relative; bottom: 150px;">
			<h1>도서관 소개</h1>
			<br>
			<h5>${title }</h5>
		</div>
	</div>
	<div class="container">
		<div
			style="width: 240px; height: 1000px; text-align: center; display: inline-block;  position: absolute;">
			<ul style="list-style-type: none;">
				<li class="menu_left btn" id="menu_left1"
					onclick="location.href='/intro?page=intro01&title=인사말'"><h3>인사말</h3></li>
				<li class="menu_left btn" id="menu_left2"
					onclick="location.href='/intro?page=intro02&title=연혁'"><h3>연혁</h3></li>
				<li class="menu_left btn" id="menu_left3"
					onclick="location.href='/intro?page=intro03&title=조직/기구'"><h3>조직/기구</h3></li>
				<li class="menu_left btn" id="menu_left4"
					onclick="location.href='/intro?page=intro04&title=자료현황'"><h3>자료현황</h3></li>
				<li class="menu_left btn" id="menu_left5"
					onclick="location.href='/intro?page=intro05&title=시설현황'"><h3>시설현황</h3></li>
				<li class="menu_left btn"
					onclick="location.href='/intro?page=intro06&title=찾아오시는 길'"><h3>찾아오시는
						길</h3></li>
			</ul>
		</div>

		<div id="section"
			style="display: inline-block; width: 1000px; min-height: 1000px; padding: 100px; float: right;">
			<jsp:include page="${page }.jsp" />
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>



</section>