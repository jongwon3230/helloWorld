<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<br><br>
<section>
<h1>책 정보 수정</h1>

<form action = "/booKUpdate" method="post" >
	<input type="hidden" name = "book_idx" value = "${bookDetail.book_idx }">
	<input type = "hidden" name ="inven" value = "${bookDetail.inven }">
	<table style="margin: auto;">
		<tr>
		<td>책 제목</td>
		<td><input type = "text" name="title" id="title" size="40" value = "${bookDetail.title }"> </td>
		</tr>
		<tr>
		<td>저자</td>
		<td><input type = "text" name="writer" id="writer" size="40" value = "${bookDetail.writer }"> </td>
		</tr>
		<tr>
		<td>출판사</td>
		<td><input type = "text" name="publisher" id="publisher" size="40" value = "${bookDetail.publisher }"> </td>
		</tr>
		<tr>
		<td>카테고리</td>
		<td><select  class = "categoriGroup"  name="categori"  id="categori">
			<%-- <option value = "${bookDetail.categori }">${bookDetail.categori }</option> --%>
			
			<option value="철학">철학</option>
			<option value="종교">종교</option>
			<option value="사회과학">사회과학</option>
			<option value="자연과학">자연과학</option>
			<option value="기술과학">기술과학</option>
			<option value="예술">예술</option>
			<option value="언어">언어</option>
			<option value="문학">문학</option>
			<option value="역사">역사</option>
			<option value="기타">기타</option>
			
			
			</select></td>
		</tr>
		<tr>
			<td>출판일</td>
			<td><input type = "date" name = "reg_date" id="reg_date" value="${bookDetail.reg_date }"></td>
		</tr>
		<tr>
		<td>자료형태</td>
		<td><select class = "typeGroup" name="type" id="type" style="height: 40px;">
			<option value="일반도서">일반도서</option>
			<option value="교과서">교과서</option>
			<option value="학습서">학습서</option>
			<option value="만화">만화</option>
			<option value="아동/청소년도서">아동/청소년도서</option>
			<option value="잡지">잡지</option>
			<option value="신문">신문</option>
		</select> </td>
		</tr>
		<tr>
		<td>책 이미지</td>
			<td>
				<input type = "file" name = "bookImage">
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" value = "수정" onclick="return bookInsertCheck()" style="width: 70px;">
			<input type = "button" id="btn_delete" value = "삭제" onclick = "bookDeleteCheck()" style="width: 70px;">
			<input type = "button" id="btn_recommend" value = "추천도서등록" onclick="bookRecommendCheck()" style="width: 70px;">
			</td>
		</tr>
	</table>
</form>
</section>
<script>
//도서 수정페이지에서 기존 책 정보를 유지시키기 위한 코드 따로 빼면 안됨..
jQuery(".categoriGroup").val("${bookDetail.categori}").attr("selected", "selected");
jQuery(".typeGroup").val("${bookDetail.type}").attr("selected", "selected");


function bookDeleteCheck(){
	if(confirm("삭제하시겠습니까?") == true){
		location.href = '/bookDelete?book_idx=' + "${bookDetail.book_idx}";
	}
}

function bookRecommendCheck(){
	if(confirm("추천도서로 등록하시겠습니까?") == true){
		location.href='/addBookRecommend?book_idx=' + "${bookDetail.book_idx}";
	}
}


</script>
