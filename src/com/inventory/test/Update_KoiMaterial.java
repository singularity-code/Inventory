package com.inventory.test;

import static org.junit.Assert.assertTrue;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Before;
import org.junit.Test;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.inventory.dto.KoiMaterial;

public class Update_KoiMaterial {
	/*
	 * private String index = "0"; private String sn = "H-Test"; private String id = "Test Name"; private String type = "Desktop"; private String brand = "No Brand"; private String name = "Test"; private String previous = "None"; private String user = "Test user"; private String campus = "Market"; private String location = "Test Location"; private String status = "New"; private String comment = "No comment";
	 */

	private JSONParser parser = new JSONParser();
	private List<?> objectList = null;
	private String path = "C:\\testdata\\materials\\desktops.json";

	@Before
	public void before_01() {
	}

	@Test
	public void test() throws FileNotFoundException, IOException, ParseException {
		String arrStd = parser.parse(new FileReader(path)).toString();

		objectList = (new Gson()).fromJson(
				arrStd, new TypeToken<List<KoiMaterial>>() {
				}.getType()
		);

		System.out.println("List :" + objectList.size());
		assertTrue(!objectList.isEmpty());
	}
}
