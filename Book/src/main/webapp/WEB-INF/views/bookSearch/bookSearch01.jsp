<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div id="input_box" style="margin: 50px 0px;">
		<select name="findCondition" id="findCondition" style="height: 40px;">
			<option value="title">도서명</option>
			<option value="writer">저자</option>
		</select> <input type="text" name="findWord" id="findWord" size="30"
			style="height: 40px;">
	</div>
	<div>
		<table border="1">
			<tr height="50px">
				<td width="180px" align="center">정렬조건</td>
				<td width="270px" align="left"><select name="orderbyStandard"
					id="orderbyStandard" style="height: 40px;">
						<option value="writer">저자</option>
						<option value="reg_date">발행일</option>
				</select> <select name="orderbyCondition" id="orderbyCondition"
					style="height: 40px;">
						<option value="desc">내림차순</option>
						<option value="asc">오름차순</option>
				</select></td>

				<td width="180px" align="center">발행년도</td>
				<td width="270px" align="left"><input type="date"
					name="minDate" id="minDate">부터 <input type="date"
					name="maxDate" id="maxDate">까지</td>
			</tr>

			<tr height="50px">
				<td width="180px" align="center">카테고리</td>
				<td width="270px" align="left"><select name="categori"
					id="categori" style="height: 40px;">
						<option value="적용안함">적용안함</option>
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

				<td width="180px" align="center">자료형태</td>
				<td width="270px" align="left"><select name="type" id="type"
					style="height: 40px;">
						<option value="전체">전체</option>
						<option value="일반도서">일반도서</option>
						<option value="교과서">교과서</option>
						<option value="학습서">학습서</option>
						<option value="만화">만화</option>
						<option value="아동/청소년도서">아동/청소년도서</option>
						<option value="잡지">잡지</option>
						<option value="신문">신문</option>
				</select></td>
			</tr>
		</table>
	</div>
	<input type="button" id="findbtn" value="검색"
		style="height: 40px; width: 70px; background: #646EFF; color: white; margin: 10px 10px;">
	<input type="reset" value="다시쓰기"
		style="height: 40px; width: 70px; background: #CD3C3C; color: white; margin: 10px 10px;">
</div>


<!-- 검색결과를 보여주는 코드 -->
<div id="showBookList"></div>




