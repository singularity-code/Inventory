package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;
import com.dongyeop.profile.ApplicationType;

public class DaoMaterialEtcItImple extends DaoMaterialGeneralImple {

	public DaoMaterialEtcItImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "it_etc.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
