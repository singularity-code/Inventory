package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao.DaoMaterialTvImple;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;

public class MaterialReportImple implements MaterialReport {
	@Autowired private DaoMaterialInterface daoMaterialComputer;
	@Autowired private DaoMaterialInterface daoMaterialTv;
	@Autowired private DaoMaterialInterface daoMaterialGarage;
	@Autowired private DaoMaterialInterface daoMaterialFridge;
	@Autowired private DaoMaterialInterface daoMaterialSwitch;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;
	@Autowired private DaoMaterialInterface daoMaterialBarcodeReader;
	@Autowired private DaoMaterialInterface daoMaterialProjector;
	
	@Autowired private DaoComputerInterface daoComputer;
	
	public HashMap<String, Integer> selectTotalTvReport() {
		HashMap<String, Integer> tvReportMap = new HashMap<String, Integer>();
		tvReportMap.put("marketStaff", daoMaterialTv.selectTotalMarketStaff());
		tvReportMap.put("marketStudent", daoMaterialTv.selectTotalMarketStudent());
		tvReportMap.put("kentL1Staff", daoMaterialTv.selectTotalKentL1Staff());
		tvReportMap.put("kentL1Student", daoMaterialTv.selectTotalKentL1Student());
		tvReportMap.put("kentL5Staff",  daoMaterialTv.selectTotalKentL5Staff());
		tvReportMap.put("kentL5Student", daoMaterialTv.selectTotalKentL5Student());
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
		return projectorMap;
	}

}
