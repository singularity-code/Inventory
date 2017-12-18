package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;
import com.dongyeop.profile.ApplicationType;

public class DaoMaterialEtcItImple<T1, T2> extends DaoMaterialGeneralImple<T1, T2> {

	public DaoMaterialEtcItImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "etc_it.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
