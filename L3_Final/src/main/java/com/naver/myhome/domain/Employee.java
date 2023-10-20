package com.naver.myhome.domain;

import lombok.Data;

@Data
public class Employee {
	private int id;
	private int company_id;
	private int user_id;
	private String department;
	private String position;
	private String auth="N";
	private int status;
	private String company_invited;
	private String name;
	private String email;
	private String pic;
	private String phone;
	
}
