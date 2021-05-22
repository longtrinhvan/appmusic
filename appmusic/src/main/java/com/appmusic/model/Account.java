package com.appmusic.model;

public class Account {

	public int id;
	public int idrole;
	public String name;
	public String fullname;
	public String password;
	public String image;
	public int isdelete;
	public String token;

	
	
	public Account() {

	}

	public Account(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
}
