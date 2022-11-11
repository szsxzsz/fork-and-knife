package com.fork.store.db;

import lombok.Data;

@Data
public class StoreDTO {
	private Long s_no;
	private String s_name;
	private String s_addr;
	private String s_tel;
	private String s_hours;
	private String s_type;
	private String s_image;
	private String s_contents;
	private String s_facility;
	private String s_latitude; // String으로 되어있으므로 저장할때 변경하든, 출력해서 사용할 때 변경하든지 해야할듯
	private String s_longtude;
	private String s_menuname;
	private String s_menuprice;
	private String s_menuImg;
	private int s_number; // 사업자 번호
	private Long m_no;
	private Double s_star;
	
	
}
