package com.inventory.dao;

import org.json.simple.parser.ParseException;

import com.inventory.dto.KoiMaterial;
import com.inventory.profile.ApplicationType;

public class DaoMaterialTvImple<T1 extends KoiMaterial, T2> extends DaoMaterialGeneralImple<T1, T2> {

	public DaoMaterialTvImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "printers.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
