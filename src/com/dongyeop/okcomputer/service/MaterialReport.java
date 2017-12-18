package com.dongyeop.okcomputer.service;

import java.util.HashMap;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.KoiMaterial;

public interface MaterialReport {
	HashMap<String, Integer> generateStandardReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> generateSnapshotReportMap(HashMap<String, Integer> map, DaoMaterialInterface<KoiMaterial, String> dao);
	HashMap<String, Integer> selectTotalTvReport();
	HashMap<String, Integer> selectTotalPrinterReport();
	boolean makeBackupJsonFile();
}
