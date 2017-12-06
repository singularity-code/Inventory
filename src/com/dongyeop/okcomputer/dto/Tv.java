package com.dongyeop.okcomputer.dto;

public class Tv extends KoiMaterial {
	public Tv(String id, String type, String brand, String user, String previous, String campus, String location, String date) {

	}

	public Tv(String id, String name, String type, String brand, String user, String previous, String campus, String location, String updatedate, String status) {
		super(id, name, type, brand, user, previous, campus, location, updatedate, status);
	}
}
