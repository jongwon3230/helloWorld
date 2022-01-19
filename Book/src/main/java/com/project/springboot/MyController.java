package com.project.springboot;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.Service.IBookService;
import com.project.springboot.dto.BookDto;
import com.project.springboot.dto.NoticeBoardCommentDto;
import com.project.springboot.dto.NoticeBoardDto;
import com.project.springboot.dto.PagingDto;
import com.project.springboot.dto.RentalListDto;
import com.project.springboot.dto.UserDto;
import com.project.springboot.dto.findBookDto;

@Controller
public class MyController {
	
	@Autowired
	IBookService service;
	
	@RequestMapping("/")
	public String root(Model model) {
		
		//추천도서 목록을 불러오자.
		ArrayList <BookDto> bookList = service.getRecommendBookList();
		model.addAttribute("bookList", bookList);
		
		return "/index";
	}
	
	//도서관 소개 페이지
	//@GetMapping("/intro")
	@RequestMapping("/intro")
	public String intro(HttpServletRequest request, Model model) {
		String introPage = request.getParameter("page");
		String title = request.getParameter("title");
		model.addAttribute("page", introPage);
		model.addAttribute("title",title);
		return "/intro/intro";
	}
	
	//이용안내 페이지
	@RequestMapping("/infor")
	public String infor(HttpServletRequest request, Model model) {
		String inforPage = request.getParameter("page");
		String title = request.getParameter("title");
		model.addAttribute("page", inforPage);
		model.addAttribute("title",title);
		return"/infor/infor";
	}
	
	//자료검색 페이지
	@RequestMapping("/bookSearch")
	public String search(HttpServletRequest request, Model model) {
		String bookSearchPage = request.getParameter("page");
		String title = request.getParameter("title");
		model.addAttribute("page", bookSearchPage);
		model.addAttribute("title",title);
		
		if(title != null) {
			
			//신작도서 페이질 경우 신작도서 목록 받아오는코드
			if(title.equals("신작도서")) {
				ArrayList<BookDto> bookList = service.getNewBookList();
				model.addAttribute("bookList", bookList);
			}
			
			//추천도서 페이지일 경우 추천도서 목록 받아오는 코드
			if(title.equals("추천도서")) {
				ArrayList<BookDto> bookList = service.getRecommendBookList();
				model.addAttribute("bookList", bookList);
			}
			
			//대출베스트 페이지일 경우 대출 TOP10목록을 받아오는 코드
			if(title.equals("대출베스트")) {
				ArrayList<BookDto> bookList = service.getBestBookList();
				model.addAttribute("bookList", bookList);
			}
		}
		
		return "/bookSearch/bookSearch";
	}
	
	//참여마당 페이지
	@RequestMapping("/noticeBoard")
	public String noticeBoard(HttpServletRequest request, Model model) {
		String noticeBoardPage = request.getParameter("page");
		String title = request.getParameter("title");
		model.addAttribute("page", noticeBoardPage);
		model.addAttribute("title",title);
		
		//자유게시판 페이지일 경우 게시판 리스트 받아옴
		if(noticeBoardPage.equals("noticeBoard05")) {
			int total = service.getNoticeTotal(); //게시글 총수를 받아온다.
			
			int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
			int changePage = 0; //페이지 변경 요청시 변경할 페이지
			
			if(request.getParameter("changePage") != null) {
				changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
			}else changePage = 1;
			
			if(request.getParameter("nowBlock") != null) {
				nowblock = Integer.parseInt(request.getParameter("nowBlock"));
			}
			
			ArrayList <NoticeBoardDto> noticeList =  service.getNoticeBoardList(changePage * 10 - 10); //10개 단위씩 끊어서 데이터 가져옴
			model.addAttribute("noticeList", noticeList);
		
			
			//페이징을 위한 코드
			PagingDto pdto = new PagingDto(total);
			pdto.setNowPage(changePage);
			pdto.setNowBlock(nowblock);
			pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
			model.addAttribute("pdto", pdto);
			model.addAttribute("url", "totalList");
			System.out.println( "한페이지에 표시할 게시글 수 : " + pdto.getNumPerPage());
			System.out.println( "한화면에 표시할 페이지 수" + pdto.getBlockSize());
			System.out.println( "총 게시글 수" + pdto.getBoardNum());
			System.out.println( "총 페이지 수" + pdto.getTotalPageNum());
			System.out.println( "총 블록 수" + pdto.getTotalBlockNum());
			System.out.println( "현재 블록" + pdto.getNowBlock());
			System.out.println( "마지막 페이지에 표시할 게시글 수 " + pdto.getLastPageBoardNum());
			System.out.println( "현재 페이지" + pdto.getNowPage());
			System.out.println( "시작 번호 :" + pdto.getStartNum());
			System.out.println( "마지막 번호" + pdto.getLastNum());
			System.out.println( pdto.getNowBlock() < pdto.getTotalBlockNum());
		}
		
		//게시판 상세보기
		if(noticeBoardPage.equals("noticeBoardDetail")) {
			int notice_board_idx = Integer.parseInt(request.getParameter("notice_board_idx"));
			
			NoticeBoardDto detailNotice = service.getNoticeDetail(notice_board_idx);
			detailNotice.setContent(detailNotice.getContent().replace("\r\n", "<br>"));
			model.addAttribute("detailNotice", detailNotice);
			service.noticeCountUp(notice_board_idx);
			
			//댓글 정보 가져오기
			ArrayList <NoticeBoardCommentDto> commentList =  service.getNoticeComment(notice_board_idx);
			model.addAttribute("commentList", commentList);
			
		}
		
		//게시글 수정 클릭시 수정할 정보 가져오기
		if(noticeBoardPage.equals("modifyNoticeBoard")) {
			NoticeBoardDto notice = service.getNoticeDetail(Integer.parseInt(request.getParameter("notice_board_idx")));
			model.addAttribute("notice", notice);
		}
		
		
		
		return "/noticeBoard/noticeBoard";
	}
	
