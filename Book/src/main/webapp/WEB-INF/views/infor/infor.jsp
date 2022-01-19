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
			<h1>이용 안내</h1>
			<br> <h5>${title }</h5>
		</div>
	</div>
	<div class = "container">
	<div style="width: 240px; height:1000px; text-align: center; display: inline-block; position: absolute; float: ">
		<ul style="list-style-type: none;">
			<li class = "menu_left btn" onclick="location.href='/infor?page=infor01&title=도서관이용안내'"><h3>도서관 이용안내</h3></li>
			<li class = "menu_left btn" onclick="location.href='/infor?page=infor02&title=자료이용안내'"><h3>자료이용안내</h3></li>
			<li class = "menu_left btn" onclick="location.href='/infor?page=infor03&title=도서기증'"><h3>도서기증</h3></li>

		</ul>
	</div>
	
	<div  align="center" id = "section" style="display:inline-block;  width: 1000px; min-height:1000px; padding: 100px;  float: right;">
		<jsp:include page="${page }.jsp"/>
	</div>
	</div>
	
		<jsp:include page="../footer.jsp"></jsp:include>
</section>