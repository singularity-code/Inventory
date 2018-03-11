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
		
		File backupDirectory = new File("/Users/chris/Desktop/testdata/materials/" + dateFormat.format(today));
		if(!backupDirectory.exists()) {
			backupDirectory.mkdir();
		}
		if(applicationProfile == ApplicationProfile.LOCAL) {
			return backupDirectory + "\\";
		}
		return "home/pi/Desktop/testdata/";
	}
	
	public static String getJsonBackupPathWithoutDate() {
		if(applicationProfile == ApplicationProfile.LOCAL)
			 return "/Users/chris/Desktop/testdata/materials/snapshot/"; 
		else return "/home/pi/Desktop/testdata/snapshot/";
	}
}
