<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<H1>자유게시판 글쓰기</H1>

<form action = "/writeNoticeBoard" method="post">
<br>
<input type="text" name="title"id="title" size="100" style="height: 40px;" placeholder="제목을 입력하세요">

<br><br>
<table>
	<tr height="40px;">
	<td>작성자 : ${loginUser }</td>
	</tr>
	<tr height="40px;">
	<td><textarea rows="10" cols="100" name = "content" id="content"></textarea> </td>
	</tr>
	<tr height="40px;">
	<td align="right"><input type ="submit" value = "등록" onclick="return writeNoticeCheck()" style="height: 40px; width: 70px; background: gray; color: white; margin: 10px 10px;"></td>
	</tr>
</table>
<input type = "hidden"  name = "writer" value = "${loginUser }">
</form>