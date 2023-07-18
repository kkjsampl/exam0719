package com.aboard1.vo;

import java.time.*;

import lombok.*;

@Getter
@AllArgsConstructor
@ToString
public class Board {
	private Long bno;
	@Setter 
	private String title;
	@Setter 
	private String content;
	private LocalDate writeday;
	@Setter 
	private Long readcnt;
	private String nickname;
	private String password;
}
