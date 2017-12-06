package com.dongyeop.okcomputer.dao;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class DaoMaterialGeneralImple implements DaoMaterialInterface<KoiMaterial, String>{
	protected String DAO_OBJECT_JSONFILE_PATH = null;
	protected JSONParser parser = new JSONParser();
	protected List<KoiMaterial> objectList = null;

	public DaoMaterialGeneralImple() {

	}
	protected List<KoiMaterial> readJson(String path) throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			objectList = (new Gson()).fromJson(arrStd, new TypeToken<List<Computer>>() {
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

	@Override
	public KoiMaterial getMaterial(String s) throws ParseException {
		// If do, Computer pc = new Computer is not good code as takes heap
		// memory.
		for (int i = 0; i < objectList.size(); i++) {
			if (s.equalsIgnoreCase(objectList.get(i).getId())) {
				System.out.println("GET : " + objectList.get(i).getId());
				return objectList.get(i);
			}
		}
		return null;
	}

	@Override
	public List<?> getAllMaterials() throws ParseException {
		return objectList;
	}

	@Override
	public boolean delete(String s) throws ParseException {
		System.out.println("S : " + s);
		for (int i = 0; i < objectList.size(); i++) {
			if (s.equalsIgnoreCase(objectList.get(i).getId())) {
				System.out.println("DELETE : " + objectList.get(i).getId().toString());
				objectList.remove(i);
			}
		}
		System.out.println("JSON PATH ON DELETE : " + DAO_OBJECT_JSONFILE_PATH);
		return writeJson();
	}

	@Override
	public boolean create(KoiMaterial object) {
		boolean b = objectList.add(object);
		return b ? writeJson() : false;
	}

	/* TODO: Add Sorting function to list using interface later */
	/* TODO: Use map instead of an object */
	@Override
	public boolean update(KoiMaterial object) throws ParseException {
		objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		boolean b = false;
		for (int i = 0; i < objectList.size(); i++) {
			if (object.getId().equals(objectList.get(i).getId())) {
				objectList.remove(i);
				b = objectList.add(object);
				System.out.println("Replaced: " + objectList.get(i).getName());
				break;
			}
		}
		return b ? writeJson() : false;
	}
}
