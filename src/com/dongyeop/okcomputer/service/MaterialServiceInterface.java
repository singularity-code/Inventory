package com.dongyeop.okcomputer.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;

public interface MaterialServiceInterface<T1, T2> {
	 Object getZabbixList();

	T1 getDesktopList() throws ParseException;
	T1 getLaptopList() throws ParseException;
	T1 getMonitorList() throws ParseException;
	T1 getMacList() throws ParseException;
	T1 getPrinterList() throws ParseException;
	T1 getEtcList() throws ParseException;
	T1 getEtcItList() throws ParseException;
	T1 getTelephoneList() throws ParseException;
	T1 getAllList() throws ParseException;
	
	//Old
	T1 getComputerList() throws ParseException;
	
	//CREATE
	boolean createDesktop(T1 o);
	boolean createLaptop(T1 o);
	boolean createMonitor(T1 o);
	boolean createMac(T1 o);
	boolean createPrinter(T1 o);
	boolean createTelephone(T1 o);
	boolean createRouter(T1 o);
	boolean createSwitch(T1 o);
	boolean createTablet(T1 o);
	boolean createSpeaker(T1 o);
	boolean createServer(T1 o);
	
	//Old
	boolean createComputer(T1 o);
	boolean createTv(T1 o);

	//DELETE
	boolean deleteDesktop(T2 s) throws ParseException;
	boolean deleteLaptop(T2 s) throws ParseException;
	boolean deleteMonitor(T2 s) throws ParseException;
	boolean deleteMac(T2 s) throws ParseException;
	boolean deletePrinter(T2 s) throws ParseException;
	boolean deleteTelephone(T2 s) throws ParseException;
	
	boolean chgStatToOkDesktop(T2 s) throws ParseException;
	boolean chgStatToOkLaptop(T2 s) throws ParseException;
	boolean chgStatToOkMonitor(T2 s) throws ParseException;
	boolean chgStatToOkTelephone(T2 s) throws ParseException;
	boolean chgStatToOkPrinter(T2 s) throws ParseException;
	
	boolean chgStatToNotUsingDesktop(T2 s) throws ParseException;
	boolean chgStatToNotUsingLaptop(T2 s) throws ParseException;
	boolean chgStatToNotUsingMonitor(T2 s) throws ParseException;
	boolean chgStatToNotUsingTelephone(T2 s) throws ParseException;
	boolean chgStatToNotUsingPrinter(T2 s) throws ParseException;
	
	//Change to broken
	boolean chgStatToBrokenDesktop(T2 s) throws ParseException;
	boolean chgStatToBrokenLaptop(T2 s) throws ParseException;
	boolean chgStatToBrokenMonitor(T2 s) throws ParseException;
	boolean chgStatToBrokenTelephone(T2 s) throws ParseException;
	boolean chgStatToBrokenPrinter(T2 s) throws ParseException;

	//Change to discard
	boolean chgStatToDiscardDesktop(T2 s) throws ParseException;
	boolean chgStatToDiscardLaptop(T2 s) throws ParseException;
	boolean chgStatToDiscardMonitor(T2 s) throws ParseException;
	boolean chgStatToDiscardTelephone(T2 s) throws ParseException;
	boolean chgStatToDiscardPrinter(T2 s) throws ParseException;
	
	//Old
	boolean deleteComputer(T2 s) throws ParseException;
	boolean deleteTv(T2 s) throws ParseException;
	
	//GET
	T1 getMaterial(T2 s) throws ParseException;
	T1 getDesktop(T2 s) throws ParseException;
	T1 getLaptop(T2 s) throws ParseException;
	T1 getMonitor(T2 s) throws ParseException;
	T1 getMac(T2 s) throws ParseException;
	T1 getPrinter(T2 s) throws ParseException;
	T1 getTelephone(T2 s) throws ParseException;
	
	T1 getEtcItItem(T2 s) throws ParseException;
	T1 getEtcItem(T2 s) throws ParseException;
	
	//Old
	T1 getComputer(T2 s) throws ParseException;
	T1 getTv(T2 s) throws ParseException;
	
	//UPDATE
	boolean updateDesktop(T1 o) throws ParseException;
	boolean updateLaptop(T1 o) throws ParseException;
	boolean updateMonitor(T1 o) throws ParseException;
	boolean updateMac(T1 o) throws ParseException;
	boolean updatePrinter(T1 o) throws ParseException;
	boolean updateTelephone(T1 o) throws ParseException;
	
	boolean updateEtcItItem(T1 o) throws ParseException;
	boolean updateEtcItem(T1 o) throws ParseException;
	//Old
	boolean updateComputer(T1 o) throws ParseException;
	boolean updateTv(T1 o) throws ParseException;
	
	//Swap
	boolean swap(T1 prev, T1 next) throws ParseException;
	
	boolean readAllJsonFiles(String path) throws ParseException, IOException;

}
