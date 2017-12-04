package com.dongyeop.okcomputer.service;

import java.util.List;

import com.dongyeop.okcomputer.dto.Tv;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoComputerJsonInterface;
import com.dongyeop.okcomputer.dto.Computer;

public class ComputerService implements GenericComputerService {

	@Autowired
	private DaoComputerJsonInterface daoComputer;
	
	@Override
	public List<Computer> getWelcomeMessage(String name) {
		return null;
	}

	@Override
	public Object getLists() throws ParseException {
		List<Computer> computers = daoComputer.getAllComputers();
		System.out.println("SERVICE SIZE of Computers : " + computers.size());
		return computers;
	}
	
	@Override
	public Object getGarageLists() throws ParseException {
		List<Computer> garage = daoComputer.getAllGarage();
		System.out.println("SERVICE SIZE of Rubish : " + garage.size());
		return null;
	}

    @Override
    public Object getTvLists() throws ParseException {
        List<Tv> tv = daoComputer.getAllTv();
        return tv;
    }

    @Override
	public boolean create(Computer computer) {
		return daoComputer.create(computer);
	}

	@Override
	public boolean delete(String id) throws ParseException {
		return daoComputer.delete(id);
	}

	@Override
	public Object getComputer(String id) throws ParseException {
		return daoComputer.getComputer(id);
	}

	@Override
	public boolean update(Computer computer) throws ParseException {
		return daoComputer.update(computer);
	}

	@Override
	public boolean swap(Computer computer, Computer next) throws ParseException {
		return daoComputer.swap(computer, next);
	}

	@Override
	public boolean move(Computer computer) throws ParseException {
		return daoComputer.move(computer);
	}
}
