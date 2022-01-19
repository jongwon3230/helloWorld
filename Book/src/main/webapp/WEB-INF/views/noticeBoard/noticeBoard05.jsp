<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>자유게시판</h1>

<!-- 검색  -->
<form action = "/noticeSearch" method="post">
<select name="findCondition" id="findCondition" style="height: 40px;">
				<option value="title">제목</option>
				<option value="writer">글쓴이</option>
			</select> <input type="text" name="findWord"
				id="findWord" size="30" style="height: 40px;">
<input type="submit" id="findbtn" value="검색"
			style="height: 40px; width: 70px; background: #646EFF; color: white; margin: 10px 10px;">
</form>

<div class="container mt-3">
          
  <table class="table table-hover">
    <thead>
      <tr>
        <th>NO.</th>
        <th>제목</th>
        <th>등록일</th>
        <th>수정일</th>
        <th>작성자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="noticeList" items="${noticeList }" >
		<tr>
			<td>${noticeList.notice_board_idx }</td>
			<td style="width: 200px;"><a href = "/noticeBoard?page=noticeBoardDetail&title=자유게시판&notice_board_idx=${noticeList.notice_board_idx }">${noticeList.title }</a></td>
			<td>${noticeList.reg_date }</td>
			<td>${noticeList.update_date }</td>
			<td>${noticeList.writer }</td>
			<td>${noticeList.count }</td>
		</tr>

	</c:forEach>
    </tbody>
  </table>
  <br>
  <c:if test="${loginCheck eq 'OK' }">
  <button style="background: white; height: 40px;"  onclick="location.href='/noticeBoard?page=writeNoticeBoard&title=자유게시판&writer=${loginUser}'"><i class="fas fa-edit"></i>글쓰기</button>
  </c:if>
  	
  	<c:if test="${loginCheck eq 'FAIL' || loginCheck == null}">
  	 <button onclick="addNoticeBtn()" style="background: white; height: 40px;"><i class="fas fa-edit"></i>글쓰기</button>
  	</c:if>
  	<br><br>
  	
  <!-- 왼쪽화살표 활성화 조건 -->
	<c:if test="${pdto.nowBlock >= 2}">
		
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/noticeBoard?page=noticeBoard05&changePage=${pdto.startNum-1 }&nowBlock=${pdto.nowBlock-1 }"><i class="fas fa-chevron-left"></i></a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/noticeSearch?findCondition=${findCondition }&findWord=${findWord }
			&changePage=${pdto.startNum-1 }&nowBlock=${pdto.nowBlock-1 }"><i class="fas fa-chevron-left"></i></a>
		</c:if>
		
	</c:if>
  	
  <!-- 페이징 -->
  
  <!-- 마지막 블록 아닐때 -->
  <c:if test="${pdto.nowBlock != pdto.totalBlockNum }">
  	<c:forEach var = "i" begin="${pdto.startNum}" end="${pdto.startNum + 4 }">
  	
  		
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/noticeBoard?page=noticeBoard05&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/noticeSearch?findCondition=${findCondition }&&findWord=${findWord }
			&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
	
  	</c:forEach>
  </c:if>

  <!-- 마지막 블록일때 -->
  
	<c:if test="${pdto.nowBlock eq pdto.totalBlockNum }">
	<c:forEach var = "i" begin="${pdto.startNum}" end="${pdto.totalPageNum }">
	
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/noticeBoard?page=noticeBoard05&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
		
		<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/noticeSearch?findCondition=${findCondition }&&findWord=${findWord }
			&changePage=${i }&nowBlock=${pdto.nowBlock }">${i }</a>
		</c:if>
	</c:forEach>
	</c:if>
	
	
	<!-- 오른쪽 화살표 활성화 조건 -->
	<c:if test="${pdto.nowBlock < pdto.totalBlockNum}">
		
		<!-- 모든 리스트 -->
		<c:if test="${url eq 'totalList' }">
		<a href = "/noticeBoard?page=noticeBoard05&changePage=${pdto.startNum+5 }&nowBlock=${pdto.nowBlock+1 }"><i class="fas fa-chevron-right"></i></a>
		</c:if>
		
			<!-- 검색시 -->
		<c:if test="${url eq 'searchList' }">
		<a href = "/noticeSearch?findCondition=${findCondition }&findWord=${findWord }
			&changePage=${pdto.startNum+5 }&nowBlock=${pdto.nowBlock+1 }"><i class="fas fa-chevron-right"></i></a>
		</c:if>
	</c:if>
	
  
</div>

<script>
	function addNoticeBtn(){
		alert('로그인이 필요합니다.');
		location.href='/mypage?page=loginPage';
		
	}
</script>