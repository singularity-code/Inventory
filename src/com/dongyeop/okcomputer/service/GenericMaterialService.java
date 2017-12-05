package com.dongyeop.okcomputer.service;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface GenericMaterialService<T1, T2> {
	T1 getLists() throws ParseException;
	boolean create(T1 o);
	boolean delete(T1 o) throws ParseException;
	T1 getMaterial(T2 s) throws ParseException;
	boolean update(T2 s) throws ParseException;
}
