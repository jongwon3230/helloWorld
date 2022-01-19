package com.project.springboot;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.Service.IBookService;
import com.project.springboot.dto.BookDto;
import com.project.springboot.dto.PagingDto;
import com.project.springboot.dto.RentalListDto;
import com.project.springboot.dto.findBookDto;

@Controller
public class AdminController {
	
	@Autowired
	IBookService service;
	
	
	@RequestMapping("/admin")
	public String adminRoot(HttpServletRequest request, Model model) {
		String page = request.getParameter("adminpage");
		model.addAttribute("adminpage", page);
		ArrayList<BookDto> recommendBookList = null;
	
	
		// 책 리스트를 모두를 번호로 받아오는 메서드
		if (page != null) {
			if (page.equals("showBookList")) {
				int totalData = service.totalData(); //총 데이터 수를 받아옴
				model.addAttribute("totalData",totalData);
				
				int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
				int changePage = 0; //페이지 변경 요청시 변경할 페이지
				
				if(request.getParameter("changePage") != null) {
					changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
				}else changePage = 1;
				
				if(request.getParameter("nowBlock") != null) {
					nowblock = Integer.parseInt(request.getParameter("nowBlock"));
				}
				 
				ArrayList<BookDto> bookList = service.findBook_book_idx_desc(changePage * 10 - 10); // 10개씩 단위 끊어서.
				model.addAttribute("bookList", bookList);
				
				//페이징 처리르 위한 코드
				PagingDto pdto = new PagingDto(totalData);
				pdto.setNowPage(changePage);
				pdto.setNowBlock(nowblock);
				pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
				
				model.addAttribute("pdto", pdto);
				
			
//				System.out.println( "한페이지에 표시할 게시글 수 : " + pdto.getNumPerPage());
//				System.out.println( "한화면에 표시할 페이지 수" + pdto.getBlockSize());
//				System.out.println( "총 게시글 수" + pdto.getBoardNum());
//				System.out.println( "총 페이지 수" + pdto.getTotalPageNum());
//				System.out.println( "총 블록 수" + pdto.getTotalBlockNum());
//				System.out.println( "현재 블록" + pdto.getNowBlock());
//				System.out.println( "마지막 페이지에 표시할 게시글 수 " + pdto.getLastPageBoardNum());
//				System.out.println( "현재 페이지" + pdto.getNowPage());
//				System.out.println( "시작 번호 :" + pdto.getStartNum());
//				System.out.println( "마지막 번호" + pdto.getLastNum());
//				System.out.println( pdto.getNowBlock() < pdto.getTotalBlockNum());
				
				model.addAttribute("url", "totalList");
				
			}

			// 책 정보 수정을 위해 책 정보를 받아오는 매서드
			if (page.equals("bookDetail")) {
				int book_idx = Integer.parseInt(request.getParameter("book_idx"));
				BookDto dto = service.getBookDetail(book_idx);
				model.addAttribute("bookDetail", dto);
			}
			
			//추천도서 목록을 받아오는 메서드
			if(page.equals("bookRecommend")) {
				recommendBookList = service.getRecommendBookList();
				model.addAttribute("recommendBookList", recommendBookList);
			}
			
			//대출 목록 가져오는 코드
			if(page.equals("bookRental")) {
				
				int totalData = service.getTotalRental();
		
				model.addAttribute("totalData",totalData);

				int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
				int changePage = 0; //페이지 변경 요청시 변경할 페이지
				
				if(request.getParameter("changePage") != null) {
					changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
				}else changePage = 1;
				
				if(request.getParameter("nowBlock") != null) {
					nowblock = Integer.parseInt(request.getParameter("nowBlock"));
				}
				
				ArrayList <RentalListDto> rentalList = service.getRentalList(changePage * 10 - 10); // 10개씩 단위 끊어서.
				model.addAttribute("rentalList", rentalList);
			
				//페이징 처리르 위한 코드
				PagingDto pdto = new PagingDto(totalData);
				pdto.setNowPage(changePage);
				pdto.setNowBlock(nowblock);
				pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
				
				model.addAttribute("pdto", pdto);
			}
		}
		
		return "/admin/admin_main";
	}
	
	//admin 도서 검색 메서드
	@RequestMapping("/adminSearch")
	public String adminSearch(findBookDto dto, Model model, HttpServletRequest request) {
	
		
		model.addAttribute("adminpage", "showBookList");
		
		//검색 조건에 날짜 미적용시 날짜 적용코드
		if(dto.getMinDate().length() == 0) {
			dto.setMinDate("1900-01-01");
		}
		
		if(dto.getMaxDate().length() == 0) {
			LocalDate date = LocalDate.now();
			dto.setMaxDate(date.toString());
		}
		
		
		int total = service.totalData(dto);//검색한 데이터의 수를 가지고 옴
		model.addAttribute("totalData",total);//총 데이터 수
		
		int nowblock = 1; //다음 블록으로 넘어갈때 필요한 정보
		int changePage = 0; //페이지 변경 요청시 변경할 페이지
		
		if(request.getParameter("changePage") != null) {
			changePage = Integer.parseInt(request.getParameter("changePage")); //페이지 변경 요청시 변경 페이지
		}else changePage = 1;
		
		if(request.getParameter("nowBlock") != null) {
			nowblock = Integer.parseInt(request.getParameter("nowBlock"));
		}
		dto.setChangePage(changePage * 10 - 10);
		ArrayList<BookDto> bookList =  service.findBook(dto);
		model.addAttribute("bookList", bookList);
		
	
		
		//페이징 처리
		PagingDto pdto = new PagingDto(total);
		pdto.setNowPage(changePage);
		pdto.setNowBlock(nowblock);
		pdto.setStartNum(pdto.getStartNum() + ((nowblock-1) * 5));
		
		model.addAttribute("pdto", pdto);
		
		model.addAttribute("findBookDto", dto);
		model.addAttribute("url", "searchList");
		
		
		return "/admin/admin_main";
	}
	
