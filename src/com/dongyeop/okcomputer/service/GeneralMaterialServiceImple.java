package com.dongyeop.okcomputer.service;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.dongyeop.okcomputer.dao.DaoMaterialInterface;
import com.dongyeop.okcomputer.dao_database.DaoComputerInterface;
import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.KoiMaterial;
import com.dongyeop.okcomputer.dto.Monitor;
import com.dongyeop.okcomputer.dto.Printer;
import com.dongyeop.okcomputer.dto.Telephone;
import com.dongyeop.okcomputer.dto.Tv;
import com.dongyeop.okcomputer.engine.WrightEngine;

public class GeneralMaterialServiceImple implements MaterialServiceInterface<Object, String> {
	private WrightEngine writeEngine = new WrightEngine();
	//NEW
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialDesktop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String> daoMaterialLaptop;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialMac;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialMonitor;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialEtc;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialEtcIt;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialPrinter;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialTelephone;
	
	//OLD
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialComputer;
	@Autowired private DaoMaterialInterface<KoiMaterial, String>  daoMaterialTv;
	
	@Autowired private DaoComputerInterface daoComputer;
	
	public Object getZabbixList() {
		return daoComputer.getAllzabbix();
	}
	
	@Override
	public Object getComputerList() throws ParseException {
		List<?> computers = daoMaterialComputer.getAllMaterials();
		System.out.println("SERVICE SIZE of Computers : " + computers.size());
		return computers;
	}

	@Override
	public Object getTelephoneList() throws ParseException {
		List<?> telephones = daoMaterialTelephone.getAllMaterials();
		System.out.println("SERVICE SIZE of Telephone : " + telephones.size());
		return telephones;
	}
	

	@Override
	public boolean createComputer(Object object)  {
		if(object instanceof Computer) {
			daoMaterialComputer.create((KoiMaterial) object);
		}
		return false;
	}

	@Override
	public boolean createTv(Object object) {
		if(object instanceof Tv) {
			daoMaterialTv.create((KoiMaterial) object);
		}
		return false;
	}

