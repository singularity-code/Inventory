package com.dongyeop.okcomputer.dao;

import java.util.List;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;

public interface DaoComputerJsonInterface {

	public Computer getComputer(String id) throws ParseException;
	public List<Computer> getAllComputers() throws ParseException;
	public boolean delete(String id) throws ParseException;
	public boolean create(Computer computer);
	public boolean update(Computer computer) throws ParseException;
	public boolean swap(Computer c1, Computer c2) throws ParseException;
	public boolean move(Computer computer) throws ParseException;
}
