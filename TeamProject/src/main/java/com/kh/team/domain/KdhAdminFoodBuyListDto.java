package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhAdminFoodBuyListDto {
	private int food_num;
	private String user_id;
	private int food_buy_total_price;
	private Timestamp food_buy_date;
	private int food_buy_count;
	private String food_buy_check;
	private String food_name;
	public KdhAdminFoodBuyListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhAdminFoodBuyListDto(int food_num, String user_id, int food_buy_total_price, Timestamp food_buy_date,
			int food_buy_count, String food_buy_check, String food_name) {
		super();
		this.food_num = food_num;
		this.user_id = user_id;
		this.food_buy_total_price = food_buy_total_price;
		this.food_buy_date = food_buy_date;
		this.food_buy_count = food_buy_count;
		this.food_buy_check = food_buy_check;
		this.food_name = food_name;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getFood_buy_total_price() {
		return food_buy_total_price;
	}
	public void setFood_buy_total_price(int food_buy_total_price) {
		this.food_buy_total_price = food_buy_total_price;
	}
	public Timestamp getFood_buy_date() {
		return food_buy_date;
	}
	public void setFood_buy_date(Timestamp food_buy_date) {
		this.food_buy_date = food_buy_date;
	}
	public int getFood_buy_count() {
		return food_buy_count;
	}
	public void setFood_buy_count(int food_buy_count) {
		this.food_buy_count = food_buy_count;
	}
	public String getFood_buy_check() {
		return food_buy_check;
	}
	public void setFood_buy_check(String food_buy_check) {
		this.food_buy_check = food_buy_check;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	@Override
	public String toString() {
		return "KdhAdminFoodBuyListDto [food_num=" + food_num + ", user_id=" + user_id + ", food_buy_total_price="
				+ food_buy_total_price + ", food_buy_date=" + food_buy_date + ", food_buy_count=" + food_buy_count
				+ ", food_buy_check=" + food_buy_check + ", food_name=" + food_name + "]";
	}
	
	
}
