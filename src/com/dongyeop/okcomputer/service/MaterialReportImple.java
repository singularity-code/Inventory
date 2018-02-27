package com.dongyeop.okcomputer.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.okcomputer.engine.WrightEngine;

public class MaterialReportImple implements MaterialReport {
	private WrightEngine writeEngine = new WrightEngine();

	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialDesktop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialLaptop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialMac;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialMonitor;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialEtc;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialEtcIt;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialPrinter;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialTelephone;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialTv;

	HashMap<String, Integer> snapshotMap = new HashMap<String, Integer>();

	@Override
	public HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao) {
		map.put("marketStaff", dao.selectTotalMarketStaff());
		map.put("marketStudent", dao.selectTotalMarketStudent());
		map.put("kentL1Staff", dao.selectTotalKentL1Staff());
		map.put("kentL1Student", dao.selectTotalKentL1Student());
		map.put("kentL5Staff", dao.selectTotalKentL5Staff());
		map.put("kentL5Student", dao.selectTotalKentL5Student());
		map.put("total", dao.getListTotal());
		map.put("totalByStudent", dao.getListTotalByStudent());
		map.put("totalByStaff", dao.getListTotalByStaff());
		return map;
	}

	public HashMap<String, Integer> generateSnapshotReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao, String date) {
		map.put("marketStaff", dao.selectTotalMarketStaffSnap(date));
		map.put("marketStudent", dao.selectTotalMarketStudentSnap(date));
		map.put("kentL1Staff", dao.selectTotalKentL1StaffSnap(date));
		map.put("kentL1Student", dao.selectTotalKentL1StudentSnap(date));
		map.put("kentL5Staff", dao.selectTotalKentL5StaffSnap(date));
		map.put("kentL5Student", dao.selectTotalKentL5StudentSnap(date));
		map.put("totalByStudent", dao.getListTotalByStudentSnap(date));
		map.put("totalByStaff", dao.getListTotalByStaffSnap(date));
		return map;
	}

	@Override
	public HashMap<String, Integer> generateStandardReportMapEtcByType(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao, String type) {
		map.put("marketStaff", daoMaterialEtc.selectTotalMarketStaffByType(type));
		map.put("marketStudent", daoMaterialEtc.selectTotalMarketStudentByType(type));
		map.put("kentL1Staff", daoMaterialEtc.selectTotalKentL1StaffByType(type));
		map.put("kentL1Student", daoMaterialEtc.selectTotalKentL1StudentByType(type));
		map.put("kentL5Staff", daoMaterialEtc.selectTotalKentL5StaffByType(type));
		map.put("kentL5Student", daoMaterialEtc.selectTotalKentL5StudentByType(type));
		map.put("total", daoMaterialEtc.getListTotalByType(type));
		return map;
	}

	@Override
	public HashMap<String, Integer> generateStandardReportMapEtcItByType(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao, String type) {
		map.put("marketStaff", daoMaterialEtcIt.selectTotalMarketStaffByType(type));
		map.put("marketStudent", daoMaterialEtcIt.selectTotalMarketStudentByType(type));
		map.put("kentL1Staff", daoMaterialEtcIt.selectTotalKentL1StaffByType(type));
		map.put("kentL1Student", daoMaterialEtcIt.selectTotalKentL1StudentByType(type));
		map.put("kentL5Staff", daoMaterialEtcIt.selectTotalKentL5StaffByType(type));
		map.put("kentL5Student", daoMaterialEtcIt.selectTotalKentL5StudentByType(type));
		map.put("total", daoMaterialEtcIt.getListTotalByType(type));
		return map;
	}

	@Override
	public HashMap<String, Integer> selectTotalDesktopReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialDesktop);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalDesktopReportSnap(String date) {
		generateSnapshotReportMap(snapshotMap, daoMaterialDesktop, date);
		return snapshotMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalLatptopReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialLaptop);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMonitorReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialMonitor);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMacReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialMac);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalTelephoneReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialTelephone);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalItEtcReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialEtcIt);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalEtcReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialEtc);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalPrinterReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialPrinter);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalTvReport() {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMap(resultMap, daoMaterialTv);
		return resultMap;
	}

	@Override
	public boolean makeBackupJsonFile() {
		daoMaterialDesktop.makeBackupJsonFile();
		daoMaterialLaptop.makeBackupJsonFile();
		daoMaterialMonitor.makeBackupJsonFile();
		daoMaterialMac.makeBackupJsonFile();
		daoMaterialEtc.makeBackupJsonFile();
		daoMaterialEtcIt.makeBackupJsonFile();
		daoMaterialTelephone.makeBackupJsonFile();
		daoMaterialPrinter.makeBackupJsonFile();
		return false;
	}

	@Override
	public HashMap<String, Integer> generateSnapshotReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao) {
		map.put("marketStaffSnapshot", dao.selectTotalMarketStaffByDate("18122017"));
		return map;
	}

	@Override
	public int selectComputerTotalMarketStaff() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalMarketStaff();
		total += daoMaterialLaptop.selectTotalMarketStaff();
		total += daoMaterialMac.selectTotalMarketStaff();
		return total;
	}

	@Override
	public int selectComputerTotalKentL1Staff() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalKentL1Staff();
		total += daoMaterialLaptop.selectTotalKentL1Staff();
		total += daoMaterialMac.selectTotalKentL1Staff();
		return total;
	}

	@Override
	public int selectComputerTotalKentL5Staff() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalKentL5Staff();
		total += daoMaterialLaptop.selectTotalKentL5Staff();
		total += daoMaterialMac.selectTotalKentL5Staff();
		return total;
	}

	@Override
	public int selectComputerTotalMarketStudent() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalMarketStudent();
		total += daoMaterialLaptop.selectTotalMarketStudent();
		total += daoMaterialMac.selectTotalMarketStudent();
		return total;
	}

	@Override
	public int selectComputerTotalKentL1Student() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalKentL1Student();
		total += daoMaterialLaptop.selectTotalKentL1Student();
		total += daoMaterialMac.selectTotalKentL1Student();
		return total;
	}

	@Override
	public int selectComputerTotalKentL5Student() {
		int total = 0;
		total += daoMaterialDesktop.selectTotalKentL5Student();
		total += daoMaterialLaptop.selectTotalKentL5Student();
		total += daoMaterialMac.selectTotalKentL5Student();
		return total;
	}

	@Override
	public int getListTotalAvailableComputers() {
		int total = 0;
		total += daoMaterialDesktop.getListTotalAvailable();
		total += daoMaterialLaptop.getListTotalAvailable();
		return total;
	}

	@Override
	public HashMap<String, Object> calcurateAllStudentCompuersSummary() {
		HashMap<String, Object> studentSummaryMap = new HashMap<String, Object>();
		float total = 0;
		float result = 0;
		float noOfStd = 1703;

		total += daoMaterialDesktop.getListTotalByStudent();
		total += daoMaterialLaptop.getListTotalByStudent();
		total += daoMaterialMac.getListTotalByStudent();

		result = noOfStd / total;
		String ratio = String.format("%.2f", result);
		studentSummaryMap.put("total", total);
		studentSummaryMap.put("ratio", ratio);
		studentSummaryMap.put("noOfStd", noOfStd);
		return studentSummaryMap;
	}

	@Override
	public HashMap<String, Integer> generateComputerTotalMap() {
		HashMap<String, Integer> computerTotalMap = new HashMap<String, Integer>();
		computerTotalMap.put("marketStaff", selectComputerTotalMarketStaff());
		computerTotalMap.put("kentL1Staff", selectComputerTotalKentL1Staff());
		computerTotalMap.put("kentL5Staff", selectComputerTotalKentL5Staff());
		computerTotalMap.put("marketStudent", selectComputerTotalMarketStudent());
		computerTotalMap.put("kentL1Student", selectComputerTotalKentL1Student());
		computerTotalMap.put("kentL5Student", selectComputerTotalKentL5Student());
		return computerTotalMap;
	}

	@Override
	public HashMap<String, Integer> selectEtcReportByType(String type) {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMapEtcByType(resultMap, daoMaterialEtc, type);
		return resultMap;
	}

	public HashMap<String, Integer> selectEtcItReportByType(String type) {
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		generateStandardReportMapEtcItByType(resultMap, daoMaterialEtcIt, type);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getAllsnapshots() throws ParseException, IOException {
		return writeEngine.readSnapshots();
	}

	public static void printMap(Map<?, ?> map) {
		/*
		 * Iterator it = map.entrySet().iterator(); while (it.hasNext()) { Map.Entry pair = (Map.Entry)it.next(); System.out.println(pair.getKey() + " = " + pair.getValue()); it.remove(); // avoids a ConcurrentModificationException }
		 */

		for (Entry<?, ?> e : map.entrySet()) {
			System.out.println(e.getKey() + " = " + e.getValue());
		}

	}

	@Override
	public int selectDuplicatedId() {
		int total = 0;
		total += daoMaterialDesktop.selectDuplicatedId();
		total += daoMaterialEtc.selectDuplicatedId();
		total += daoMaterialEtcIt.selectDuplicatedId();
		total += daoMaterialLaptop.selectDuplicatedId();
		total += daoMaterialMonitor.selectDuplicatedId();
		total += daoMaterialPrinter.selectDuplicatedId();
		total += daoMaterialTelephone.selectDuplicatedId();
		total += daoMaterialTv.selectDuplicatedId();
		return total;
	}
}
