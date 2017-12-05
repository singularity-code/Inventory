package com.dongyeop.okcomputer.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import com.dongyeop.okcomputer.dto.Tv;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.profile.ApplicationType;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class DaoComputerJsonImp implements DaoComputerJsonInterface {
	private static String DAO_COMPUTER_JSONFILE_PATH = null;
	private static String DAO_GARAGE_JSONFILE_PATH = null;
	private static String DAO_TV_JSONFILE_PATH = null;

	private JSONParser parser = new JSONParser();
	private List<Computer> comList = null;
	private List<Computer> garageList = null;
	private List<Tv> tvList = null;

	public DaoComputerJsonImp() {
		DAO_COMPUTER_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "mother_computer.json";
		DAO_TV_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "mother_tv.json";
		DAO_GARAGE_JSONFILE_PATH = ApplicationType.getJsonFilePath() + "computers_garage.json"; 

		try {
			comList = readJson(DAO_COMPUTER_JSONFILE_PATH);
			garageList = readGarageJson(DAO_GARAGE_JSONFILE_PATH);
			tvList = readTvJson(DAO_TV_JSONFILE_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private List<Computer> readJson(String path) throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			comList = (new Gson()).fromJson(arrStd, new TypeToken<List<Computer>>() {
			}.getType());

			System.out.println("Computer List :" + comList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return comList;
	}

	private List<Tv> readTvJson(String path) throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			tvList = (new Gson()).fromJson(arrStd, new TypeToken<List<Tv>>() {
			}.getType());
			System.out.println("Tv List :" + tvList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tvList;
	}
	
	private List<Computer> readGarageJson(String path) throws ParseException {
		try {
			Object obj2 = parser.parse(new FileReader(path));
			String arrStd2 = obj2.toString();

			garageList = (new Gson()).fromJson(arrStd2, new TypeToken<List<Computer>>() {
			}.getType());
			System.out.println("Garage List :" + garageList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return garageList;
	}

	private boolean writeJson() {
		// Convert List to Json format
		String json = new Gson().toJson(comList);

		try (FileWriter file = new FileWriter(DAO_COMPUTER_JSONFILE_PATH)) {
			file.write(json);
			file.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		System.out.print(json);
		return true;
	}

	@Override
	public Computer getComputer(String id) throws ParseException {
		// If do, Computer pc = new Computer is not good code as takes heap
		// memory.
		for (int i = 0; i < comList.size(); i++) {
			if (id.equals(comList.get(i).getId())) {
				System.out.println(comList.get(i).getName());
				return comList.get(i);
			}
		}
		return null;
	}

	@Override
	public List<Tv> getAllTv() throws ParseException {
		return tvList;
	}

	@Override
	public List<Computer> getAllComputers() throws ParseException {
		return comList;
	}

	@Override
	public List<Computer> getAllGarage() throws ParseException {
		return garageList;
	}

	@Override
	public boolean delete(String id) throws ParseException {
		for (int i = 0; i < comList.size(); i++) {
			if (id.equals(comList.get(i).getId())) {
				System.out.println("Deleted: " + comList.get(i).getName());
				comList.remove(i);
			}
		}
		return writeJson();
	}

	@Override
	public boolean create(Computer computer) {
		boolean b = comList.add(computer);
		return b ? writeJson() : false;
	}

	/* TODO: Add Sorting function to list using interface later */
	@Override
	public boolean update(Computer computer) throws ParseException {
		comList = readJson(DAO_COMPUTER_JSONFILE_PATH);
		boolean b = false;
		for (int i = 0; i < comList.size(); i++) {
			if (computer.getId().equals(comList.get(i).getId())) {
				comList.remove(i);
				b = comList.add(computer);
				System.out.println("Replaced: " + comList.get(i).getName());
				break;
			}
		}
		return b ? writeJson() : false;
	}

	@Override
	public boolean swap(Computer cc1, Computer cc2) throws ParseException {
		Computer c1 = null;
		Computer c2 = null;

		for (Computer c : comList) {
			if (cc1.getId().equals(c.getId())) {
				c1 = c;
				break;
			}
		}

		for (Computer c : comList) {
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

	@Override
	public boolean move(Computer computer) throws ParseException {
		comList = readJson(DAO_COMPUTER_JSONFILE_PATH);
		boolean b = false;
		for (int i = 0; i < comList.size(); i++) {
			if (computer.getId().equals(comList.get(i).getId())) {
				computer.setStatus("Inactive");
				System.out.println("Moved: " + comList.get(i).getName());
				break;
			}
		}
		return b ? writeJson() : false;
	}
}
