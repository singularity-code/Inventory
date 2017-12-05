package com.dongyeop.okcomputer.dao;

import com.dongyeop.profile.ApplicationType;
import org.json.simple.parser.ParseException;

public class DaoMaterialTvImple extends DaoMaterialGeneralImple {

	public DaoMaterialTvImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "mother_tv.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
