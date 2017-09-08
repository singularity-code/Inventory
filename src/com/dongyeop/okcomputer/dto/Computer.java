package com.dongyeop.okcomputer.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Computer {
	String id;
	String updatedate;
	String campus;
	String location;
	String name;
	String ip;
	String type;
	String domain;
	String role;
	String brand;
	String model;
	String serialNumber;
	String productNumber;
	String os;
	String license;
	String machineOnly;
	String status;
	String officeActive;
	String bitDef;
	String cpu;
	String memory;
	String bios;
	String purchaseDate;
	String user;
	String previous;
	
	public Computer() {
		
	}

	
	public Computer(String id, String updatedate, String campus, String location, String name, String ip, String type,
			String domain, String role, String brand, String model, String serialNumber, String productNumber,
			String os, String license, String machineOnly, String status, String officeActive, String bitDef,
			String cpu, String memory, String bios, String purchaseDate, String user, String previous) {
		super();
		this.id = id;
		this.updatedate = updatedate;
		this.campus = campus;
		this.location = location;
		this.name = name;
		this.ip = ip;
		this.type = type;
		this.domain = domain;
		this.role = role;
		this.brand = brand;
		this.model = model;
		this.serialNumber = serialNumber;
		this.productNumber = productNumber;
		this.os = os;
		this.license = license;
		this.machineOnly = machineOnly;
		this.status = status;
		this.officeActive = officeActive;
		this.bitDef = bitDef;
		this.cpu = cpu;
		this.memory = memory;
		this.bios = bios;
		this.purchaseDate = purchaseDate;
		this.user = user;
		this.previous = previous;
	}

	public String getDate() {
		return updatedate;
	}

	public void setDate(String date) {
		this.updatedate = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getMachineOnly() {
		return machineOnly;
	}

	public void setMachineOnly(String machineOnly) {
		this.machineOnly = machineOnly;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOfficeActive() {
		return officeActive;
	}

	public void setOfficeActive(String officeActive) {
		this.officeActive = officeActive;
	}

	public String getBitDef() {
		return bitDef;
	}

	public void setBitDef(String bitDef) {
		this.bitDef = bitDef;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getBios() {
		return bios;
	}

	public void setBios(String bios) {
		this.bios = bios;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public String getUpdatedate() {
		return updatedate;
	}


	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
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
	
	public String generateDate() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		return dateFormat.format(now);	
	}
}
