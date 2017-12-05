package com.dongyeop.okcomputer.dto;

public class Tv {
	String id;
	String type;
	String brand;
	String user;
	String previous;
	String campus;
	String location;
	String comment;
	String updatedate;

	public Tv() {

	}

	public Tv(String id, String type, String brand, String user, String previous, String campus, String location, String comment, String updatedate) {
		this.id = id;
		this.type = type;
		this.brand = brand;
		this.user = user;
		this.previous = previous;
		this.campus = campus;
		this.location = location;
		this.comment = comment;
		this.updatedate = updatedate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPrevious() {
		return previous;
	}

	public void setPrevious(String previous) {
		this.previous = previous;
	}

	public String getCampus() {
		return campus;
	}

	public void setCampus(String campus) {
		this.campus = campus;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
}
