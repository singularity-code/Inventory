package com.inventory.engine;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.inventory.dto.KoiMaterial;

public class WrightEngine {
	protected String DAO_OBJECT_JSONFILE_SNAPSHOT_PATH = null;
	protected JSONParser parser = new JSONParser();
	
	public WrightEngine() {
	}
	public HashMap<String, List<?>> readAllJsonFiles(String path) throws ParseException, IOException {
//		String path = "C:\\testdata\\materials\\snapshot\\19122017\\";
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		HashMap<String, List<?>> allJsonFilesMap = new HashMap<String, List<?>>();
		
		for (File file : listOfFiles) {
			if (file.isFile()) {
				System.out.println(file.getName());
				try {
					String fileName = file.getName();
					int idx = fileName.indexOf("Imple");
					String keyName = fileName.substring(0, idx);
					
					List<KoiMaterial> objectList = null;
					Object obj = parser.parse(new FileReader(path + fileName));
					String arrStd = obj.toString();
					objectList = (new Gson()).fromJson(arrStd, new TypeToken<List<KoiMaterial>>() {
					}.getType());
					allJsonFilesMap.put(keyName, objectList);
				}catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		for (Entry<String, List<?>> e : allJsonFilesMap.entrySet()) {
			//to get key
			System.out.println("Key: " + e.getKey());
			//and to get value
			System.out.println("Value: " + e.getValue());
		}
		System.out.println("Snapshots Loaded");
		return allJsonFilesMap;
	}

	public HashMap<String, Object> readSnapshots() throws ParseException, IOException {
		String path = "C:\\testdata\\materials\\snapshot\\19122017\\";
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		HashMap<String, Object> snapthosMap = new HashMap<String, Object>();
		
		for (File file : listOfFiles) {
			if (file.isFile()) {
				System.out.println(file.getName());
				try {
					String fileName = file.getName();
					int idx = fileName.indexOf("Imple");
					String keyName = fileName.substring(0, idx);
					List<KoiMaterial> snapshotList = null;
					Object obj = parser.parse(new FileReader(path + fileName));
					String arrStd = obj.toString();
					snapshotList = (new Gson()).fromJson(arrStd, new TypeToken<List<KoiMaterial>>() {
					}.getType());
					snapthosMap.put(keyName, snapshotList);
				}catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		for (Map.Entry<String, Object> e : snapthosMap.entrySet()) {
			//to get key
			System.out.println("Key: " + e.getKey());
			//and to get value
			System.out.println("Value: " + e.getValue());
		}
		System.out.println("Snapshots Loaded");
		return snapthosMap;
	}
}
