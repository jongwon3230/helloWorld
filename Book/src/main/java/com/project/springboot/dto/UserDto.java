package com.project.springboot.dto;

import lombok.Data;

@Data
public class UserDto {
	private int user_idx;
	private String id;
	private String password;
	private String passwordChk;
	private String name;
	private String birthday;
	private String year;
	private String month;
	private String date;
	private String email;
	private String phone;
	private String addressCode;
	private String address;
	private String detailAddress;
}
