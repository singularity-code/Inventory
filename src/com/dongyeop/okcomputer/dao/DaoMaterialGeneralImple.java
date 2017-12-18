package com.dongyeop.okcomputer.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.profile.ApplicationType;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class DaoMaterialGeneralImple<T1, T2> implements DaoMaterialInterface<T1, T2>{
	protected String DAO_OBJECT_JSONFILE_PATH = null;
	protected String DAO_OBJECT_JSONFILE_SNAPSHOT_PATH = null;
	protected JSONParser parser = new JSONParser();
	protected List<KoiMaterial> objectList = null;
	protected List<KoiMaterial> snapshotList = null;
	protected List<KoiMaterial> storeRoomList = new ArrayList<>();

	public DaoMaterialGeneralImple() {

	}
	protected List<KoiMaterial> readJson(String path) throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			objectList = (new Gson()).fromJson(arrStd, new TypeToken<List<KoiMaterial>>() {
			}.getType());

			System.out.println("Computer List :" + objectList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("READ SUCCESS");
		return objectList;
	}

	protected boolean writeJson() {
		// Convert List to Json format
		String json = new Gson().toJson(objectList);

		try (FileWriter file = new FileWriter(DAO_OBJECT_JSONFILE_PATH)) {
			System.out.println("ACTUAL WRITING : " + DAO_OBJECT_JSONFILE_PATH);
			file.write(json);
			file.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		System.out.println("WRITE SUCCESS");
		System.out.print("Json OBJ : " + json);
		return true;
	}
	
	protected boolean writeJsonStoreRoom() {
		// Convert List to Json format
		String json_storeRoom = new Gson().toJson(storeRoomList);
		DAO_OBJECT_JSONFILE_SNAPSHOT_PATH = ApplicationType.getJsonFilePath() + "storeRoom.json";
		
		try (FileWriter file = new FileWriter(DAO_OBJECT_JSONFILE_SNAPSHOT_PATH)) {
			System.out.println("ACTUAL STORE WRITING : " + DAO_OBJECT_JSONFILE_SNAPSHOT_PATH);
			file.write(json_storeRoom);
			file.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		System.out.print("Store OBJ : " + json_storeRoom);
		System.out.println("WRITE SUCCESS");
		return true;
	}
	
	public boolean makeBackupJsonFile() {
		DAO_OBJECT_JSONFILE_PATH = null;
		DAO_OBJECT_JSONFILE_PATH = ApplicationType.getJsonBackupPath() + this.getClass().getSimpleName().substring(11) + ".json";
		String json = new Gson().toJson(objectList);
		try (FileWriter file = new FileWriter(DAO_OBJECT_JSONFILE_PATH)) {
			System.out.println("Backup Process : " + DAO_OBJECT_JSONFILE_PATH);
			file.write(json);
			file.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		System.out.println(this.getClass().getSimpleName() + " Backup SUCCESS");
		System.out.print("Json OBJ : " + json);
		return true;
	}
	protected List<KoiMaterial> readSnapshot(String path) throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			snapshotList = (new Gson()).fromJson(arrStd, new TypeToken<List<KoiMaterial>>() {
			}.getType());

			System.out.println("Snapshot List :" + snapshotList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Snapshot Read");
		return objectList;
	}

	@Override
	public T1 getMaterial(T2 s) throws ParseException {
		// If do, Computer pc = new Computer is not good code as takes heap
		// memory.
		for (int i = 0; i < objectList.size(); i++) {
			if (((String) s).equalsIgnoreCase(objectList.get(i).getId())) {
				System.out.println("DAO GENERAL GET : " + objectList.get(i).getId());
				T1 t1 = (T1) objectList.get(i);
				return t1;
			}
		}
		return null;
	}

	@Override
	public List<?> getAllMaterials() throws ParseException {
		return objectList;
	}

	@Override
	public boolean delete(T2 s) throws ParseException {
		System.out.println("DAO ID : " + s);
		KoiMaterial foundObj = null;
		for (int i = 0; i < objectList.size(); i++) {
			if (((String) s).equalsIgnoreCase(objectList.get(i).getId())) {
				foundObj = objectList.get(i);
				storeRoomList.add(foundObj);
				System.out.println("Store : " + storeRoomList.size());
				objectList.remove(i);
				System.out.println("DELETE : " + foundObj.getId().toString());
			}
		}
		System.out.println("JSON PATH ON DELETE : " + DAO_OBJECT_JSONFILE_PATH);
		writeJsonStoreRoom();
		return writeJson();
	}

	@Override
	public boolean create(T1 object) {
		boolean b = objectList.add((KoiMaterial) object);
		return b ? writeJson() : false;
	}

	/* TODO: Add Sorting function to list using interface later */
	/* TODO: Use map instead of an object */
	@Override
	public boolean update(T1 object) throws ParseException {
		objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		boolean b = false;
		for (int i = 0; i < objectList.size(); i++) {
			if (((KoiMaterial) object).getId().equals(objectList.get(i).getId())) {
				objectList.remove(i);
				b = objectList.add((KoiMaterial) object);
				break;
			}
		}
		System.out.println("UPDATE SUCCESS");
		return b ? writeJson() : false;
	}

	@Override
	public boolean swap(T1 prev, T1 next) {
		KoiMaterial c1 = null;
		KoiMaterial c2 = null;

		for (KoiMaterial c : objectList) {
			if (((KoiMaterial) prev).getId().equals(c.getId())) {
				System.out.println("FOUND : " + c.getId());
				c1 = c;
				break;
			}
		}

		for (KoiMaterial c : objectList) {
			if (((KoiMaterial) next).getId().equals(c.getId())) {
				System.out.println("FOUND : " + c.getId());
				c2 = c;
				break;
			}
		}

		if (c1 == null || c2 == null) {
			System.out.println("Null");
			return false;
		}

		String location = c1.getLocation();
		String campus = c1.getCampus();
		String pcName = c1.getName();
		String user = c1.getUser();
		//String role = c1.getRole();

		c1.setPrevious(location + " " + c1.getName());
		c1.setLocation(c2.getLocation());
		c1.setCampus(c2.getCampus());
		System.out.println("C1 NAME: " + c1.getName());
		System.out.println("C2 NAME: " + c2.getName());
		c1.setName(c2.getName());
		c1.setUser(c2.getUser());
		//c1.setRole(c2.getRole());
		c1.setUpdatedate(c1.generateDate());

		c2.setPrevious(c2.getLocation() + "- " + c2.getName());
		c2.setLocation(location);
		c2.setCampus(campus);
		c2.setName(pcName);
		c2.setUser(user);
		//c2.setRole(role);
		c2.setUpdatedate(c2.generateDate());
		System.out.println("C1 NAME: " + c1.getName());
		System.out.println("C2 NAME: " + c2.getName());
		System.out.println("SWAP SUCCESS");
		return writeJson();
	}
	@Override
	public int selectTotalMarketStaff() {
		int total = 0;
		for(KoiMaterial obj : objectList) {
			if(obj.getCampus().equalsIgnoreCase("market") && obj.isStaffUser()) {
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
			if(obj.getCampus().equalsIgnoreCase("market") && obj.isStaffUser()) {
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
			if(obj.getCampus().equalsIgnoreCase("kent l1") && obj.isStaffUser()) {
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
			if(obj.getCampus().equalsIgnoreCase("kent l1") && obj.isStaffUser())  {
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
			if(obj.getCampus().equalsIgnoreCase("kent l5") && obj.isStaffUser())  {
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
			if(obj.getCampus().equalsIgnoreCase("kent l5") && obj.isStaffUser())  {
				total += 1;
			}
		}
		return total;
	}
	@Override
	public int getListTotal() {
		return objectList.size();
	}
	@Override
	public int selectTotalMarketStaffByDate(String date) {
		int total = 0;
		DAO_OBJECT_JSONFILE_SNAPSHOT_PATH = ApplicationType.getJsonBackupPathWithoutDate() + date + "\\" + this.getClass().getSimpleName() + ".json";
		try {
			snapshotList = readSnapshot(DAO_OBJECT_JSONFILE_SNAPSHOT_PATH);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(KoiMaterial obj : snapshotList) {
			String index = obj.getId().substring(0, 1);
			if(obj.getCampus().equalsIgnoreCase("market") && index.equals("C")) {
				total += 1;
			}
		}
		return total;
	}
}
