package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;

import com.dongyeop.profile.ApplicationType;

public class DaoMaterialLaminatorImple extends DaoMaterialGeneralImple {

	public DaoMaterialLaminatorImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "tvs.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
