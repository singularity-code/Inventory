package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface DaoMaterialInterface<T1, T2> {
	T1 getMaterial(T2 s) throws ParseException;
	List<?> getAllMaterials() throws ParseException;
	boolean delete(T2 s) throws ParseException;
	boolean create(T1 o);
	boolean update(T1 o) throws ParseException;
	boolean swap(T1 prev, T1 next);
}