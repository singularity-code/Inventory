package com.dongyeop.okcomputer.service;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.*;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GeneralMaterialServiceImple implements MaterialServiceInterface<Object, String> {
	@Autowired private DaoMaterialInterface daoMaterialComputer;
	@Autowired private DaoMaterialInterface daoMaterialTv;
	@Autowired private DaoMaterialInterface daoMaterialGarage;
	@Autowired private DaoMaterialInterface daoMaterialFridge;
	@Autowired private DaoMaterialInterface daoMaterialSwitch;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;


	@Override
	public Object getComputerList() throws ParseException {
		List<Computer> computers = daoMaterialComputer.getAllMaterials();
		System.out.println("SERVICE SIZE of Computers : " + computers.size());
		return computers;
	}

	@Override
	public Object getTvList() throws ParseException {
		List<Tv> tvs = daoMaterialTv.getAllMaterials();
		System.out.println("SERVICE SIZE of Tv : " + tvs.size());
		return tvs;
	}

	@Override
	public Object getGarageList() throws ParseException {
		List<Computer> garage = daoMaterialGarage.getAllMaterials();
		System.out.println("SERVICE SIZE of Garage : " + garage.size());
		return garage;
	}

	@Override
	public Object getTelephoneList() throws ParseException {
		List<Telephone> telephones = daoMaterialTelephone.getAllMaterials();
		System.out.println("SERVICE SIZE of Telephone : " + telephones.size());
		return telephones;
	}

	@Override
	public Object getSwitchList() throws ParseException {
		List<Switch> switches = daoMaterialSwitch.getAllMaterials();
		System.out.println("SERVICE SIZE of Switch : " + switches.size());
		return switches;
	}

	@Override
	public Object getFridgeList() throws ParseException {
		List<Fridge> fridges = daoMaterialFridge.getAllMaterials();
		System.out.println("SERVICE SIZE of Fridge : " + fridges.size());
		return fridges;
	}

	@Override
	public boolean createComputer(Object object)  {
		if(object instanceof Computer) {
			daoMaterialComputer.create(object);
		}
		return false;
	}

	@Override
	public boolean createTv(Object object) {
		if(object instanceof Tv) {
			daoMaterialTv.create(object);
		}
		return false;
	}

	@Override
	public boolean createTelephone(Object object) {
		if(object instanceof Telephone) {
			daoMaterialTelephone.create(object);
		}
		return false;
	}

	@Override
	public boolean createSwitch(Object object) {
		if(object instanceof Switch) {
			daoMaterialSwitch.create(object);
		}
		return false;
	}

	@Override
	public boolean createFridge(Object object) {
		if(object instanceof Fridge) {
			daoMaterialFridge.create(object);
		}
		return false;
	}

	public boolean deleteComputer(String id) throws ParseException {
		return daoMaterialComputer.delete(id);
	}

	public boolean deleteTv(String id) throws ParseException {
		return daoMaterialTv.delete(id);
	}

	@Override
	public boolean deleteTelephone(String id) throws ParseException  {
		return daoMaterialTelephone.delete(id);
	}

	@Override
	public boolean deleteSwitch(String id) throws ParseException  {
		return daoMaterialSwitch.delete(id);
	}

	@Override
	public boolean deleteFridge(String id) throws ParseException  {
		return daoMaterialFridge.delete(id);
	}

	@Override
	public Object getMaterial(String id) throws ParseException {
		return null;
	}

	@Override
	public Object getComputer(String id) throws ParseException {
		return daoMaterialComputer.getMaterial(id);
	}

	@Override
	public Object getTv(String id) throws ParseException {
		return daoMaterialTv.getMaterial(id);
	}

	@Override
	public Object getTelephone(String id) throws ParseException {
		return daoMaterialTelephone.getMaterial(id);
	}

	@Override
	public Object getSwitch(String id) throws ParseException {
		return daoMaterialSwitch.getMaterial(id);
	}

	@Override
	public Object getFridge(String id) throws ParseException {
		return daoMaterialFridge.getMaterial(id);
	}

	@Override
	public boolean updateComputer(Object object) throws ParseException {
		return daoMaterialComputer.update(object);
	}

	@Override
	public boolean updateTv(Object object)throws ParseException  {
		return daoMaterialTv.update(object);
	}

	@Override
	public boolean updateTelephone(Object object) throws ParseException {
		return daoMaterialTelephone.update(object);
	}

	@Override
	public boolean updateSwitch(Object object) throws ParseException {
		return daoMaterialSwitch.update(object);
	}

	@Override
	public boolean updateFridge(Object object) throws ParseException {
		return daoMaterialFridge.update(object);
	}

	@Override
	public boolean swap(Object prev, Object next) throws ParseException {
		return daoMaterialComputer.swap(prev, next);
	}
}
