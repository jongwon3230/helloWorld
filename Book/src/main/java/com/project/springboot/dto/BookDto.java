package com.project.springboot.dto;

import lombok.Data;

@Data
public class BookDto {
	private int book_idx;
	private String title;
	private String writer;
	private String reg_date;
	private String categori;
	private String type;
	private String inven;
	private String publisher;
	private int count;
	private int recommend; //기본값 0 1이면 추천도서로 등록된 상태
	
}
