package com.dongyeop.okcomputer.dao;

import java.util.List;

import com.dongyeop.okcomputer.dto.Tv;
import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;

public interface DaoComputerJsonInterface {

	Computer getComputer(String id) throws ParseException;
	List<Computer> getAllComputers() throws ParseException;
	List<Computer> getAllGarage() throws ParseException;
	List<Tv> getAllTv() throws ParseException;
	boolean delete(String id) throws ParseException;
	boolean create(Computer computer);
	boolean update(Computer computer) throws ParseException;
	boolean swap(Computer c1, Computer c2) throws ParseException;
	boolean move(Computer computer) throws ParseException;
}
