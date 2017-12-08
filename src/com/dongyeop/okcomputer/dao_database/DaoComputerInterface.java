package com.dongyeop.okcomputer.dao_database;

import java.util.List;

import javax.sql.DataSource;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.Zabbix;

public interface DaoComputerInterface {

	public void setDataSource(DataSource dataSource) throws ParseException;

	public boolean create(Computer computer);

	public Computer getComputer(String id);

	public List<Computer> getAllComputers();

	public boolean delete(String id);

	public boolean update(Computer computer);
	
	public boolean update_broken(Computer computer);

	public void cleanup();
	
	public List<Zabbix> getAllzabbix();
}
