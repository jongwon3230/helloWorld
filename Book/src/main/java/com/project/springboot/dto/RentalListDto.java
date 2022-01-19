package com.project.springboot.dto;


import java.time.LocalDate;

import lombok.Data;

@Data
public class RentalListDto {
	private int rental_list_idx;
	private int book_idx;
	private String user;
	private int period;
	private LocalDate start_date;
	private LocalDate deadline;
	private LocalDate return_date;
	private String rental_state;
	private String title;
}
