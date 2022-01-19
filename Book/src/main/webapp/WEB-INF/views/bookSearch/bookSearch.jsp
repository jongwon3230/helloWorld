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
			<h1>자료검색</h1>
			<br>
			<h5>${title }</h5>
		</div>
	</div>
	<div class="container" >
		<div
			style="width: 240px; height: 1000px; text-align: center; display: inline-block; position: absolute; float:">
			<ul style="list-style-type: none;"  >
				<li class="menu_left btn"
					onclick="location.href='/bookSearch?page=bookSearch01&title=도서검색'"><h3>도서검색</h3></li>
				<li class="menu_left btn"
					onclick="location.href='/bookSearch?page=bookSearch02&title=신작도서'"><h3>신작도서</h3></li>
				<li class="menu_left btn"
					onclick="location.href='/bookSearch?page=bookSearch03&title=추천도서'"><h3>추천도서</h3></li>
				<li class="menu_left btn"
					onclick="location.href='/bookSearch?page=bookSearch04&title=대출베스트'"><h3>대출베스트</h3></li>
			</ul>
		</div>

		<div align="center" id="section"
			style="display: inline-block; width: 1000px; min-height: 1000px;  float: right;">
			<jsp:include page="${page }.jsp" />
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
