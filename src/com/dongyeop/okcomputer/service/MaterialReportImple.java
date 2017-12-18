package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public class MaterialReportImple implements MaterialReport {
	@Autowired private DaoMaterialInterface daoMaterialComputer;
	@Autowired private DaoMaterialInterface daoMaterialTv;
	@Autowired private DaoMaterialInterface daoMaterialGarage;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;
	@Autowired private DaoMaterialInterface daoMaterialPrinter;

	
	@Autowired private DaoComputerInterface daoComputer;

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
	public HashMap<String, Integer> selectTotalTvReport() {
		HashMap<String, Integer> tvReportMap = new HashMap<String, Integer>();
		generateStandardReportMap(tvReportMap, daoMaterialTv);
		return tvReportMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalPrinterReport() {
		HashMap<String, Integer> printerMap = new HashMap<String, Integer>();
		generateStandardReportMap(printerMap, daoMaterialPrinter);
		return printerMap;
	}

	@Override
	public boolean makeBackupJsonFile() {
		daoMaterialComputer.makeBackupJsonFile();
		daoMaterialTv.makeBackupJsonFile();
		daoMaterialGarage.makeBackupJsonFile();
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
