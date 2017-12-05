package com.dongyeop.okcomputer.dao;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.profile.ApplicationType;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.util.List;

public class DaoMaterialComputerImple extends DaoMaterialGeneralImple{

	public DaoMaterialComputerImple() {
		super();
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "mother_computer.json";

		try {
			objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean swap(Computer cc1, Computer cc2) throws ParseException {
		Computer c1 = null;
		Computer c2 = null;

		for (Computer c : (List<Computer>)objectList) {
			if (cc1.getId().equals(c.getId())) {
				c1 = c;
				break;
			}
		}

		for (Computer c : (List<Computer>)objectList) {
			if (cc2.getId().equals(c.getId())) {
				c2 = c;
				break;
			}
		}

		if (c1 == null || c2 == null) {
			// logger.info("no computer in computerList");
			return false;
		}

		String l = c1.getLocation();
		String campus = c1.getCampus();
		String pcName = c1.getName();
		String user = c1.getUser();
		String role = c1.getRole();

		c1.setPrevious(l + " " + c1.getName());
		c1.setLocation(c2.getLocation());
		c1.setCampus(c2.getCampus());
		c1.setName(c2.getName());
		c1.setUser(c2.getUser());
		c1.setRole(c2.getRole());
		c1.setUpdatedate(c1.generateDate());

		c2.setPrevious(c2.getLocation() + "- " + c2.getName());
		c2.setLocation(l);
		c2.setCampus(campus);
		c2.setName(pcName);
		c2.setUser(user);
		c2.setRole(role);
		c2.setUpdatedate(c2.generateDate());

		return writeJson();
	}
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
}
