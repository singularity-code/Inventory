package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialAirConditionerImple;
import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public class MaterialReportImple implements MaterialReport {
	@Autowired private DaoMaterialInterface daoMaterialComputer;
	@Autowired private DaoMaterialInterface daoMaterialTv;
	@Autowired private DaoMaterialInterface daoMaterialGarage;
	@Autowired private DaoMaterialInterface daoMaterialFridge;
	@Autowired private DaoMaterialInterface daoMaterialSwitch;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;
	@Autowired private DaoMaterialInterface daoMaterialBarcodeReader;
	@Autowired private DaoMaterialInterface daoMaterialProjector;
	@Autowired private DaoMaterialInterface daoMaterialMicrowave;
	@Autowired private DaoMaterialInterface daoMaterialAirCondition;
	@Autowired private DaoMaterialInterface daoMaterialCashMachine;
	@Autowired private DaoMaterialInterface daoMaterialDSLR;
	@Autowired private DaoMaterialInterface daoMaterialEFTPOSMachine;
	@Autowired private DaoMaterialInterface daoMaterialFax;
	@Autowired private DaoMaterialInterface daoMaterialLaminator;
	@Autowired private DaoMaterialInterface daoMaterialPrinter;
	@Autowired private DaoMaterialInterface daoMaterialRouter;
	@Autowired private DaoMaterialInterface daoMaterialShredder;
	@Autowired private DaoMaterialInterface daoMaterialSpeaker;
	
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
	public HashMap<String, Integer> selectTotalBarcodeReaderReport() {
		HashMap<String, Integer> barcodeReaderMap = new HashMap<String, Integer>();
		generateStandardReportMap(barcodeReaderMap, daoMaterialBarcodeReader);
		return barcodeReaderMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalProjectorReport() {
		HashMap<String, Integer> projectorMap = new HashMap<String, Integer>();
		generateStandardReportMap(projectorMap, daoMaterialProjector);
		return projectorMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMicrowaveReport() {
		HashMap<String, Integer> microwaveMap = new HashMap<String, Integer>();
		generateStandardReportMap(microwaveMap, daoMaterialMicrowave);
		return microwaveMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalAirConditionerReport() {
		HashMap<String, Integer> airconditionMap = new HashMap<String, Integer>();
		generateStandardReportMap(airconditionMap, daoMaterialAirCondition);
		return airconditionMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalCashMachineReport() {
		HashMap<String, Integer> cashMachineMap = new HashMap<String, Integer>();
		generateStandardReportMap(cashMachineMap, daoMaterialCashMachine);
		return cashMachineMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalDSLRReport() {
		HashMap<String, Integer> dslrMap = new HashMap<String, Integer>();
		generateStandardReportMap(dslrMap, daoMaterialDSLR);
		return dslrMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalEFTPOSMachineReport() {
		HashMap<String, Integer> eftposMap = new HashMap<String, Integer>();
		generateStandardReportMap(eftposMap, daoMaterialEFTPOSMachine);
		return eftposMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalFaxReport() {
		HashMap<String, Integer> faxMap = new HashMap<String, Integer>();
		generateStandardReportMap(faxMap, daoMaterialFax);
		return faxMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalLaminatorReport() {
		HashMap<String, Integer> laminatorMap = new HashMap<String, Integer>();
		generateStandardReportMap(laminatorMap, daoMaterialLaminator);
		return laminatorMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalPrinterReport() {
		HashMap<String, Integer> printerMap = new HashMap<String, Integer>();
		generateStandardReportMap(printerMap, daoMaterialPrinter);
		return printerMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalRouterReport() {
		HashMap<String, Integer> routerMap = new HashMap<String, Integer>();
		generateStandardReportMap(routerMap, daoMaterialRouter);
		return routerMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalShredderReport() {
		HashMap<String, Integer> shredderMap = new HashMap<String, Integer>();
		generateStandardReportMap(shredderMap, daoMaterialShredder);
		return shredderMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalSpeakerReport() {
		HashMap<String, Integer> speakerMap = new HashMap<String, Integer>();
		generateStandardReportMap(speakerMap, daoMaterialSpeaker);
		return speakerMap;
	}
}
