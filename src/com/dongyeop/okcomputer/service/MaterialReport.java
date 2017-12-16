package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public interface MaterialReport {
	HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> selectTotalDesktopReport();
	HashMap<String, Integer> selectTotalLatptopReport();
	HashMap<String, Integer> selectTotalMonitorReport();
	HashMap<String, Integer> selectTotalMacReport();
	HashMap<String, Integer> selectTotalPrinterReport();
	HashMap<String, Integer> selectTotalTelephoneReport();
	HashMap<String, Integer> selectTotalItEtcReport();
	HashMap<String, Integer> selectTotalEtcReport();
}
