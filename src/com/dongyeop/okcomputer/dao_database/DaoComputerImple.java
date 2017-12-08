package com.dongyeop.okcomputer.dao_database;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.Zabbix;

@Repository("daoComputer")
public class DaoComputerImple implements DaoComputerInterface {

	// DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Override
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean create(Computer computer) {
		String sqlQuery = "INSERT INTO COMPUTERS_IMPORT (ID, CAMPUS, LOCATION, NAME, IP, TYPE, DOMAIN, ROLE, BRAND, MODEL, SERIALNUMBER, PRODUCTNUMBER, OS, LICENSE, MACHINEONLY, STATUS, OFFICEACTIVE, BITDEF, CPU, MEMORY, BIOS, PURCHASEDATE)"
							+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { computer.getId(), computer.getCampus(), computer.getLocation(), computer.getName(),
				computer.getIp(), computer.getType(), computer.getDomain(), computer.getRole(), computer.getBrand(), computer.getModel(), computer.getSerialNumber(), computer.getProductNumber(), computer.getOs(), computer.getLicense(), computer.getMachineOnly(), computer.getStatus(), computer.getOfficeActive(), computer.getBitDef(),
				computer.getCpu(), computer.getMemory(), computer.getBios(), computer.getPurchaseDate() };
		return jdbcTemplate.update(sqlQuery, args) == 1;
	}

	@Override
	public Computer getComputer(String id) {
		String sqlQuery = "SELECT * FROM COMPUTERS_IMPORT WHERE ID = ?";
		Object[] args = new Object[] { id };
		Computer computer = jdbcTemplate.queryForObject(sqlQuery, args, new ComputerRowMapper());
		return computer;
	}

	@Override
	public List<Computer> getAllComputers() {
		String sqlQuery = "SELECT * FROM COMPUTERS_IMPORT";
		List<Computer> computerList = jdbcTemplate.query(sqlQuery, new ComputerRowMapper());
		return computerList;
	}

	@Override
	public boolean delete(String id) {
		String sqlQuery = "DELETE FROM COMPUTERS_IMPORT WHERE ID = ?";
		Object[] args = new Object[] { id };
		return jdbcTemplate.update(sqlQuery, args) == 1;
	}

	@Override
	public boolean update(Computer computer) {
		String sqlQuery = "UPDATE COMPUTERS_IMPORT SET CAMPUS = ?, LOCATION = ?, NAME = ?, IP = ?, TYPE = ?, DOMAIN = ?, ROLE = ?, BRAND = ?, MODEL = ?, SERIALNUMBER = ?, PRODUCTNUMBER = ?, OS = ?, LICENSE = ?, MACHINEONLY = ?, STATUS = ?, OFFICEACTIVE = ?, BITDEF = ?, CPU = ?, MEMORY = ?, BIOS = ?, PURCHASEDATE = ? WHERE ID = ?";
		Object[] args = new Object[] { computer.getCampus(), computer.getLocation(), computer.getName(), computer.getIp(), computer.getType(), computer.getDomain(), computer.getRole(), computer.getBrand(), computer.getModel(), computer.getSerialNumber(), computer.getProductNumber(), computer.getOs(), computer.getLicense(), computer.getMachineOnly(), computer.getStatus(), computer.getOfficeActive(), computer.getBitDef(), computer.getCpu(), computer.getMemory(), computer.getBios(), computer.getPurchaseDate(), computer.getId()};
		System.out.println(sqlQuery);
		return jdbcTemplate.update(sqlQuery, args) == 1;
	}

	@Override
	public void cleanup() {
		String sqlQuery = "TRUNCATE TABLE COMPUTERS";
		jdbcTemplate.execute(sqlQuery);
	}
	
	@Override
	public boolean update_broken(Computer computer) {
		String sqlQuery = "UPDATE COMPUTERS_IMPORT SET STATUS = ? WHERE ID = ?";
		Object[] args = new Object[] {"Broken", computer.getId()};
		return jdbcTemplate.update(sqlQuery, args) == 1;
	}

	@Override
	public List<Zabbix> getAllzabbix() {
		String sqlQuery = "SELECT * FROM host_inventory WHERE name != '' AND name like '%koi%'";
		List<Zabbix> zabbixList = jdbcTemplate.query(sqlQuery, new ZabbixRowMapper());
		System.out.println("Zabbix Total : " + zabbixList.size());
		for(Zabbix item : zabbixList) {
			String name = item.getName();
			int idx = name.indexOf(".");
			String realName = name.substring(0, idx);
			System.out.println("Zabbix: " + realName);
		}
		return zabbixList;
	}
}
