package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public interface MaterialReport {
	HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> selectTotalTvReport();
	HashMap<String, Integer> selectTotalBarcodeReaderReport();
	HashMap<String, Integer> selectTotalProjectorReport();
	HashMap<String, Integer> selectTotalMicrowaveReport();
	HashMap<String, Integer> selectTotalAirConditionerReport();
	HashMap<String, Integer> selectTotalCashMachineReport();
	HashMap<String, Integer> selectTotalDSLRReport();
	HashMap<String, Integer> selectTotalEFTPOSMachineReport();
	HashMap<String, Integer> selectTotalFaxReport();
	HashMap<String, Integer> selectTotalLaminatorReport();
	HashMap<String, Integer> selectTotalPrinterReport();
	HashMap<String, Integer> selectTotalRouterReport();
	HashMap<String, Integer> selectTotalShredderReport();
	HashMap<String, Integer> selectTotalSpeakerReport();
}
