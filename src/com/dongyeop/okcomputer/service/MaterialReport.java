package com.dongyeop.okcomputer.service;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public interface MaterialReport {
	HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> generateStandardReportMapByType(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao, String type);
	HashMap<String, Integer> generateSnapshotReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> selectTotalDesktopReport();
	HashMap<String, Integer> selectTotalDesktopReportSnap(String date);
	HashMap<String, Integer> selectTotalLatptopReport();
	HashMap<String, Integer> selectTotalMonitorReport();
	HashMap<String, Integer> selectTotalMacReport();
	HashMap<String, Integer> selectTotalPrinterReport();
	HashMap<String, Integer> selectTotalTelephoneReport();
	HashMap<String, Integer> selectTotalItEtcReport();
	HashMap<String, Integer> selectTotalEtcReport();
	HashMap<String, Integer> selectTotalTvReport();
	HashMap<String, Integer> selectEtcReportByType(String type);
	int selectComputerTotalMarketStaff();
	int selectComputerTotalKentL1Staff();
	int selectComputerTotalKentL5Staff();
	int selectComputerTotalMarketStudent();
	int selectComputerTotalKentL1Student();
	int selectComputerTotalKentL5Student();
	
	HashMap<String, Integer> calcurateAllStudentCompuersSummary(); 
	boolean makeBackupJsonFile();
	HashMap<String, Integer> generateComputerTotalMap();
	HashMap<String, Object> getAllsnapshots() throws ParseException, IOException;
}
