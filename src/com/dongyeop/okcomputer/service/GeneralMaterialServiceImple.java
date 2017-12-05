package com.dongyeop.okcomputer.service;

import com.dongyeop.okcomputer.dao.DaoComputerJsonInterface;
import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dto.Computer;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GeneralMaterialServiceImple implements GenericMaterialService<Object, String> {
	@Autowired
	private DaoComputerJsonInterface daoComputer;
	@Autowired
	private DaoMaterialInterface daoMaterialComputer;

	@Override
	public Object getLists() throws ParseException {
		List<Computer> computers = daoMaterialComputer.getAllMaterials();
		System.out.println("SERVICE SIZE of Computers : " + computers.size());
		return computers;
	}

	@Override
	public boolean create(Object o)  {
		return false;
	}

	@Override
	public boolean delete(Object o) throws ParseException {
		return false;
	}

	@Override
	public Object getMaterial(String s) throws ParseException {
		return null;
	}

	@Override
	public boolean update(String s) throws ParseException {
		return false;
	}
}
