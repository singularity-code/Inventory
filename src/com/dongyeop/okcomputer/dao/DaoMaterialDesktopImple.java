package com.dongyeop.okcomputer.dao;

import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.profile.ApplicationType;

public class DaoMaterialDesktopImple<T1 extends KoiMaterial, T2> extends DaoMaterialGeneralImple<T1, T2>{

	public DaoMaterialDesktopImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "desktops.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