	//도서 등록 메서드
	@RequestMapping("/bookInsert")
	public String bookInsert(BookDto dto, Model model){
		service.bookInsert(dto);
		model.addAttribute("massage", "도서가 등록되었습니다.");
		/*
		 * //파일 업로드 코드 int sizeLimit = 1024*1024*15; // 파일 크기를 15m으로 제한 String file =
		 * ""; String oriFile = "";
		 * 
		 * JSONObject obj = new JSONObject(); // JSON 객체 변수 생성
		 * 
		 * try { System.out.println("try문 시작"); String savePath //업로드 되는 파일 저장 위치 =
		 * ResourceUtils.getFile("classpath:static/bookImage/").toPath().toString();
		 * System.out.println(savePath);
		 * 
		 * MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit,
		 * "UTF-8", new DefaultFileRenamePolicy()); System.out.println("업르드??");
		 * 
		 * Enumeration<?> files = multi.getFileNames(); String str = (String)
		 * files.nextElement();
		 * 
		 * file = multi.getFilesystemName(str); oriFile =
		 * multi.getOriginalFileName(str);
		 * 
		 * obj.put("success", new Integer(1)); obj.put("desc", "업로드 성공"); } catch
		 * (FileNotFoundException e) { e.printStackTrace(); obj.put("success", new
		 * Integer(0)); obj.put("desc", "업로드 실패"); }
		 */
		
		return "redirect:/admin?adminpage=bookInsert";
	}
	
	//도서 정보 수정 메서드
	@RequestMapping("/booKUpdate")
	public String bookUpdate(BookDto dto, Model model) {
		service.bookUpdate(dto);
		return "redirect:/admin?adminpage=showBookList";
	}
	
	//도서 정보 삭제 메서드
	@RequestMapping("/bookDelete")
	public String bookDelete(HttpServletRequest request, Model model) {
		int book_idx = Integer.parseInt(request.getParameter("book_idx"));
		service.bookDelete(book_idx);
		return "redirect:/admin?adminpage=showBookList";
	}
	
	//추천도서 등록 메서드
	@RequestMapping("/addBookRecommend")
	public String addBookRecommend(HttpServletRequest request, Model model) {
		int book_idx = Integer.parseInt(request.getParameter("book_idx"));
		service.addBookRecommend(book_idx);
		return "redirect:/admin?adminpage=showBookList";
	}
	
	//추천도서 해제 매서드
	@RequestMapping("/cancleRecommend")
	public String cancleRecommend(HttpServletRequest request, Model model) {
		String[] rcheck = request.getParameterValues("rcheck");
		
		for(int i = 0; i < rcheck.length; i++) {
			service.cancleRecommend(rcheck[i]);
		}
		
		return "redirect:/admin?adminpage=bookRecommend";
	}
	

	//도서 대출등록
	@ResponseBody
	@RequestMapping("/booKRental")
	public String bookRental(RentalListDto dto) {
		
		int exist = service.getUserExist(dto.getUser());
		if(exist == 0) {
			return "<script>alert('id가 존재하지 않습니다.'); location.href='admin?adminpage=bookRental';</script>";
		}
		//도서 대출수가 5이상 또는 대출기한을 지나 반납하지 않은 도서가 있으면 대출 불가...
		ArrayList <RentalListDto> userRentalList = service.getUserRentalList(dto.getUser());
	
		
		//도서 대출 수가 5이상일경우
		if(userRentalList.size() >= 5) {
			return  "<script>alert('대여가능수량을 초과하였습니다.'); location.href='admin?adminpage=bookRental';</script>";
		}
		
		//미반납 도서가 존재할경우
		if(userRentalList.size() != 0) {
			LocalDate now = LocalDate.now();
			for(int i = 0; i < userRentalList.size(); i++) {
				if(userRentalList.get(i).getDeadline().isAfter(now) == false) {
					return  "<script>alert('미반납 도서가 있습니다.'); location.href='admin?adminpage=bookRental';</script>";
				}
			}
		}
		
		//현재 대출 중인 책일경우
		String inven = service.getBookInven(dto.getBook_idx());
		if(inven.equals("대여중")) {
			return  "<script>alert('대여중인 도서입니다.'); location.href='admin?adminpage=bookRental';</script>";
		}
		
		//대출 실행
		service.addBookRental(dto);
		service.changeInven(dto.getBook_idx());
		
		
		
		return "<script>alert('대여되었습니다.'); location.href='admin?adminpage=bookRental';</script>";
	}
	
	//도서 반납
	@ResponseBody
	@RequestMapping("/booKReturn")
	public String bookReturn(RentalListDto dto) {
		//대여중인 도서인지 확인
		String inven = service.getBookInven(dto.getBook_idx());
		if(inven.equals("대여가능") || inven == null) {
			return  "<script>alert('대여중인 도서가 아닙니다.'); location.href='admin?adminpage=bookRental';</script>";
		}
		
		//도서 반납
		//반납할 rental_list_idx 가져오기
		int rental_list_idx = service.getMaxRental_list_idx(dto.getBook_idx());
		
		LocalDate now = LocalDate.now();
		service.bookReturn(rental_list_idx, now);
		service.changeInvenReturn(dto.getBook_idx());
		
		return "<script>alert('도서반납이 완료되었습니다.'); location.href='admin?adminpage=bookRental';</script>";
	}
}
