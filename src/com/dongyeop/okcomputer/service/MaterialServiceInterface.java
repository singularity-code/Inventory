package com.dongyeop.okcomputer.service;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface MaterialServiceInterface<T1, T2> {
	// List
	T1 getComputerList() throws ParseException;
	T1 getTvList() throws ParseException;
	T1 getGarageList() throws ParseException;
	T1 getTelephoneList() throws ParseException;
	T1 getSwitchList() throws ParseException;
	T1 getFridgeList() throws ParseException;
	boolean createComputer(T1 o);
	boolean createTv(T1 o);
	boolean createTelephone(T1 o);
	boolean createSwitch(T1 o);
	boolean createFridge(T1 o);
	boolean deleteComputer(T2 s) throws ParseException;
	boolean deleteTv(T2 s) throws ParseException;
	boolean deleteTelephone(T2 s) throws ParseException;
	boolean deleteSwitch(T2 s) throws ParseException;
	boolean deleteFridge(T2 s) throws ParseException;
	T1 getMaterial(T2 s) throws ParseException;
	T1 getComputer(T2 s) throws ParseException;
	T1 getTv(T2 s) throws ParseException;
	T1 getTelephone(T2 s) throws ParseException;
	T1 getSwitch(T2 s) throws ParseException;
	T1 getFridge(T2 s) throws ParseException;
	boolean updateComputer(T1 o) throws ParseException;
	boolean updateTv(T1 o) throws ParseException;
	boolean updateTelephone(T1 o) throws ParseException;
	boolean updateSwitch(T1 o) throws ParseException;
	boolean updateFridge(T1 o) throws ParseException;
	boolean swap(T1 prev, T1 next) throws ParseException;
}
