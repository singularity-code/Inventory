package com.dongyeop.okcomputer.service;

import java.util.HashMap;

public interface MaterialReport {
	HashMap<String, Integer> selectTotalTvReport();
	HashMap<String, Integer> selectTotalBarcodeReaderReport();
	HashMap<String, Integer> selectTotalProjectorReport();
	HashMap<String, Integer> selectTotalMicrowaveReport();
}
