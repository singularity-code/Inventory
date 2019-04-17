package com.inventory.dto;

public class Computer extends KoiMaterial {
	String ip;
	String domain;
	String role;
	String model;
	String serialNumber;
	String productNumber;
	String os;
	String license;
	String machineOnly;
	String officeActive;
	String bitDef;
	String cpu;
	String memory;
	String bios;
	String purchaseDate;

	public Computer() {
		
	}

	public Computer(String index, String sn, String id, String name, String type, String brand, String user,
			String previous, String campus, String location, String updatedate, String status, String comment) {
		super(index, sn, id, name, type, brand, user, previous, campus, location, updatedate, status, comment);
		// TODO Auto-generated constructor stub
	}

	public String getDate() {
		return updatedate;
	}

	public void setDate(String date) {
		this.updatedate = date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
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
}