	@Override
	public boolean createTelephone(Object object) {
		if(object instanceof Telephone) {
			daoMaterialTelephone.create((KoiMaterial) object);
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
		return daoMaterialComputer.update((KoiMaterial) object);
	}

	@Override
	public boolean updateTv(Object object)throws ParseException  {
		return daoMaterialTv.update((KoiMaterial) object);
	}

	@Override
	public boolean updateTelephone(Object object) throws ParseException {
		return daoMaterialTelephone.update((KoiMaterial) object);
	}

	@Override
	public boolean swap(Object prev, Object next) throws ParseException {
		//daoMaterialComputer.swap(prev, next);
		return false;
	}

	@Override
	public Object getDesktopList() throws ParseException {
		List<?> desktops = daoMaterialDesktop.getAllMaterials();
		System.out.println("SERVICE SIZE of Computers : " + desktops.size());
		return desktops;
	}

	@Override
	public Object getLaptopList() throws ParseException {
		List<?> laptops = daoMaterialLaptop.getAllMaterials();
		System.out.println("SERVICE SIZE of Laptopss : " + laptops.size());
		return laptops;
	}

	@Override
	public Object getMonitorList() throws ParseException {
		List<?> monitors = daoMaterialMonitor.getAllMaterials();
		System.out.println("SERVICE SIZE of monitors : " + monitors.size());
		return monitors;
	}

	@Override
	public Object getMacList() throws ParseException {
		List<?> macs = daoMaterialMac.getAllMaterials();
		System.out.println("SERVICE SIZE of macs : " + macs.size());
		return macs;
	}

	@Override
	public Object getPrinterList() throws ParseException {
		List<?> printers = daoMaterialPrinter.getAllMaterials();
		System.out.println("SERVICE SIZE of printers : " + printers.size());
		return printers;
	}

	@Override
	public Object getEtcList() throws ParseException {
		List<?> koiMaterials = daoMaterialEtc.getAllMaterials();
		System.out.println("SERVICE SIZE of ETC : " + koiMaterials.size());
		return koiMaterials;
	}

	@Override
	public Object getEtcItList() throws ParseException {
		List<?> koiMaterials = daoMaterialEtcIt.getAllMaterials();
		System.out.println("SERVICE SIZE of ETC IT : " + koiMaterials.size());
		return koiMaterials;
	}
	
	@Override
	public Object getAllList() throws ParseException {
		LinkedList<Object> allMaterials = new LinkedList<Object>();
		allMaterials.addAll(daoMaterialDesktop.getAllMaterials());
		allMaterials.addAll(daoMaterialLaptop.getAllMaterials());
		allMaterials.addAll(daoMaterialMonitor.getAllMaterials());
		allMaterials.addAll(daoMaterialPrinter.getAllMaterials());
		allMaterials.addAll(daoMaterialTelephone.getAllMaterials());
		allMaterials.addAll(daoMaterialMac.getAllMaterials());
		allMaterials.addAll(daoMaterialEtcIt.getAllMaterials());
		allMaterials.addAll(daoMaterialEtc.getAllMaterials());
		return allMaterials;
	}

	@Override
	public boolean createDesktop(Object o) {
		if(o instanceof Computer) {
			daoMaterialDesktop.create((KoiMaterial) o);
		}
		System.out.println("false");
		return false;
	}

	@Override
	public boolean createLaptop(Object o) {
		if(o instanceof Computer) {
			daoMaterialLaptop.create((KoiMaterial) o);
		}
		return false;
	}

	@Override
	public boolean createMonitor(Object o) {
		if(o instanceof Monitor) {
			daoMaterialMonitor.create((KoiMaterial) o);
		}
		return false;
	}

	@Override
	public boolean createMac(Object o) {
		if(o instanceof Computer) {
			daoMaterialMac.create((KoiMaterial) o);
		}
		return false;
	}

	@Override
	public boolean createPrinter(Object o) {
		if(o instanceof Printer) {
			daoMaterialPrinter.create((KoiMaterial) o);
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
	public boolean toggleDeletePrinter(String id) throws ParseException {
		return daoMaterialPrinter.toggleDelete(id);
	}
	
	@Override
	public boolean toggleDeleteDesktop(String id) throws ParseException {
		return daoMaterialDesktop.toggleDelete(id);
	}

	@Override
	public boolean toggleDeleteLaptop(String id) throws ParseException {
		return daoMaterialLaptop.toggleDelete(id);
	}

	@Override
	public boolean toggleDeleteMonitor(String id) throws ParseException {
		return daoMaterialMonitor.toggleDelete(id);
	}

	@Override
	public boolean toggleDeleteMac(String id) throws ParseException {
		return daoMaterialMac.toggleDelete(id);
	}

	@Override
	public boolean toggleDeleteTelephone(String id) throws ParseException {
		return daoMaterialTelephone.toggleDelete(id);
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
		return daoMaterialMonitor.getMaterial(id);
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
		return daoMaterialDesktop.update((KoiMaterial) o);
	}

	@Override
	public boolean updateLaptop(Object o) throws ParseException {
		return daoMaterialLaptop.update((KoiMaterial) o);
	}

	@Override
	public boolean updateMonitor(Object o) throws ParseException {
		return daoMaterialMonitor.update((KoiMaterial) o);
	}

	@Override
	public boolean updateMac(Object o) throws ParseException {
		return daoMaterialMac.update((KoiMaterial) o);
	}

	@Override
	public boolean updatePrinter(Object o) throws ParseException {
		return daoMaterialPrinter.update((KoiMaterial) o);
	}

	@Override
	public boolean readAllJsonFiles(String path) throws ParseException, IOException {
		writeEngine.readAllJsonFiles(path);
		return false;
	}


}
