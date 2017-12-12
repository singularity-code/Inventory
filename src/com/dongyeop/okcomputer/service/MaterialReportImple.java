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
	@Autowired private DaoMaterialInterface daoMaterialFridge;
	@Autowired private DaoMaterialInterface daoMaterialSwitch;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;
	@Autowired private DaoMaterialInterface daoMaterialBarcodeReader;
	@Autowired private DaoMaterialInterface daoMaterialProjector;
	@Autowired private DaoMaterialInterface daoMaterialMicrowave;
	
	@Autowired private DaoComputerInterface daoComputer;
	
	public HashMap<String, Integer> selectTotalTvReport() {
		HashMap<String, Integer> tvReportMap = new HashMap<String, Integer>();
		tvReportMap.put("marketStaff", daoMaterialTv.selectTotalMarketStaff());
		tvReportMap.put("marketStudent", daoMaterialTv.selectTotalMarketStudent());
		tvReportMap.put("kentL1Staff", daoMaterialTv.selectTotalKentL1Staff());
		tvReportMap.put("kentL1Student", daoMaterialTv.selectTotalKentL1Student());
		tvReportMap.put("kentL5Staff",  daoMaterialTv.selectTotalKentL5Staff());
		tvReportMap.put("kentL5Student", daoMaterialTv.selectTotalKentL5Student());
		tvReportMap.put("total", daoMaterialTv.getListTotal());
		return tvReportMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalBarcodeReaderReport() {
		HashMap<String, Integer> barcodeReaderMap = new HashMap<String, Integer>();
		barcodeReaderMap.put("marketStaff", daoMaterialBarcodeReader.selectTotalMarketStaff());
		barcodeReaderMap.put("marketStudent", daoMaterialBarcodeReader.selectTotalMarketStudent());
		barcodeReaderMap.put("kentL1Staff", daoMaterialBarcodeReader.selectTotalKentL1Staff());
		barcodeReaderMap.put("kentL1Student", daoMaterialBarcodeReader.selectTotalKentL1Student());
		barcodeReaderMap.put("kentL5Staff",  daoMaterialBarcodeReader.selectTotalKentL5Staff());
		barcodeReaderMap.put("kentL5Student", daoMaterialBarcodeReader.selectTotalKentL5Student());
		barcodeReaderMap.put("total", daoMaterialBarcodeReader.getListTotal());
		return barcodeReaderMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalProjectorReport() {
		HashMap<String, Integer> projectorMap = new HashMap<String, Integer>();
		projectorMap.put("marketStaff", daoMaterialProjector.selectTotalMarketStaff());
		projectorMap.put("marketStudent", daoMaterialProjector.selectTotalMarketStudent());
		projectorMap.put("kentL1Staff", daoMaterialProjector.selectTotalKentL1Staff());
		projectorMap.put("kentL1Student", daoMaterialProjector.selectTotalKentL1Student());
		projectorMap.put("kentL5Staff",  daoMaterialProjector.selectTotalKentL5Staff());
		projectorMap.put("kentL5Student", daoMaterialProjector.selectTotalKentL5Student());
		projectorMap.put("total", daoMaterialProjector.getListTotal());
		return projectorMap;
	}

	@Override
	public HashMap<String, Integer> selectTotalMicrowaveReport() {
		HashMap<String, Integer> microwaveMap = new HashMap<String, Integer>();
		microwaveMap.put("marketStaff", daoMaterialMicrowave.selectTotalMarketStaff());
		microwaveMap.put("marketStudent", daoMaterialMicrowave.selectTotalMarketStudent());
		microwaveMap.put("kentL1Staff", daoMaterialMicrowave.selectTotalKentL1Staff());
		microwaveMap.put("kentL1Student", daoMaterialMicrowave.selectTotalKentL1Student());
		microwaveMap.put("kentL5Staff",  daoMaterialMicrowave.selectTotalKentL5Staff());
		microwaveMap.put("kentL5Student", daoMaterialMicrowave.selectTotalKentL5Student());
		microwaveMap.put("total", daoMaterialMicrowave.getListTotal());
		return microwaveMap;
	}
	
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
}
