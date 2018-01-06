package com.dongyeop.test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;

import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.okcomputer.service.GeneralMaterialServiceImple;
import com.dongyeop.okcomputer.service.MaterialServiceInterface;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

class Update_KoiMaterial {

	private static String index = "0";
	private static String sn = "H-Test";
	private static String id = "Test Name";
	private static String type = "Desktop";
	private static String brand = "No Brand";
	private static String name ="Test";
	private static String previous = "None";
	private static String user = "Test user";
	private static String campus = "Market";
	private static String location = "Test Location";
	private static String status = "New";
	private static String comment = "No comment";
	
	protected JSONParser parser = new JSONParser();
	protected List<?> objectList = null;
	protected String path = "C:\\testdata\\materials\\desktops.json"; 
	
	private MaterialServiceInterface<Object, String> materialService = new GeneralMaterialServiceImple();
	
	@Test
	void test() throws ParseException {
		try {
			Object obj = parser.parse(new FileReader(path));
			String arrStd = obj.toString();

			objectList = (new Gson()).fromJson(arrStd, new TypeToken<List<KoiMaterial>>() {
			}.getType());

			System.out.println("List :" + objectList.size());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("READ SUCCESS");
	}
}