	//내서재 페이지
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request, Model model, HttpSession session) {
		String mypage = request.getParameter("page");
		String title = request.getParameter("title");
		model.addAttribute("page", mypage);
		model.addAttribute("title",title);
		if(mypage.equals("mypage01")) {
			String user = (String) session.getAttribute("loginUser");
			if(!(user.equals("user"))) {
				ArrayList <RentalListDto> userRentalList = service.getUserRentalList(user);
				model.addAttribute("userRentalList", userRentalList);
				System.out.println(userRentalList.size());
			}
			
		}
		return "/mypage/mypage";
	}
	
	//로그인 확인
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) {
		String page = "loginPage";
		UserDto result = service.loginCheck(request.getParameter("id"), request.getParameter("password"));
		HttpSession session = request.getSession();
		
		if(result != null) {
			page = "mypage01";
			session.setAttribute("loginCheck", "OK");
			session.setAttribute("loginUser", result.getId());
			System.out.println(result.getId());
			session.setMaxInactiveInterval(60*120);
		}else {
			session.setAttribute("loginCheck", "FAIL");
			
			return "<script>alert('로그인 정보가 일치하지 않습니다.'); location.href='/mypage?page=" + page +"';</script>";
			
		}	
		
		return "<script>location.href='/mypage?page=" + page +"';</script>";
		//return "redirect:/mypage?page=" + page;
	}
	
	//회원가입
	@RequestMapping("/register")
	public String register(UserDto dto, Model model) {
		String birtyday = dto.getYear() + "." +dto.getMonth() + "." + dto.getDate();
		dto.setBirthday(birtyday);
		service.register(dto);
		return "redirect:/mypage?page=loginPage";
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loginCheck", "FAIL");
		session.setAttribute("loginUser", "user");
		return "redirect:/mypage?page=loginPage";
	}
	
	//id찾기
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String birthday = request.getParameter("year") + "." + request.getParameter("month") + "." + request.getParameter("date");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		UserDto dto = new UserDto();
		dto.setName(name);
		dto.setBirthday(birthday);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		String userid = service.findId(dto);
		return userid;
	}
	
	//검색 목록을 돌려주는 ajax 처리
	@ResponseBody
	@RequestMapping("/findPassword")
	public String findPassword(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String birthday = request.getParameter("year") + "." + request.getParameter("month") + "." + request.getParameter("date");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		
		UserDto dto = new UserDto();
		dto.setId(id);
		dto.setName(name);
		dto.setBirthday(birthday);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		String userPassword = service.findPassword(dto);
		System.out.println(userPassword);
		return userPassword;
	}
	
	@ResponseBody
	@RequestMapping("/idDoubleCheck")
	//아이디 중복확인 중복이면 1 아니면 0
	public int idDoubleCheck(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		System.out.println(id);
		int result = service.idDoubleCheck(id);
		System.out.println(result);
		return result;
	}
	
	//도서 검색
	
	
	@ResponseBody
	@RequestMapping("/findBook")
	public Map<String, Object> findBook(findBookDto dto, Model model, HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		//검색 조건에 날짜 미적용시 날짜 적용코드
		if(dto.getMinDate().length() == 0) {
			dto.setMinDate("1900-01-01");
		}
		
		if(dto.getMaxDate().length() == 0) {
			LocalDate date = LocalDate.now();
			dto.setMaxDate(date.toString());
		}
		
		//검색한 데이터의 수를 가져오는코드
		int total = service.totalData(dto); //검색한 데이터의 총 수를 가져온다.
		int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
		int changePage = 0; //페이지 변경 요청시 변경할 페이지
		
		if(request.getParameter("changePage") != null) {
			changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
		}else changePage = 1;
		
		if(request.getParameter("nowBlock") != null) {
			nowblock = Integer.parseInt(request.getParameter("nowBlock"));
		}
		
		dto.setChangePage(changePage *10 - 10); //10개 단위씩 끈어서 데이터 가져오기 위한 세팅
		ArrayList<BookDto> bookList =  service.findBook(dto);
		if(bookList.size() != 0) {
			model.addAttribute("bookList", bookList);
		}
		
		PagingDto pdto = new PagingDto(total);
		pdto.setNowPage(changePage);
		pdto.setNowBlock(nowblock);
		pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
	
		result.put("bookList", bookList);
		result.put("pdto", pdto);
		
		return result;
	}
	
	//댓글 등록 메서드
	@RequestMapping("/addComment")
	public String addComment(NoticeBoardCommentDto dto) throws UnsupportedEncodingException {
		
		int commentgroup = service.getMaxCommentGroup() + 1;
		
		dto.setCommentGroup(commentgroup);
		service.addNoticeComment(dto);
		
		String title = URLEncoder.encode("자유게시판", "UTF-8"); //한글깨짐 방지
	
		return "redirect:/noticeBoard?page=noticeBoardDetail&title=" + title + "&notice_board_idx=" + dto.getNotice_board_idx();
	}
	
	//대댓글 등록 메서드
	@RequestMapping("/addRecomment")
	public String addRecomment(NoticeBoardCommentDto dto) throws UnsupportedEncodingException {

		
		service.addNoticeRecomment(dto);
		
		String title = URLEncoder.encode("자유게시판", "UTF-8"); //한글깨짐 방지
		
		return "redirect:/noticeBoard?page=noticeBoardDetail&title=" + title + "&notice_board_idx=" + dto.getNotice_board_idx();
	}
	
	//게시글 쓰기
	@RequestMapping("/writeNoticeBoard")
	public String writeNoticeBoard(NoticeBoardDto dto) throws UnsupportedEncodingException {
		
		service.writeNoticeBoard(dto);
		
		String title = URLEncoder.encode("자유게시판", "UTF-8"); //한글깨짐 방지
		
		return "redirect:/noticeBoard?page=noticeBoard05&title=" + title;
	}
	
	//게시글 수정
	@RequestMapping("/modifyNoticeBoard")
	public String modifyNoticeBoard(NoticeBoardDto dto) throws UnsupportedEncodingException {
		
		service.modifyNoticeBoard(dto);
		
		String title = URLEncoder.encode("자유게시판", "UTF-8"); //한글깨짐 방지
		return "redirect:/noticeBoard?page=noticeBoard05&title=" + title;
	}
	
	//게시글 검색
	@RequestMapping("/noticeSearch")
	public String noticeSearch(HttpServletRequest request, Model model) {
		
		String noticeBoardPage = "noticeBoard05";
		String title = "자유게시판";
		model.addAttribute("page", noticeBoardPage);
		model.addAttribute("title",title);
		
		
		String findCon = request.getParameter("findCondition");
		String findWord = request.getParameter("findWord");
		model.addAttribute("findCondition", findCon);
		model.addAttribute("findWord", findWord);
	
		int total = service.getNoticeSearchTotal(findCon, findWord); //게시글 총수를 받아온다.
		
		int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
		int changePage = 0; //페이지 변경 요청시 변경할 페이지
		
		if(request.getParameter("changePage") != null) {
			changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
		}else changePage = 1;
		
		if(request.getParameter("nowBlock") != null) {
			nowblock = Integer.parseInt(request.getParameter("nowBlock"));
		}
		

		ArrayList <NoticeBoardDto> noticeList =  service.getNoticeSearch(findCon, findWord, changePage *10 - 10); //게시글 목록 받아옴
		
		model.addAttribute("noticeList", noticeList);
		
		
		//페이징을 위한 코드
		PagingDto pdto = new PagingDto(total);
		pdto.setNowPage(changePage);
		pdto.setNowBlock(nowblock);
		pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
		model.addAttribute("pdto", pdto);
		model.addAttribute("url", "searchList");
		System.out.println( "한페이지에 표시할 게시글 수 : " + pdto.getNumPerPage());
		System.out.println( "한화면에 표시할 페이지 수" + pdto.getBlockSize());
		System.out.println( "총 게시글 수" + pdto.getBoardNum());
		System.out.println( "총 페이지 수" + pdto.getTotalPageNum());
		System.out.println( "총 블록 수" + pdto.getTotalBlockNum());
		System.out.println( "현재 블록" + pdto.getNowBlock());
		System.out.println( "마지막 페이지에 표시할 게시글 수 " + pdto.getLastPageBoardNum());
		System.out.println( "현재 페이지" + pdto.getNowPage());
		System.out.println( "시작 번호 :" + pdto.getStartNum());
		System.out.println( "마지막 번호" + pdto.getLastNum());
		System.out.println( pdto.getNowBlock() < pdto.getTotalBlockNum());
		
		return "/noticeBoard/noticeBoard";
	}
	
	@ResponseBody
	@RequestMapping("/deleteNoticeBoard")
	public String deleteNoticeBoard(HttpServletRequest request) {
		int notice_board_idx = Integer.parseInt(request.getParameter("notice_board_idx"));
		service.deleteNoticeBoard(notice_board_idx);
		
		return "<script>alert('게시글이 삭제 되었습니다.'); location.href='/noticeBoard?page=noticeBoard05&title=자유게시판';</script>";
		
	}
}
