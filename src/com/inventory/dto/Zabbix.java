package com.inventory.dto;

public class Zabbix {
	String hostid;
	String name;
	String hardware_full;
	
	public Zabbix() {

	}

	public Zabbix(String hostid, String name, String hardware_full) {
		super();
		this.hostid = hostid;
		this.name = name;
		this.hardware_full = hardware_full;
	}
	
	public String getHostid() {
		return hostid;
	}
	public void setHostid(String hostid) {
		this.hostid = hostid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHardware_full() {
		return hardware_full;
	}
	public void setHardware_full(String hardware_full) {
		this.hardware_full = hardware_full;
	}

	@Override
	public String toString() {
		return "Zabbix [hostid=" + hostid + ", name=" + name + ", hardware_full=" + hardware_full + "]";
	}
	
}
