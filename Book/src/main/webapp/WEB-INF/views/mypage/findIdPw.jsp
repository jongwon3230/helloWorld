<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container mt-3">
	<h2>아이디/비밀번호 찾기</h2>
	<br>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" href="#menu1">id
				찾기</a></li>
		<li class="nav-item"><a class="nav-link" href="#menu2">password
				찾기</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="menu1" class="container tab-pane active">
			<br>
			<h3>id 찾기</h3>
			<br>
			<br>
			<table>
				<tr style="height: 50px;">
					<td width="150px;">이름</td>
					<td><input type="text" name="name" id="name" size="30"
						style="height: 40px;"></td>
				</tr>
				<tr style="height: 50px;">
					<td width="150px;">생일</td>
					<td><select name="year" id="year">
							<c:forEach begin="1920" end="2021" step="1" var="year">
								<option value="${year }">${year }</option>
							</c:forEach>
					</select>년 &nbsp; <select name="month" id="month">
							<c:forEach begin="1" end="12" step="1" var="month">
								<option value="${month }">${month }</option>
							</c:forEach>
					</select>월 &nbsp; <select name="date" id="date">
							<c:forEach begin="1" end="31" step="1" var="date">
								<option value="${date }">${date }</option>
							</c:forEach>
					</select>일</td>
				</tr>
				<tr style="height: 50px;">
					<td width="150px;">이메일</td>
					<td><input type="email" name="email" id="email" size="30"
						placeholder="ex)abcde@naver.com" style="height: 40px;"></td>
				</tr>
				<tr style="height: 60px;">
					<td width="150px;">전화번호</td>
					<td><input type="text" name="phone" id="phone" size="30"
						placeholder="010-xxxx-xxxx" style="height: 40px;"></td>
				</tr>
				<tr style="height: 60px;">
					<td width="150px;" colspan="2" align="center"><input
						type="button" value="id 찾기" id="idbtn"></td>
				</tr>
			</table>
		</div>

		<div id="showId"></div>

		<div id="menu2" class="container tab-pane fade">
			<br>
			<h3>password 찾기</h3>
			<br>
			<br>
			<table>
				<tr style="height: 50px;">
					<td width="150px;">id</td>
					<td><input type="text" name="id" id="_id" size="30"
						style="height: 40px;"></td>
				</tr>
				<tr style="height: 50px;">
					<td width="150px;">이름</td>
					<td><input type="text" name="name" id="_name" size="30"
						style="height: 40px;"></td>
				</tr>
				<tr style="height: 50px;">
					<td width="150px;">생일</td>
					<td><select name="year" id="_year">
							<c:forEach begin="1920" end="2021" step="1" var="year">
								<option value="${year }">${year }</option>
							</c:forEach>
					</select>년 &nbsp; <select name="month" id="_month">
							<c:forEach begin="1" end="12" step="1" var="month">
								<option value="${month }">${month }</option>
							</c:forEach>
					</select>월 &nbsp; <select name="date" id="_date">
							<c:forEach begin="1" end="31" step="1" var="date">
								<option value="${date }">${date }</option>
							</c:forEach>
					</select>일</td>
				</tr>
				<tr style="height: 50px;">
					<td width="150px;">이메일</td>
					<td><input type="email" name="email" id="_email" size="30"
						placeholder="ex)abcde@naver.com" style="height: 40px;"></td>
				</tr>
				<tr style="height: 60px;">
					<td width="150px;">전화번호</td>
					<td><input type="text" name="phone" id="_phone" size="30"
						placeholder="010-xxxx-xxxx" style="height: 40px;"></td>
				</tr>
				<tr style="height: 60px;">
					<td width="150px;" colspan="2" align="center"><input
						type="button" value="비밀번호 찾기" id="passwordbtn"></td>
				</tr>
			</table>
		</div>

		<div id="showPassword"></div>
	</div>
</div>
