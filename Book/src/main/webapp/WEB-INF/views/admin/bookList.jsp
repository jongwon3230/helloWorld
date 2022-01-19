<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<br><br>
<section>
<form action = "/adminSearch" method="post">
<select name="findCondition" id="findCondition">
	<option value="title">도서명</option>
	<option value="writer">저자</option>
	<option value="publisher">출판사</option>
</select>
<select name="categori" id="categori">
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
</select>
<select name="type" id="type">
	<option value="전체">전체</option>
	<option value="일반도서">일반도서</option>
	<option value="교과서">교과서</option>
	<option value="학습서">학습서</option>
	<option value="만화">만화</option>
	<option value="아동/청소년도서">아동/청소년도서</option>
	<option value="잡지">잡지</option>
	<option value="신문">신문</option>
</select>
<input type="date" name="minDate" id="minDate">
부터
<input type="date" name="maxDate" id="maxDate">
까지
<br>
<input type="text" size="50" name = "findWord" id = "findWord">
<input type="submit"  value="검색">

총수 : ${totalData }
<table style="margin: auto;" border="1">
	<tr>
		<th>번호</th>
		<th>책 제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>발행일</th>
		<th>카테고리</th>
		<th>타입</th>
		<th>대출가능여부</th>
	</tr>
	
	<!-- 마지막 페이지가 아닐 때 -->
	<%-- <c:if test="${pdto.nowPage != totalPageNum }"> --%>
	<c:forEach var="bookList" items="${bookList }" >
		<tr>
			<td>${bookList.book_idx }</td>
			<td style="width: 200px;"><a href = "/admin?adminpage=bookDetail&book_idx=${bookList.book_idx }">${bookList.title }</a></td>
			<td>${bookList.writer }</td>
			<td>${bookList.publisher }</td>
			<td>${bookList.reg_date }</td>
			<td>${bookList.categori }</td>
			<td>${bookList.type }</td>
			<td>${bookList.inven }</td>
		</tr>

	</c:forEach>
	
	
</table>
</form>
	<!-- 왼쪽화살표 활성화 조건 -->
	<c:if test="${pdto.nowBlock >= 2}">
		
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/admin?adminpage=showBookList&changePage=${pdto.startNum-1 }&nowBlock=${pdto.nowBlock-1 }"><i class="fas fa-chevron-left"></i></a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/adminSearch?findCondition=${findBookDto.findCondition }&categori=${findBookDto.categori }&type=${findBookDto.type }&minDate=${findBookDto.minDate }&maxDate=${findBookDto.maxDate }&findWord=${findBookDto.findWord }
			&changePage=${pdto.startNum-1 }&nowBlock=${pdto.nowBlock-1 }"><i class="fas fa-chevron-left"></i></a>
		</c:if>
		
	</c:if>
	
	<!-- 페이지 넘버 표시 -->
	
	<!-- 마지막 블록 아닐때 -->
	<c:if test="${pdto.nowBlock != pdto.totalBlockNum }">
	<c:forEach var = "i" begin="${pdto.startNum}" end="${pdto.startNum + 4 }">
	
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/admin?adminpage=showBookList&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/adminSearch?findCondition=${findBookDto.findCondition }&categori=${findBookDto.categori }&type=${findBookDto.type }&minDate=${findBookDto.minDate }&maxDate=${findBookDto.maxDate }&findWord=${findBookDto.findWord }
			&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
	</c:forEach>
	</c:if>
	<!-- 마지막 블록일때 -->
	<c:if test="${pdto.nowBlock eq pdto.totalBlockNum }">
	<c:forEach var = "i" begin="${pdto.startNum}" end="${pdto.totalPageNum }">
	
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/admin?adminpage=showBookList&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/adminSearch?findCondition=${findBookDto.findCondition }&categori=${findBookDto.categori }&type=${findBookDto.type }&minDate=${findBookDto.minDate }&maxDate=${findBookDto.maxDate }&findWord=${findBookDto.findWord }
			&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
	</c:forEach>
	</c:if>
	
		
	
	
	<!-- 오른쪽 화살표 활성화 조건 -->
	<c:if test="${pdto.nowBlock < pdto.totalBlockNum}">
		
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/admin?adminpage=showBookList&changePage=${pdto.startNum+5 }&nowBlock=${pdto.nowBlock+1 }"><i class="fas fa-chevron-right"></i></a>
		</c:if>
		
			<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/adminSearch?findCondition=${findBookDto.findCondition }&categori=${findBookDto.categori }&type=${findBookDto.type }&minDate=${findBookDto.minDate }&maxDate=${findBookDto.maxDate }&findWord=${findBookDto.findWord }
			&changePage=${pdto.startNum+5 }&nowBlock=${pdto.nowBlock+1 }"><i class="fas fa-chevron-right"></i></a>
		</c:if>
	</c:if>

</section>


