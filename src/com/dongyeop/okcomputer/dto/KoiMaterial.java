package com.dongyeop.okcomputer.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class KoiMaterial implements Material{
	String id;
	String name;
	String type;
	String brand;
	String user;
	String previous;
	String campus;
	String location;
	String updatedate;
	String status;

	public KoiMaterial() {
	}

	public KoiMaterial(String id, String name, String type, String brand, String user, String previous, String campus, String location, String updatedate, String status) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.brand = brand;
		this.user = user;
		this.previous = previous;
		this.campus = campus;
		this.location = location;
		this.updatedate = updatedate;
		this.status = status;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String getName() {
		return name;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getType() {
		return type;
	}

	@Override
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String getBrand() {
		return brand;
	}

	@Override
	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Override
	public String getUser() {
		return user;
	}

	@Override
	public void setUser(String user) {
		this.user = user;
	}

	@Override
	public String getPrevious() {
		return previous;
	}

	@Override
	public void setPrevious(String previous) {
		this.previous = previous;
	}

	@Override
	public String getCampus() {
		return campus;
	}

	@Override
	public void setCampus(String campus) {
		this.campus = campus;
	}

	@Override
	public String getLocation() {
		return location;
	}

	@Override
	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String getUpdatedate() {
		return updatedate;
	}

	@Override
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String getStatus() {
		return status;
	}

	@Override
	public void setStatus(String status) {
		this.status = status;
	}

	public String generateDate() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		return dateFormat.format(now);
	}
}
