package com.dongyeop.okcomputer.service;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface MaterialServiceInterface<T1, T2> {
	T1 getComputerList() throws ParseException;
	T1 getTvList() throws ParseException;
	T1 getGarageList() throws ParseException;
	boolean create(T1 o);
	boolean delete(T1 o) throws ParseException;
	T1 getMaterial(T2 s) throws ParseException;
	boolean update(T2 s) throws ParseException;
}
