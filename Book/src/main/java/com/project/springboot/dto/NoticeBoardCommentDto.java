package com.project.springboot.dto;

import lombok.Data;

@Data
public class NoticeBoardCommentDto {
	private int comment_idx;
	private int notice_board_idx;
	private int depth;
	private String writer;
	private String content;
	private String reg_date;
	private int commentGroup;
}
