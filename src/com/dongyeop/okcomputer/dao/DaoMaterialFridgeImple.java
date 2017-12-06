package com.dongyeop.okcomputer.dao;

import com.dongyeop.profile.ApplicationType;
import org.json.simple.parser.ParseException;

public class DaoMaterialFridgeImple extends DaoMaterialGeneralImple{

	public DaoMaterialFridgeImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "fridges.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
