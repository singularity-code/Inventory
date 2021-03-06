package com.inventory.dao;

import java.util.List;

import org.json.simple.parser.ParseException;

public interface DaoMaterialInterface<T1, T2> {
	T1 getMaterial(T2 s) throws ParseException;
	List<?> getAllMaterials() throws ParseException;
	
	// This function is not using as Sorting Table in HTML
	List<?> getAllMaterialsByCampus(String campus) throws ParseException;
	
	boolean delete(T2 s) throws ParseException;
	boolean create(T1 o);
	boolean update(T1 o) throws ParseException;
	boolean swap(T1 prev, T1 next);
	int selectTotalMarketStaff();
	int selectTotalMarketStudent();
	int selectTotalKentL1Staff();
	int selectTotalKentL1Student();
	int selectTotalKentL5Staff();
	int selectTotalKentL5Student();
	int getListTotal();
	int getListTotalByStudent();
	int getListTotalByStaff();
	int getListTotalAvailable();
	boolean makeBackupJsonFile();
	int selectTotalMarketStaffByDate(String date);
	
	// Change Status
	boolean chgStatToOk(T2 s) throws ParseException;
	boolean chgStatToNotUsing(T2 s) throws ParseException;
	boolean chgStatToBroken(T2 s) throws ParseException;
	boolean chgStatToDiscard(T2 s) throws ParseException;
	
	// Report
	int selectTotalMarketStaffByType(String type);
	int selectTotalMarketStudentByType(String type);
	int selectTotalKentL1StaffByType(String type);
	int selectTotalKentL1StudentByType(String type);
	int selectTotalKentL5StaffByType(String type);
	int selectTotalKentL5StudentByType(String type);
	int getListTotalByType(String type);
	
	int selectTotalMarketStaffSnap(String date);
	int selectTotalMarketStudentSnap(String date);
	int selectTotalKentL1StaffSnap(String date);
	int selectTotalKentL1StudentSnap(String date);
	int selectTotalKentL5StaffSnap(String date);
	int getListTotalSnap(String date);
	int selectTotalKentL5StudentSnap(String date);
	int getListTotalByStudentSnap(String date);
	int getListTotalByStaffSnap(String date);
	
	// System Report
	int selectDuplicatedId();
}
