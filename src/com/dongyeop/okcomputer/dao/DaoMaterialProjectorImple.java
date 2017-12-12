package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;

import com.dongyeop.profile.ApplicationType;

public class DaoMaterialProjectorImple extends DaoMaterialGeneralImple {

	public DaoMaterialProjectorImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "projector.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
