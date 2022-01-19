package com.project.springboot.Service;

import java.time.LocalDate;
import java.util.ArrayList;

import com.project.springboot.dto.BookDto;
import com.project.springboot.dto.NoticeBoardCommentDto;
import com.project.springboot.dto.NoticeBoardDto;
import com.project.springboot.dto.RentalListDto;
import com.project.springboot.dto.UserDto;
import com.project.springboot.dto.findBookDto;

public interface IBookService {
	

	//로그인정보 확인
	public UserDto loginCheck(String id, String password);
	
	//회원가입 
	public void register(UserDto dto);
	
	//아이디찾기
	public String findId(UserDto dto);

	//비밀번호찾기
	public String findPassword(UserDto dto);

	//아이디 중복확인
	public int idDoubleCheck(String id);

	//책 리스트를 가져오는 매서드
	public ArrayList<BookDto> findBook(findBookDto findCondition);
	
	//책 리스트를 idx 내림차순으로 모두 가져옴
	public ArrayList<BookDto> findBook_book_idx_desc(int changePage);
	
	//도서 등록 매서드
	public void bookInsert(BookDto dto);
	
	//도서 정보 수정을 위해 책 정보 받아오는 매서드
	public BookDto getBookDetail(int book_idx);

	//도서 수정 매서드
	public void bookUpdate(BookDto dto);
	
	//도서 삭제 메서드
	public void bookDelete(int book_idx);

	//추천도서 등록 메서드
	public void addBookRecommend(int book_idx);
	
	//추천도서 목록을 받아오는 메서드
	public ArrayList<BookDto> getRecommendBookList();
	
	//추천도서 삭제 메서드
	public void cancleRecommend(String string);
	
	//신작도서 리스트를 가져오는 메서드
	public ArrayList<BookDto> getNewBookList();

	//대출 베스트 10 목록을 받아오는 메서드
	public ArrayList<BookDto> getBestBookList();
	
	//총 데이터 수를 가져온다.
	public int totalData();
	
	//검색한 정보의 데이터 수를 가져옴
	public int totalData(findBookDto dto);

	//게시판 글 리스트를 모두 가져온다.
	public ArrayList<NoticeBoardDto> getNoticeBoardList(int i);
	
	//게시판 글 총 수를 가져옴
	public int getNoticeTotal();
	
	//게시글 상세정보 가져옴
	public NoticeBoardDto getNoticeDetail(int notice_board_idx);

	//게시판 글 조회수 +1
	public void noticeCountUp(int notice_board_idx);
	
	//게시글의 댓글정보를 가져옴
	public ArrayList<NoticeBoardCommentDto> getNoticeComment(int notice_board_idx);

	//게시글에 댓글 추가
	public void addNoticeComment(NoticeBoardCommentDto dto);

	//댓글 추가시 댓글 그룹의 마지막 번호를 가져오는 메서드
	public int getMaxCommentGroup();
	
	//대댓글 등록
	public void addNoticeRecomment(NoticeBoardCommentDto dto);

	//게시글 쓰기
	public void writeNoticeBoard(NoticeBoardDto dto);

	//게시글 수정
	public void modifyNoticeBoard(NoticeBoardDto dto);

	//게시글 검색
	public ArrayList<NoticeBoardDto> getNoticeSearch(String findCon, String findWord, int i);

	//검색한 게시글 총수를 받아옴
	public int getNoticeSearchTotal(String findCon, String findWord);

	//유저의 대출 목록을 가져옴
	public ArrayList<RentalListDto> getUserRentalList(String user);

	//대출 실행
	public void addBookRental(RentalListDto dto);

	//도서의 대출 상태 반환 매서드
	public String getBookInven(int book_idx);

	//대출 실행할때 대여 상태 변경 메서드
	public void changeInven(int book_idx);

	//존재하는 id인지 확인
	public int getUserExist(String user);

	//도서 반납 메서드
	public void bookReturn(int rental_list_idx, LocalDate now);

	//도서 반납시 대출 상태 변경
	public void changeInvenReturn(int book_idx);

	//반납할 도서의 rental_list_idx 가져오기
	public int getMaxRental_list_idx(int book_idx);

	//대여목록의 수를 전부 가져옴
	public int getTotalRental();

	//대출목록을 반납일 순으로 가져옴
	public ArrayList<RentalListDto> getRentalList(int i);

	//게시글 삭제
	public void deleteNoticeBoard(int notice_board_idx);

	
}
