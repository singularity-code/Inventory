package com.dongyeop.okcomputer.dto;

interface Material {
	String id = null;
	String name = null;
	String type = null;
	String brand = null;
	String user = null;
	String previous = null;
	String campus = null;
	String location = null;
	String updatedate = null;
	String status = null;

	String getId();

	void setId(String id);

	String getName();

	void setName(String name);

	String getType();

	void setType(String type);

	String getBrand();

	void setBrand(String brand);

	String getUser();

	void setUser(String user);

	String getPrevious();

	void setPrevious(String previous);

	String getCampus();

	void setCampus(String campus);

	String getLocation();

	void setLocation(String location);

	String getUpdatedate();

	void setUpdatedate(String updatedate);

	String getStatus();

	void setStatus(String status);
}
