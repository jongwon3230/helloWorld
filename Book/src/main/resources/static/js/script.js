
	//회원가입시 유효성 검사.
	function dataCheck(){
		if(document.getElementById("id").value == ""){
			alert("아이디를 입력하세요");
			document.getElementById("id").focus();
			return false;
		}if(document.getElementById("password").value == ""){
			alert("비밀번호를 입력하세요");
			document.getElementById("password").focus();
			return false;
		}if(document.getElementById("passwordChk").value == ""){
			alert("비밀번호확인을 입력하세요");
			document.getElementById("passwordChk").focus();
			return false;
		}if(document.getElementById("name").value == ""){
			alert("이름을 입력하세요");
			document.getElementById("name").focus();
			return false;
		}if(document.getElementById("email").value == ""){
			alert("이메일을 입력하세요");
			document.getElementById("email").focus();
			return false;
		}if(document.getElementById("phone").value == ""){
			alert("전화번호를 입력하세요");
			document.getElementById("phone").focus();
			return false;
		}if(document.getElementById("member_post").value == ""){
			alert("주소를 입력하세요");
			document.getElementById("member_post").focus();
			return false;
		}if(document.getElementById("member_detailAddr").value == ""){
			alert("상세주소를 입력하세요");
			document.getElementById("member_detailAddr").focus();
			return false;
		}if(document.getElementById("password").value != document.getElementById("passwordChk").value){
			alert("비밀번호확인이 일치하지 않습니다. ");
			document.getElementById("password").focus();
			return false;
		}if(document.getElementById("idDoubleCheck").value ==
		"사용불가능"){
			alert("아이디 중복확인을 해주세요");
			return false;
		}
		return true;
	}
	/* id중복확인시 ajax 코드 */


// 아이디 중복확인 ajax

$(document).ready(function(){
	$("#idCheck").click(function(){
		var datas ={id : document.getElementById("id").value}
		$.ajax({
		      url: "/idDoubleCheck",
		      type:"POST",
		      data:datas,
		      success:function(data){
		    	  if(data == 0){
		    		  document.getElementById("idDoubleCheck").value = "사용가능";
		    	  }else{
		    		  alert('중복아이디 입니다.');
		    		  document.getElementById("idDoubleCheck").value = "사용불가능";
		    	  }
		      },
		      error: function(request,status,error) {
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		   });
	});
});
	
	function func(){
		document.getElementById("idDoubleCheck").value = "사용불가능";
	}

	


//아이디찾기 비밀전호 찾기 탭 변경 코드


	$(".nav-tabs a").show;
	
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
    document.getElementById("showId").innerHTML = "";
    document.getElementById("showPassword").innerHTML = "";
  });
});


//아이디찾기 비밀번호 찾기 ajax 코드

