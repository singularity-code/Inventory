package com.dongyeop.okcomputer.dao;

import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.profile.ApplicationType;
import org.json.simple.parser.ParseException;

public class DaoMaterialTvImple extends DaoMaterialGeneralImple {

	public DaoMaterialTvImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "tvs.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public int selectTotalMarketStaff() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("market") && index.equals("C")) {
				total += 1;
			}
		}
		return total;
	}
	
	@Override
	public int selectTotalMarketStudent() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("market") && index.equals("S")) {
				total += 1;
			}
		}
		return total;
	}
	
	@Override
	public int selectTotalKentL1Staff() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("kent l1") && index.equals("C")) {
				total += 1;
			}
		}
		return total;
	}
	
	@Override
	public int selectTotalKentL1Student() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("kent l1") && index.equals("S"))  {
				total += 1;
			}
		}
		return total;
	}
	
	@Override
	public int selectTotalKentL5Staff() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("kent l5") && index.equals("C"))  {
				total += 1;
			}
		}
		return total;
	}
	
	@Override
	public int selectTotalKentL5Student() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("kent l5") && index.equals("S"))  {
				total += 1;
			}
		}
		return total;
	}
}
