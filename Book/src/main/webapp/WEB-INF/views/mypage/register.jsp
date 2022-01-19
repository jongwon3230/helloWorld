<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>회원가입</h1>
<hr>
<form action ="/register" method = "post">
	<table>
		<tr style="height: 50px;">
			<td width="150px;">아이디</td>
			<td><input type="text" onchange="func()" name="id" id="id" size="30" style="height: 40px;">
				<input type="button" id="idCheck" value="아이디 중복확인" style="height: 40px; ">
				<input type = "text" id="idDoubleCheck" value = "사용불가능" readonly="readonly">
			</td>
		</tr>
		<tr style="height: 50px;">
			<td width="150px;">비밀번호</td>
			<td><input type="password" name="password" id="password" size="30"
				style="height: 40px;"></td>
		</tr>
			<tr style="height: 50px;">
			<td width="150px;">비밀번호 확인</td>
			<td><input type="password" name="passwordChk" id="passwordChk" size="30"
				style="height: 40px;"></td>
		</tr>
		<tr style="height: 50px;">
			<td width="150px;">이름</td>
			<td><input type="text" name="name" id="name" size="30"
				style="height: 40px;"></td>
		</tr>
		<tr style="height: 50px;">
			<td width="150px;">생일</td>
			<td>
				<select name = "year">
					<c:forEach begin="1900" end="2021" step="1" var="year">
						<option value = "${year }">${year }</option>
					</c:forEach>
				</select>년
				&nbsp;
				<select name = "month">
					<c:forEach begin="1" end="12" step="1" var="month">
						<option value = "${month }">${month }</option>
					</c:forEach>
				</select>월
				&nbsp;
				<select name = "date">
					<c:forEach begin="1" end="31" step="1" var="date">
						<option value = "${date }">${date }</option>
					</c:forEach>
				</select>일
			</td>
		</tr>
		<tr style="height: 50px;">
			<td width="150px;">이메일</td>
			<td><input type="email" name="email" id="email" size="30" placeholder="ex)abcde@naver.com"
				style="height: 40px;">
			</td>
		</tr>
		<tr style="height: 60px;">
			<td width="150px;">전화번호</td>
			<td><input type="text" name="phone" id="phone" size="30" placeholder="010-xxxx-xxxx"
				style="height: 40px;"></td>
		</tr>
		<tr style="height: 50px;">
			<td width="150px;">주소</td>
			<td>
			<input id = "member_post" type="text" name="addressCode" size="30" readonly onclick = "findAddr()" placeholder="우편번호"
				style="height: 40px;">
			<input id = "member_addr" type="text" name="address" size="30" readonly placeholder="도로명"
				style="height: 40px;">
			<input id= "member_detailAddr"type="text" name="detailAddress" size="50" placeholder="상세주소"
				style="height: 40px; margin-top: 10px;">
			</td>
		</tr>
		<tr style="height: 60px;">
			<td width="150px;" colspan="2" align="center">
			<input type = "submit" value = "가입하기"  onclick="return dataCheck()"> 
			<input type = "reset" value = "다시작성">
			</td>
		</tr>
	</table>
</form>


