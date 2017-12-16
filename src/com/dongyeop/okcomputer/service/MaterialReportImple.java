package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public class MaterialReportImple implements MaterialReport {
	@Autowired private DaoMaterialInterface daoMaterialDesktop;
	@Autowired private DaoMaterialInterface daoMaterialLaptop;
	@Autowired private DaoMaterialInterface daoMaterialMac;
	@Autowired private DaoMaterialInterface daoMaterialMonitor;
	@Autowired private DaoMaterialInterface daoMaterialEtc;
	@Autowired private DaoMaterialInterface daoMaterialEtcIt;
	@Autowired private DaoMaterialInterface daoMaterialPrinter;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;

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
}
