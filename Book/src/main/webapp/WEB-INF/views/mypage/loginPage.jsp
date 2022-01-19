<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="border:1px solid gray; width: 550px; height: 430px; padding: 50px;">
	<h3>로그인</h3>
	<br>
	<form action = "/loginCheck" method = "post">
		<table>
			<tr>
				<td colspan="2"><input type = "text" name = "id" placeholder="아이디"size="30" style="border: 1px solid #dcdcdc; height: 40px; width:460px; margin-bottom: 10px;"></td>
			</tr>
			<tr>
				<td colspan="2"><input type = "password" name = "password" placeholder="비밀번호"size="30" style="border: 1px solid #dcdcdc; height: 40px; width: 460px; margin-bottom: 20px;"></td>
				
			</tr>
			<tr>
				<td><input type = "submit" value = "로그인" style="height: 50px; width: 220px; background: #2828CD; color: white;"></td>
				<td><a href = "/mypage?page=register"><input type = "button" value = "회원가입" style="height: 50px; width: 220px; background: #147814; color: white;"></a></td>
			</tr>
			<tr>
				<td colspan="2">
				<a href = "/mypage?page=findIdPw"><input type = "button" value = "아이디/비밀번호 찾기" style="height: 50px; width: 460px;; background: #6e6e6e	; color: white; margin-top: 10px;" ></a>
				</td>
			</tr>
		</table>
	</form>
</div>

