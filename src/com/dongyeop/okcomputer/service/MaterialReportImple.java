package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public class MaterialReportImple implements MaterialReport {
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialDesktop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialLaptop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialMac;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialMonitor;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialEtc;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialEtcIt;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialPrinter;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialTelephone;
	
	@Autowired private DaoComputerInterface daoComputer;
	
	HashMap<String, Integer> resultMap = new HashMap<String, Integer>();

	@Override
	public HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao) {
		map.put("marketStaff", dao.selectTotalMarketStaff());
		map.put("marketStudent", dao.selectTotalMarketStudent());
		map.put("kentL1Staff", dao.selectTotalKentL1Staff());
		map.put("kentL1Student", dao.selectTotalKentL1Student());
		map.put("kentL5Staff",  dao.selectTotalKentL5Staff());
		map.put("kentL5Student", dao.selectTotalKentL5Student());
		map.put("total", dao.getListTotal());
		return map;
	}
	
	@Override
	public HashMap<String, Integer> selectTotalDesktopReport() {
		generateStandardReportMap(resultMap, daoMaterialDesktop);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalLatptopReport() {
		generateStandardReportMap(resultMap, daoMaterialLaptop);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMonitorReport() {
		generateStandardReportMap(resultMap, daoMaterialMonitor);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMacReport() {
		generateStandardReportMap(resultMap, daoMaterialMac);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalTelephoneReport() {
		generateStandardReportMap(resultMap, daoMaterialTelephone);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalItEtcReport() {
		generateStandardReportMap(resultMap, daoMaterialEtcIt);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalEtcReport() {
		generateStandardReportMap(resultMap, daoMaterialEtc);
		return resultMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalPrinterReport() {
		generateStandardReportMap(resultMap, daoMaterialPrinter);
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


}
