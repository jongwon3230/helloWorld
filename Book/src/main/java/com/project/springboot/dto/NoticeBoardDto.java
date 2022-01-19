package com.project.springboot.dto;

import lombok.Data;

@Data
public class NoticeBoardDto {
	private int notice_board_idx;
	private String title;
	private String content;
	private String writer;
	private String reg_date;
	private String update_date;
	private int count;
}
