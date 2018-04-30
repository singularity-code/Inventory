package com.dongyeop.profile;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ApplicationType {
//	public static final ApplicationProfile applicationProfile = ApplicationProfile.LOCAL;
	public static final ApplicationProfile applicationProfile = ApplicationProfile.TEST_SERVER;
	
	public static String getJsonFilePath() {
		if(applicationProfile == ApplicationProfile.LOCAL)
			 return "/Users/chris/Desktop/testdata/materials/"; 
		else return "/home/pi/Desktop/testdata/";
	}
	
	public static String getJsonBackupPath() {
		DateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
		Date today = new Date();
		
		if(applicationProfile == ApplicationProfile.LOCAL) {
			File backupDirectory = new File("/Users/chris/Desktop/Inventory/" + dateFormat.format(today) + "/");
			String backupDirectoryLocalName = backupDirectory.toString();
			if(!backupDirectory.exists()) {
				backupDirectory.mkdir();
			}
			return backupDirectoryLocalName;
		} else {
			File backupDirectoryPi = new File("/home/pi/Desktop/testdata/snapshot/" + dateFormat.format(today) + "/");
			String backupDirectoryPiName = backupDirectoryPi.toString();
			if(!backupDirectoryPi.exists()) {
				backupDirectoryPi.mkdir();
			}
			return backupDirectoryPiName;
		}
	}
	
	public static String getJsonBackupPathWithoutDate() {
		if(applicationProfile == ApplicationProfile.LOCAL)
			 return "/Users/chris/Desktop/Inventory/"; 
		else return "/home/pi/Desktop/testdata/snapshot/";
	}
}
