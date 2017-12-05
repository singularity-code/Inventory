package com.dongyeop.okcomputer.dao;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.profile.ApplicationType;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class DaoMaterialGeneralImple implements DaoMaterialInterface<Object, String>{
	protected static String DAO_OBJECT_JSONFILE_PATH = null;
	protected JSONParser parser = new JSONParser();
	protected List<?> objectList = null;

	public DaoMaterialGeneralImple() {

	}
	protected List<?> readJson(String path) throws ParseException {
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
		return objectList;
	}

	protected boolean writeJson() {
		// Convert List to Json format
		String json = new Gson().toJson(objectList);

		try (FileWriter file = new FileWriter(DAO_OBJECT_JSONFILE_PATH)) {
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
	public Object getMaterial(String s) throws ParseException {
		// If do, Computer pc = new Computer is not good code as takes heap
		// memory.
		for (int i = 0; i < objectList.size(); i++) {
			if (s.equals(objectList.get(i))) {
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
		for (int i = 0; i < objectList.size(); i++) {
			if (s.equals(objectList.get(i))) {
				objectList.remove(i);
			}
		}
		return writeJson();
	}

	/* TODO: Use map instead of an object */
	@Override
	public boolean create(String s) {
/*		boolean b = objectList.add(o);
		return b ? writeJson() : false;*/
		return false;
	}

	/* TODO: Add Sorting function to list using interface later */
	/* TODO: Use map instead of an object */
	@Override
	public boolean update(String s) throws ParseException {
		objectList = readJson(DAO_OBJECT_JSONFILE_PATH);
		boolean b = false;
/*		for (int i = 0; i < objectList.size(); i++) {
			if (o.equals(objectList.get(i))) {
				objectList.remove(i);
				b = objectList.add(o);
				break;
			}
		}*/
		return b ? writeJson() : false;
	}
}
