package com.dongyeop.okcomputer.service;

import com.dongyeop.okcomputer.dao.DaoComputerJsonInterface;
import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.Tv;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GeneralMaterialServiceImple implements MaterialServiceInterface<Object, String> {
	@Autowired
	private DaoComputerJsonInterface daoComputer;
	@Autowired
	private DaoMaterialInterface daoMaterialComputer;
	@Autowired
	private DaoMaterialInterface daoMaterialTv;
	@Autowired
	private DaoMaterialInterface daoMaterialGarage;


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
	public boolean createComputer(Object object)  {
		if(object instanceof Computer) {
			daoMaterialComputer.create(object);
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
	public boolean update(String s) throws ParseException {
		return false;
	}
}
