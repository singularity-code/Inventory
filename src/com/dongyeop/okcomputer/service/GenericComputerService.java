package com.dongyeop.okcomputer.service;

import java.util.List;

import com.dongyeop.okcomputer.dto.Tv;
import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;

public interface GenericComputerService {
	List<Computer> getWelcomeMessage(String name);
	Object getLists() throws ParseException;
	Object getGarageLists() throws ParseException;
	Object getTvLists() throws ParseException;
	boolean create(Computer computer);
	boolean delete(String id) throws ParseException;
	Object getComputer(String id) throws ParseException;
	boolean update(Computer computer) throws ParseException;
	boolean swap(Computer computer, Computer next) throws ParseException;
	boolean move(Computer computer) throws ParseException;

	boolean createTv(Tv tv);
}
