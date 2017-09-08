package com.dongyeop.okcomputer.dao;

import java.util.List;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;

public interface DaoComputerInterface {

	public void setDataSource(Object o) throws ParseException;

	public boolean create(Computer computer);

	public Computer getComputer(String id);

	public List<Computer> getAllComputers();

	public boolean delete(String id);

	public boolean update(Computer computer);
	
	public boolean update_broken(Computer computer);

	public void cleanup();
}
