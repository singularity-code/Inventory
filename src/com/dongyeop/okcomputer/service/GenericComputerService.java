package com.dongyeop.okcomputer.service;

import java.util.List;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;

public interface GenericComputerService {
	public List<Computer> getWelcomeMessage(String name);
	public Object getLists() throws ParseException;
	public Object getGarageLists() throws ParseException;
	public Object getTvLists() throws ParseException;
	public boolean create(Computer computer);
	public boolean delete(String id) throws ParseException;
	public Object getComputer(String id) throws ParseException;
	public boolean update(Computer computer) throws ParseException;
	public boolean swap(Computer computer, Computer next) throws ParseException;
	public boolean move(Computer computer) throws ParseException;
}
