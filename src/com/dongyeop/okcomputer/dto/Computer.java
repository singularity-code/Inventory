package com.dongyeop.okcomputer.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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

	public Computer(String id, String date, String campus, String location, String name, String ip, String type, String domain, String role, String brand, String comModel, String serialNumber, String productNumber, String os, String license, String machineOnly, String status, String officeActive, String bitDef, String cpu, String memory, String bios, String purchaseDate, String user, String previous) {
		super(id, name, type, brand, user, previous, campus, location, date, status);
		this.ip = ip;
		this.domain = domain;
		this.role = role;
		this.model = model;
		this.serialNumber = serialNumber;
		this.productNumber = productNumber;
		this.os = os;
		this.license = license;
		this.machineOnly = machineOnly;
		this.officeActive = officeActive;
		this.bitDef = bitDef;
		this.cpu = cpu;
		this.memory = memory;
		this.bios = bios;
		this.purchaseDate = purchaseDate;
		this.model = comModel;
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
