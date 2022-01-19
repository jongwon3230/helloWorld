<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>게시글 수정</h1>
<br>
<form action = "/modifyNoticeBoard" method="post">
<br>
<input type="text" value = "${notice.title }" name="title"id="title" size="100" style="height: 40px;" placeholder="제목을 입력하세요">

<br><br>
<table>
	<tr height="40px;">
	<td>작성자 : ${notice.writer }</td>
	</tr>
	<tr height="40px;">
	<td><textarea rows="10" cols="100" name = "content" id="content">${notice.content }</textarea> </td>
	</tr>
	<tr height="40px;">
	<td align="right"><input type ="submit" value = "수정" onclick="return writeNoticeCheck()" style="height: 40px; width: 70px; background: gray; color: white; margin: 10px 10px;"></td>
	</tr>
</table>
<input type = "hidden"  name = "writer" value = "${loginUser }">
<input type = "hidden" name = "notice_board_idx" value="${notice.notice_board_idx }">
</form>