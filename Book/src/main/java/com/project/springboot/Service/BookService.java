package com.project.springboot.Service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.springboot.dao.IBookDao;
import com.project.springboot.dto.BookDto;
import com.project.springboot.dto.NoticeBoardCommentDto;
import com.project.springboot.dto.NoticeBoardDto;
import com.project.springboot.dto.RentalListDto;
import com.project.springboot.dto.UserDto;
import com.project.springboot.dto.findBookDto;

@Service
public class BookService implements IBookService{
	
	@Autowired
	IBookDao bookdao;

	@Override
	public UserDto loginCheck(String id, String password) {
		UserDto result = bookdao.loginCheck(id, password);
		return result;
	}

	@Override
	public void register(UserDto dto) {
		bookdao.registerMember(dto);
		
	}

	@Override
	public String findId(UserDto dto) {
		return bookdao.findUserId(dto);
	}

	@Override
	public String findPassword(UserDto dto) {
		
		return bookdao.findUserPassword(dto);
	}

	@Override
	public int idDoubleCheck(String id) {
		
		return bookdao.idDoubleCheckDao(id);
	}

	@Override
	public ArrayList<BookDto> findBook(findBookDto findCondition) {
		
		return bookdao.findBook_(findCondition);
	}

	@Override
	public ArrayList<BookDto> findBook_book_idx_desc(int changePage) {
		
		return bookdao.findBook_book_idx_desc_(changePage);
	}

	@Override
	public void bookInsert(BookDto dto) {
		bookdao.bookInsert_(dto);
		
	}

	@Override
	public BookDto getBookDetail(int book_idx) {
		return bookdao.getBookDetail_(book_idx);
	}

	@Override
	public void bookUpdate(BookDto dto) {
		bookdao.bookUpdate_(dto);
		
	}

	@Override
	public void bookDelete(int book_idx) {
		bookdao.bookDelete_(book_idx);
		
	}

	@Override
	public void addBookRecommend(int book_idx) {
		bookdao.addBookRecommend_(book_idx);
		
	}

	@Override
	public ArrayList<BookDto> getRecommendBookList() {
		return bookdao.getRecommendBookList_();
	}

	@Override
	public void cancleRecommend(String string) {
		bookdao.cancleRecommend_(string);
		
	}

	@Override
	public ArrayList<BookDto> getNewBookList() {
		return bookdao.getNewBookList_();
	}

	@Override
	public ArrayList<BookDto> getBestBookList() {
		return bookdao.getBestBookList_();
	}

	@Override
	public int totalData() {
		return bookdao.totalData_();
	}

	@Override
	public int totalData(findBookDto dto) {
		
		return bookdao.findTotalData(dto);
	}

	@Override
	public ArrayList<NoticeBoardDto> getNoticeBoardList(int i) {
		
		return bookdao.getNoticeBoardList_(i);
	}

	@Override
	public int getNoticeTotal() {
		return bookdao.getNoticeTotal_();
	}

	@Override
	public NoticeBoardDto getNoticeDetail(int notice_board_idx) {
		return bookdao.getNoticeDetail_(notice_board_idx);
	}

	@Override
	public void noticeCountUp(int idx) {
		bookdao.noticeCountUp_(idx);
		
	}

	@Override
	public ArrayList<NoticeBoardCommentDto> getNoticeComment(int notice_board_idx) {
		return bookdao.getNoticeComment_(notice_board_idx);
	}

	@Override
	public void addNoticeComment(NoticeBoardCommentDto dto) {
		bookdao.addNoticeComment_(dto);
		
	}

	@Override
	public int getMaxCommentGroup() {
		return bookdao.getMaxCommentGroup_();
	}

	@Override
	public void addNoticeRecomment(NoticeBoardCommentDto dto) {
		bookdao.addNoticeRecomment_(dto);
		
	}

	@Override
	public void writeNoticeBoard(NoticeBoardDto dto) {
		bookdao.writeNoticeBoard_(dto);
		
	}

	@Override
	public void modifyNoticeBoard(NoticeBoardDto dto) {
		System.out.println("test");
		bookdao.modifyNoticeBoard_(dto);
		
	}

	@Override
	public ArrayList<NoticeBoardDto> getNoticeSearch(String findCon, String findWord, int i) {
		return bookdao.getNoticeSearch_(findCon, findWord, i);
	}

	@Override
	public int getNoticeSearchTotal(String findCon, String findWord) {
		
		return bookdao.getNoticeSearchTotal_(findCon, findWord);
	}

	@Override
	public ArrayList<RentalListDto> getUserRentalList(String user) {
		return bookdao.getUserRentalList_(user);
	}

	@Override
	public void addBookRental(RentalListDto dto) {
		bookdao.addBookRental_(dto);
		
	}

	@Override
	public String getBookInven(int book_idx) {
		return bookdao.getBookInven_(book_idx);
	}

	@Override
	public void changeInven(int book_idx) {
		bookdao.changeInven_(book_idx);
	}

	@Override
	public int getUserExist(String user) {
		return bookdao.getUserExist_(user);
	}

	@Override
	public void bookReturn(int rental_list_idx, LocalDate now) {
		bookdao.bookReturn_(rental_list_idx, now);
		
	}

	@Override
	public void changeInvenReturn(int book_idx) {
		bookdao.changeInvenReturn_(book_idx);
		
	}

	@Override
	public int getMaxRental_list_idx(int book_idx) {
		return bookdao.getMaxRental_list_idx_(book_idx);
	}

	@Override
	public int getTotalRental() {
		return bookdao.getTotalRental_();
	}

	@Override
	public ArrayList<RentalListDto> getRentalList(int i) {
		return bookdao.getRentalList_(i);
	}

	@Override
	public void deleteNoticeBoard(int notice_board_idx) {
		bookdao.deleteNoticeBoard_(notice_board_idx);
		
	}



}
