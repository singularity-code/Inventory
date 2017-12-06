package com.dongyeop.okcomputer.service;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface MaterialServiceInterface<T1, T2> {
	T1 getComputerList() throws ParseException;
	T1 getTvList() throws ParseException;
	T1 getGarageList() throws ParseException;
	boolean createComputer(T1 o);
	boolean deleteComputer(T2 s) throws ParseException;
	boolean deleteTv(T2 s) throws ParseException;
	T1 getMaterial(T2 s) throws ParseException;
	T1 getComputer(T2 s) throws ParseException;
	T1 getTv(T2 s) throws ParseException;
	boolean update(T2 s) throws ParseException;
}
