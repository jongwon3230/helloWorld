package com.project.springboot.dto;

import lombok.Data;

@Data
public class findBookDto {
	private String findCondition; //검색조건
	private String findWord; //검색어
	private String orderbyStandard; //정렬기준
	private String orderbyCondition; //정렬조건 desc/asc
	private String minDate; //발행년도 최소
	private String maxDate; //발행년도 최대
	private String categori; //카테고리(철학 종교 언어..)
	private String type; //검색조건
	private int changePage;
}
