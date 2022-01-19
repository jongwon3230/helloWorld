<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <hr>
 <div align="left">
<h3>${detailNotice.title}</h3>

작성일 : ${detailNotice.reg_date } |
수정일 : ${detailNotice.update_date }<br>
조회수 : ${detailNotice.count }
작성자 : ${detailNotice.writer }
<hr>
${detailNotice.content }
<br><br><br><br>
<hr>
</div>
<input type = "button" value ="목록"  onclick="location.href='/noticeBoard?page=noticeBoard05&title=자유게시판'" style="height: 40px; width: 70px; background: #646EFF; color: white; margin: 10px 10px;">
<c:if test="${loginUser eq detailNotice.writer }">
<input type = "button" value = "수정하기" onclick="location.href='/noticeBoard?page=modifyNoticeBoard&title=자유게시판&notice_board_idx=${detailNotice.notice_board_idx}'" style="height: 40px; width: 70px; background: gray; color: white; margin: 10px 10px;">
<input type = "button" value = "글 삭제" onclick="location.href='/deleteNoticeBoard?notice_board_idx=${detailNotice.notice_board_idx}'" style="height: 40px; width: 70px; background: red; color: white; margin: 10px 10px;">
</c:if>
<!-- 댓글 표시  -->
<br><br><br>
<div align="left">

<br>


<!--댓글 입력   -->
<c:if test="${loginCheck eq 'OK' }">
<textarea rows="3" cols="100" id = "commentContent"></textarea>
<input type = "hidden" id="loginUser" value = "${loginUser }">
<input type = "hidden" id="notice_board_idx" value = "${detailNotice.notice_board_idx }">
<input type="button" value = "등록" onclick= "addComment()" style="float: right; height: 74px;"><br>

</c:if>
<br>

<!-- 댓글 및 대댓글 표시  -->
<table id = "commentTable">
<c:forEach items="${commentList }" var="commentList">
	<tr>
	<td width="200px;">${commentList.reg_date }</td>
	
	<!-- 댓글인경우 -->
	<c:if test="${commentList.depth eq 0 }">
		<td width="500px" class = "commentContent btn" style="text-align: left">
		<span  onclick ="addCommentbox(${commentList.comment_idx})" >${commentList.content }</span><br>
		
		<!-- 댓글 내용 클릭시 대댓글 창이 열리는 곳 -->
		<form action = "/addRecomment">
		<span id = "recommentBox${commentList.comment_idx }" class = "recommentBox">
			<!--  -->
		</span>
		
		<!-- 대댓글 등록시 필요정보를 히든값으로 지정 -->
		<input type = "hidden"  name="notice_board_idx" value = "${commentList.notice_board_idx }">
		<input type = "hidden"  name="writer" value = "${loginUser }">
		<input type = "hidden"  name="commentGroup" value = "${commentList.commentGroup }">
		
		</form>
		
		</td>
	</c:if>
	
	<!-- 대댓글인경우  -->
	<c:if test="${commentList.depth eq 1 }">
		<td width="500px">&nbsp;&nbsp;<i class="fas fa-long-arrow-alt-right"></i>${commentList.content }</td>
	</c:if>
	
	<td>${commentList.writer }</td>
	</tr>
	
</c:forEach>
</table>
</div>

<script>
	
</script>