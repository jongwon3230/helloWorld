<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>

	<!-- <form action = "/booKRental" method="post" >
	<table style="margin: auto;">
		<tr>
		<td>등록번호</td>
		<td><input type = "text" name="book_idx" id="book_idx" size="40"> </td>
		</tr>
		<tr>
		<td>대여id</td>
		<td><input type = "text" name="user" id="user" size="40"> </td>
		</tr>
		<tr>
		<td>대여기간</td>
		<td><select name="period"  id="period">
			
			<option value="7">7일</option>
			<option value="14">14일</option>
			
			</select></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" id="btn_rental" value = "대여하기" style="width: 70px;">
			</td>
		</tr>
	</table>
</form>
 -->

	<div class="container">
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#home">대여</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu1">반납</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="home" class="container tab-pane active">
				<br>
				<h3>대여</h3>

				<form action="/booKRental" method="post">
					<table style="margin: auto;">
						<tr>
							<td>등록번호</td>
							<td><input type="text" name="book_idx" id="book_idx"
								size="40"></td>
						</tr>
						<tr>
							<td>대여id</td>
							<td><input type="text" name="user" id="user" size="40">
							</td>
						</tr>
						<tr>
							<td>대여기간</td>
							<td><select name="period" id="period">

									<option value="7">7일</option>
									<option value="14">14일</option>

							</select></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" id="btn_rental"
								value="대여하기" style="width: 70px;"></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="menu1" class="container tab-pane fade">
				<br>
				<h3>반납</h3>
				<form action="/booKReturn" method="post">
					<table style="margin: auto;">
						<tr>
							<td>등록번호</td>
							<td><input type="text" name="book_idx" id="book_idx"
								size="40"></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value="반납하기"
								style="width: 70px;"></td>
						</tr>
					</table>
				</form>
			</div>
		
		</div>
	</div>

</section>