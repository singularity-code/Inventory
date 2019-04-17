package com.inventory.dao;

import com.inventory.dto.KoiMaterial;
import com.inventory.profile.ApplicationType;

import org.json.simple.parser.ParseException;

public class DaoMaterialTelephoneImple<T1 extends KoiMaterial, T2>  extends DaoMaterialGeneralImple<T1, T2> {
	public DaoMaterialTelephoneImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "telephones.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
