package com.dongyeop.profile;

public class ApplicationType {
	public static final ApplicationProfile applicationProfile = ApplicationProfile.LOCAL;
//	public static final ApplicationProfile applicationProfile = ApplicationProfile.TEST_SERVER;
	
	public static String getJsonFilePath() {
		if(applicationProfile == ApplicationProfile.LOCAL)
			return "C:\\testdata\\";
		else return "/XXX";
	}
}
