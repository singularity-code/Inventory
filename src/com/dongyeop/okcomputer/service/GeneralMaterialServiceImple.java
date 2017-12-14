package com.dongyeop.okcomputer.service;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.KoiComputer;
import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.okcomputer.dto.Monitor;
import com.dongyeop.okcomputer.dto.Printer;
import com.dongyeop.okcomputer.dto.Telephone;
import com.dongyeop.okcomputer.dto.Tv;

public class GeneralMaterialServiceImple implements MaterialServiceInterface<Object, String> {
	//NEW
	@Autowired private DaoMaterialInterface daoMaterialDesktop;
	@Autowired private DaoMaterialInterface daoMaterialLaptop;
	@Autowired private DaoMaterialInterface daoMaterialMac;
	@Autowired private DaoMaterialInterface daoMaterialMonitor;
	@Autowired private DaoMaterialInterface daoMaterialEtc;
	@Autowired private DaoMaterialInterface daoMaterialEtcIt;
	@Autowired private DaoMaterialInterface daoMaterialPrinter;
	@Autowired private DaoMaterialInterface daoMaterialTelephone;
	
	//OLD
	@Autowired private DaoMaterialInterface daoMaterialComputer;
	@Autowired private DaoMaterialInterface daoMaterialTv;
	@Autowired private DaoMaterialInterface daoMaterialGarage;
	
	@Autowired private DaoComputerInterface daoComputer;
	
	public Object getZabbixList() {
		return daoComputer.getAllzabbix();
	}
	
	@Override
	public Object getComputerList() throws ParseException {
		List<KoiComputer> computers = daoMaterialComputer.getAllMaterials();
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
	public Object getAllList() throws ParseException {
		List<Object> masterList = daoMaterialComputer.getAllMaterials();
		masterList.addAll(daoMaterialTelephone.getAllMaterials());
		masterList.addAll(daoMaterialTv.getAllMaterials());
		System.out.println("SERVICE SIZE of All : " + masterList.size());
		return masterList; 
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
	public boolean swap(Object prev, Object next) throws ParseException {
		return daoMaterialComputer.swap(prev, next);
	}

	@Override
	public Object getDesktopList() throws ParseException {
		List<KoiComputer> desktops = daoMaterialDesktop.getAllMaterials();
		System.out.println("SERVICE SIZE of Computers : " + desktops.size());
		return desktops;
	}

	@Override
	public Object getLaptopList() throws ParseException {
		List<KoiComputer> laptops = daoMaterialLaptop.getAllMaterials();
		System.out.println("SERVICE SIZE of Laptopss : " + laptops.size());
		return laptops;
	}

	@Override
	public Object getMonitorList() throws ParseException {
		List<Monitor> monitors = daoMaterialMonitor.getAllMaterials();
		System.out.println("SERVICE SIZE of monitors : " + monitors.size());
		return monitors;
	}

	@Override
	public Object getMacList() throws ParseException {
		List<KoiComputer> macs = daoMaterialMac.getAllMaterials();
		System.out.println("SERVICE SIZE of macs : " + macs.size());
		return macs;
	}

	@Override
	public Object getPrinterList() throws ParseException {
		List<Printer> printers = daoMaterialPrinter.getAllMaterials();
		System.out.println("SERVICE SIZE of printers : " + printers.size());
		return printers;
	}

	@Override
	public Object getEtcList() throws ParseException {
		List<KoiMaterial> koiMaterials = daoMaterialEtc.getAllMaterials();
		System.out.println("SERVICE SIZE of ETC : " + koiMaterials.size());
		return koiMaterials;
	}

	@Override
	public Object getEtcItList() throws ParseException {
		List<KoiMaterial> koiMaterials = daoMaterialEtcIt.getAllMaterials();
		System.out.println("SERVICE SIZE of ETC IT : " + koiMaterials.size());
		return koiMaterials;
	}

	@Override
	public boolean createDesktop(Object o) {
		if(o instanceof Computer) {
			daoMaterialDesktop.create(o);
		}
		return false;
	}

	@Override
	public boolean createLaptop(Object o) {
		if(o instanceof Computer) {
			daoMaterialDesktop.create(o);
		}
		return false;
	}

	@Override
	public boolean createMonitor(Object o) {
		if(o instanceof Monitor) {
			daoMaterialDesktop.create(o);
		}
		return false;
	}

	@Override
	public boolean createMac(Object o) {
		if(o instanceof Computer) {
			daoMaterialDesktop.create(o);
		}
		return false;
	}

	@Override
	public boolean createPrinter(Object o) {
		if(o instanceof Printer) {
			daoMaterialDesktop.create(o);
		}
		return false;
	}

	@Override
	public boolean deleteDesktop(String id) throws ParseException {
		return daoMaterialDesktop.delete(id);
	}

	@Override
	public boolean deleteLaptop(String id) throws ParseException {
		return daoMaterialLaptop.delete(id);
	}

	@Override
	public boolean deleteMonitor(String id) throws ParseException {
		return daoMaterialMonitor.delete(id);
	}

	@Override
	public boolean deleteMac(String id) throws ParseException {
		return daoMaterialMac.delete(id);
	}

	@Override
	public boolean deletePrinter(String id) throws ParseException {
		return daoMaterialPrinter.delete(id);
	}

	@Override
	public boolean deleteTelephone(String id) throws ParseException {
		return daoMaterialTelephone.delete(id);
	}

	@Override
	public Object getDesktop(String id) throws ParseException {
		return daoMaterialDesktop.getMaterial(id);
	}

	@Override
	public Object getLaptop(String id) throws ParseException {
		return daoMaterialLaptop.getMaterial(id);
	}

	@Override
	public Object getMonitor(String id) throws ParseException {
		return daoMaterialLaptop.getMaterial(id);
	}

	@Override
	public Object getMac(String id) throws ParseException {
		return daoMaterialMac.getMaterial(id);
	}

	@Override
	public Object getPrinter(String id) throws ParseException {
		return daoMaterialPrinter.getMaterial(id);
	}

	@Override
	public Object getTelephone(String id) throws ParseException {
		return daoMaterialTelephone.getMaterial(id);
	}

	@Override
	public boolean updateDesktop(Object o) throws ParseException {
		return daoMaterialDesktop.update(o);
	}

	@Override
	public boolean updateLaptop(Object o) throws ParseException {
		return daoMaterialLaptop.update(o);
	}

	@Override
	public boolean updateMonitor(Object o) throws ParseException {
		return daoMaterialMonitor.update(o);
	}

	@Override
	public boolean updateMac(Object o) throws ParseException {
		return daoMaterialMac.update(o);
	}

	@Override
	public boolean updatePrinter(Object o) throws ParseException {
		return daoMaterialPrinter.update(o);
	}
}