$(document).ready(function(){
	/* id찾기 */
	$("#idbtn").click(function(){
		var datas ={name : document.getElementById("name").value,
					year : document.getElementById("year").value,
					month : document.getElementById("month").value,
					date : document.getElementById("date").value,
					email : document.getElementById("email").value,
					phone : document.getElementById("phone").value}
		$.ajax({
		      url: "/findId",
		      type:"POST",
		      data:datas,
		      success:function(data){
		    	  if(data == ""){
		    		  document.getElementById("showId").innerHTML = "아이디가 없습니다.";
		    	  }else{
		    		  document.getElementById("showId").innerHTML = "아이디 : " + data;
		    	  }
		       
		      },
		      error: function(request,status,error) {
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		   });
	});
	
	/* 비밀번호 찾기 */
	$("#passwordbtn").click(function(){
		var datas ={id : document.getElementById("_id").value,
					name : document.getElementById("_name").value,
					year : document.getElementById("_year").value,
					month : document.getElementById("_month").value,
					date : document.getElementById("_date").value,
					email : document.getElementById("_email").value,
					phone : document.getElementById("_phone").value}
		$.ajax({
		      url: "/findPassword",
		      type:"POST",
		      data:datas,
		      success:function(data){
		    	  if(data == ""){
		    		  document.getElementById("showPassword").innerHTML = "입력 정보를 확인하세요";
		    	  }else{
		    		  document.getElementById("showPassword").innerHTML = "비밀번호 : " + data;
		    	  }
		       
		      },
		      error: function(request,status,error) {
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		   });
	});
});




//도서 검색 ajax

$(document).ready(function(){
	$("#findbtn").click(function(){
		var datas ={findCondition : document.getElementById("findCondition").value,
					findWord : document.getElementById("findWord").value,
					orderbyStandard : document.getElementById("orderbyStandard").value,
					orderbyCondition : document.getElementById("orderbyCondition").value,
					minDate : document.getElementById("minDate").value,
					maxDate : document.getElementById("maxDate").value,
					categori : document.getElementById("categori").value,
					type : document.getElementById("type").value}
		$.ajax({
		      url: "/findBook",
		      type:"POST",
		      dataType:'json',
		      data:datas,
		      success:function(data){
		      	document.getElementById("showBookList").innerHTML = "" ;

		      	
		      	$("#showBookList").append('<table border = "1">');
		    	for(var i = 0; i < data.bookList.length; i++){
		    		$("#showBookList").append('<tr height="250px" align="center">'
		    									+ '<th width="220px" style="border: 1px solid black">그림</th>'
		    									+ '<th width="700px" style="text-align: center; border: 1px solid black">'
		    										+ '<h4 style="color: blue;">' + data.bookList[i].title + '</h4><br>'
		    										+ '<br> 저자 : ' + data.bookList[i].writer  +'<br>'
		    										+ '<br> 출판사 : ' + data.bookList[i].publisher  +'<br>'
		    										+ '<br> 발행년도 : ' + data.bookList[i].reg_date  +'<br>'
		    										+ '<br> 대출여부 : ' + data.bookList[i].inven  +'<br>'
		    										+'</th></tr>');
		    			
		    	}
		    	$("#showBookList").append('</table>');
		    	
		    	//페이징 처리
		    	
		    	//왼쪽 화살표
		    	if(data.pdto.nowBlock >= 2){
		    		$("#showBookList").append('<button onclick="changePage(' + (data.pdto.startNum-1) + ',' + (data.pdto.nowBlock - 1) + ')"><i class="fas fa-chevron-left"></i></button>');
		    	}
		    	
		    	//페이지 넘버버 표시
		    	
		    	if(data.pdto.nowBlock != data.pdto.totalBlockNum){ //마지막 블록 아닐때
		    		for(var i = data.pdto.startNum; i <= data.pdto.startNum + 4; i++){
		    			$("#showBookList").append('<button onclick="changePage(' + i + ',' + data.pdto.nowBlock + ')">' + i + '</button>');
		    		}
		    	}else{
		    		for(var i = data.pdto.startNum; i <= data.pdto.totalPageNum; i++){
		    			$("#showBookList").append('<button onclick="changePage(' + i + ',' + data.pdto.nowBlock + ')">' + i + '</button>');
		    		}
		    	}
		    	
		    	//오른쪽 화살표
		    	if(data.pdto.nowBlock < data.pdto.totalBlockNum){
		    		$("#showBookList").append('<button onclick="changePage(' + (data.pdto.startNum+5) + ',' + (data.pdto.nowBlock + 1) + ')"><i class="fas fa-chevron-right"></i></button>');
		    	}
		    	
		    	
		      },
		      error: function(request,status,error) {
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		   });
	});
});


//도서검색 페이지 변환처리
function changePage(i, block) {
	var datas = {
		findCondition: document.getElementById("findCondition").value,
		findWord: document.getElementById("findWord").value,
		orderbyStandard: document.getElementById("orderbyStandard").value,
		orderbyCondition: document.getElementById("orderbyCondition").value,
		minDate: document.getElementById("minDate").value,
		maxDate: document.getElementById("maxDate").value,
		categori: document.getElementById("categori").value,
		type: document.getElementById("type").value,
		changePage: i,
		nowBlock: block
	}
	$.ajax({
		url: '/findBook',
		type: 'POST',
		data: datas,
		dataType: "json",
		success: function(data) {
			document.getElementById("showBookList").innerHTML = "" ;
			
				$("#showBookList").append('<table border = "1">');
		    	for(var i = 0; i < data.bookList.length; i++){
		    		$("#showBookList").append('<tr height="250px" align="center">'
		    									+ '<th width="220px" style="border: 1px solid black">그림</th>'
		    									+ '<th width="700px" style="text-align: center; border: 1px solid black">'
		    										+ '<h4 style="color: blue;">' + data.bookList[i].title + '</h4><br>'
		    										+ '<br> 저자 : ' + data.bookList[i].writer  +'<br>'
		    										+ '<br> 출판사 : ' + data.bookList[i].publisher  +'<br>'
		    										+ '<br> 발행년도 : ' + data.bookList[i].reg_date  +'<br>'
		    										+ '<br> 대출여부 : ' + data.bookList[i].inven  +'<br>'
		    										+'</th></tr>');
		    			
		    	}
		    	$("#showBookList").append('</table>');
		    	
		    	//페이징 처리
		    	
		    	//왼쪽 화살표
		    	if(data.pdto.nowBlock >= 2){
		    		$("#showBookList").append('<button onclick="changePage(' + (data.pdto.startNum-1) + ',' + (data.pdto.nowBlock - 1) + ')"><i class="fas fa-chevron-left"></i></button>');
		    	}
		    	
		    	//페이지 넘버버 표시
		    	
		    	if(data.pdto.nowBlock != data.pdto.totalBlockNum){ //마지막 블록 아닐때
		    		for(var i = data.pdto.startNum; i <= data.pdto.startNum + 4; i++){
		    			$("#showBookList").append('<button onclick="changePage(' + i + ',' + data.pdto.nowBlock + ')">' + i + '</button>');
		    		}
		    	}else{
		    		for(var i = data.pdto.startNum; i <= data.pdto.totalPageNum; i++){
		    			$("#showBookList").append('<button onclick="changePage(' + i + ',' + data.pdto.nowBlock + ')">' + i + '</button>');
		    		}
		    	}
		    	
		    	//오른쪽 화살표
		    	if(data.pdto.nowBlock < data.pdto.totalBlockNum){
		    		$("#showBookList").append('<button onclick="changePage(' + (data.pdto.startNum+5) + ',' + (data.pdto.nowBlock + 1) + ')"><i class="fas fa-chevron-right"></i></button>');
		    	}
			
		}
	});

}


//댓글 등록 


function addComment() {
	if(document.getElementById("commentContent").value == ""){
		alert("댓글내용을 입력하세요");
		return false;
	}
	
	var content = document.getElementById("commentContent").value;
	var user = document.getElementById("loginUser").value;
	var notice_board_idx = document.getElementById("notice_board_idx").value;
	location.href = '/addComment?notice_board_idx=' + notice_board_idx + '&writer=' + user + '&content=' + content;

}


//댓글 클릭하면 대댓글 창이 열림
	function addCommentbox(num){
		var recom = document.getElementsByClassName("recommentBox");
		for(var i = 0; i < recom.length; i++){
			recom[i].innerHTML = "";
		}
		document.getElementById("recommentBox"+num).innerHTML = 
			'<i class="fas fa-long-arrow-alt-right"></i><input type ="text" size="50" name = "content" id = "recommentcontent" >'
			+ '<input type = "submit" value = "등록" onclick ="return contentCheck()">';
		
	}


//대댓글 입력시 내용 입력 유무
function contentCheck(){
	if(document.getElementById("recommentcontent").value.length == 0){
		alert("댓글내용을 입력하세요");
		return false;
	}
	return true;
}


//게시글 작성시 공백 체크
function writeNoticeCheck(){
	if(document.getElementById("title").value.length < 2){
		alert("제목은 2자 이상 입력해주세요");
		return false;
	}if(document.getElementById("content").value.length < 10){
		alert("내용은 10자 이상 입력해주세요");
		return false;
	}
	return true;
}