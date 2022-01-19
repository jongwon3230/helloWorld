<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<br><br>
<section>
<h1>도서등록</h1>
<form action = "/bookInsert" method="post" >
	<table style="margin: auto;">
		<tr>
		<td>책 제목</td>
		<td><input type = "text" name="title" id="title" size="40"> </td>
		</tr>
		<tr>
		<td>저자</td>
		<td><input type = "text" name="writer" id="writer" size="40"> </td>
		</tr>
		<tr>
		<td>출판사</td>
		<td><input type = "text" name="publisher" id="publisher" size="40"> </td>
		</tr>
		<tr>
		<td>카테고리</td>
		<td><select name="categori" id="categori">
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
			<td><input type = "date" name = "reg_date" id="reg_date"></td>
		</tr>
		<tr>
		<td>자료형태</td>
		<td><select name="type" id="type" style="height: 40px;">
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
			<input type = "reset" value = "다시작성" style="width: 70px;">
			<input type = "submit" value = "등록" onclick="return bookInsertCheck()" style="width: 70px;">
			</td>
		</tr>
	</table>
</form>
</section>
<script>
	
</script>



