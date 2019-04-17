package com.inventory.dao;

import org.json.simple.parser.ParseException;

import com.inventory.dto.Computer;
import com.inventory.dto.KoiMaterial;
import com.inventory.profile.ApplicationType;

public class DaoMaterialComputerImple<T1 extends KoiMaterial, T2> extends DaoMaterialGeneralImple<T1, T2>{

	public DaoMaterialComputerImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "printers.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

/*	public boolean swap(KoiMaterial prev, KoiMaterial next) throws ParseException {
		KoiMaterial c1 = null;
		KoiMaterial c2 = null;

		for (KoiMaterial c : objectList) {
			if (prev.getId().equals(c.getId())) {
				System.out.println("FOUND : " + c.getId());
				c1 = c;
				break;
			}
		}

		for (KoiMaterial c : objectList) {
			if (next.getId().equals(c.getId())) {
				System.out.println("FOUND : " + c.getId());
				c2 = c;
				break;
			}
		}

		if (c1 == null || c2 == null) {
			System.out.println("Null");
			return false;
		}

		String l = c1.getLocation();
		String campus = c1.getCampus();
		String pcName = c1.getName();
		String user = c1.getUser();
		//String role = c1.getRole();

		c1.setPrevious(l + " " + c1.getName());
		c1.setLocation(c2.getLocation());
		c1.setCampus(c2.getCampus());
		c1.setName(c2.getName());
		c1.setUser(c2.getUser());
		//c1.setRole(c2.getRole());
		c1.setUpdatedate(c1.generateDate());

		c2.setPrevious(c2.getLocation() + "- " + c2.getName());
		c2.setLocation(l);
		c2.setCampus(campus);
		c2.setName(pcName);
		c2.setUser(user);
		//c2.setRole(role);
		c2.setUpdatedate(c2.generateDate());
		System.out.println("SWAP SUCCESS");
		return writeJson();
	}*/
	public boolean move(Computer computer) throws ParseException {
		objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		boolean b = false;
		for (int i = 0; i < objectList.size(); i++) {
			if (computer.equals(objectList.get(i))) {
				computer.setStatus("Inactive");
				break;
			}
		}
		return b ? writeJson() : false;
	}

	@Override
	public int selectTotalMarketStaff() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalMarketStudent() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalKentL1Staff() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalKentL1Student() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalKentL5Staff() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTotalKentL5Student() {
		// TODO Auto-generated method stub
		return 0;
	}
}
