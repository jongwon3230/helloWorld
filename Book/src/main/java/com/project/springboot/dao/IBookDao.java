package com.project.springboot.dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.project.springboot.dto.BookDto;
import com.project.springboot.dto.NoticeBoardCommentDto;
import com.project.springboot.dto.NoticeBoardDto;
import com.project.springboot.dto.RentalListDto;
import com.project.springboot.dto.UserDto;
import com.project.springboot.dto.findBookDto;

@Mapper
public interface IBookDao {
	
	//아이디 비밀번호 일치시 1 아니면 0 반환
	public UserDto loginCheck(String id, String password);
	
	
	public void registerMember(UserDto dto );


	public String findUserId(UserDto dto);


	public String findUserPassword(UserDto dto);


	public int idDoubleCheckDao(String id);


	public ArrayList<BookDto> findBook_(findBookDto findCondition);

	
	public ArrayList<BookDto> findBook_book_idx_desc_(int changePage);


	public void bookInsert_(BookDto dto);


	public BookDto getBookDetail_(int book_idx);


	public void bookUpdate_(BookDto dto);


	public void bookDelete_(int book_idx);


	public void addBookRecommend_(int book_idx);


	public ArrayList<BookDto> getRecommendBookList_();


	public void cancleRecommend_(String string);


	public ArrayList<BookDto> getNewBookList_();


	public ArrayList<BookDto> getBestBookList_();


	public int totalData_();


	public int findTotalData(findBookDto dto);


	public ArrayList<NoticeBoardDto> getNoticeBoardList_(int i);


	public int getNoticeTotal_();


	public NoticeBoardDto getNoticeDetail_(int notice_board_idx);


	public void noticeCountUp_(int idx);


	public ArrayList<NoticeBoardCommentDto> getNoticeComment_(int notice_board_idx);


	public void addNoticeComment_(NoticeBoardCommentDto dto);


	public int getMaxCommentGroup_();


	public void addNoticeRecomment_(NoticeBoardCommentDto dto);


	public void writeNoticeBoard_(NoticeBoardDto dto);


	public void modifyNoticeBoard_(NoticeBoardDto dto);


	public ArrayList<NoticeBoardDto> getNoticeSearch_(String findCon, String findWord, int i);


	public int getNoticeSearchTotal_(String findCon, String findWord);


	public ArrayList<RentalListDto> getUserRentalList_(String user);


	public void addBookRental_(RentalListDto dto);


	public String getBookInven_(int book_idx);


	public void changeInven_(int book_idx);


	public int getUserExist_(String user);


	public void bookReturn_(int rental_list_idx, LocalDate now);


	public void changeInvenReturn_(int book_idx);


	public int getMaxRental_list_idx_(int book_idx);


	public int getTotalRental_();


	public ArrayList<RentalListDto> getRentalList_(int i);


	public void deleteNoticeBoard_(int notice_board_idx);





	
}
