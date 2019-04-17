package com.inventory.dao_database;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.inventory.dto.Computer;

public class ComputerRowMapper implements RowMapper<Computer> {

	@Override
	public Computer mapRow(ResultSet rs, int rownum) throws SQLException {
		Computer computer = new Computer();
		computer.setId(rs.getString("id"));
		computer.setDate(rs.getString("updatedate"));
		computer.setCampus(rs.getString("campus"));
		computer.setLocation(rs.getString("LOCATION"));
		computer.setName(rs.getString("NAME"));
		computer.setIp(rs.getString("ip"));
		computer.setType(rs.getString("type"));
		computer.setDomain(rs.getString("DOMAIN"));
		computer.setRole(rs.getString("role"));
		computer.setBrand(rs.getString("BRAND"));
		computer.setModel(rs.getString("MODEL"));
		computer.setSerialNumber(rs.getString("serialnumber"));
		computer.setProductNumber(rs.getString("productnumber"));
		computer.setOs(rs.getString("OS"));
		computer.setLicense(rs.getString("license"));
		computer.setMachineOnly(rs.getString("machineonly"));
		computer.setStatus(rs.getString("status"));
		computer.setOfficeActive(rs.getString("officeactive"));
		computer.setBitDef(rs.getString("bitdef"));
		computer.setCpu(rs.getString("cpu"));
		computer.setMemory(rs.getString("memory"));
		computer.setBios(rs.getString("bios"));
		computer.setPurchaseDate(rs.getString("purchasedate"));
		computer.setUser(rs.getString("user"));
		computer.setPrevious(rs.getString("previous"));

		return computer;
	}

}
