package com.dongyeop.okcomputer.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.dto.Monitor;
import com.dongyeop.okcomputer.dto.Printer;
import com.dongyeop.okcomputer.dto.Telephone;
import com.dongyeop.okcomputer.service.MaterialReport;
import com.dongyeop.okcomputer.service.MaterialServiceInterface;

@Controller
public class StockManagementController {

	String redirectUrl = "redirect:/";

	// StockService is defined in Bean Config
	@Autowired
	private MaterialServiceInterface<Object, String> materialService;
	@Autowired
	private MaterialReport reportService;

	@RequestMapping("/")
	public String getLists(Model model) throws ParseException {
		model.addAttribute("desktops", toJson(materialService.getDesktopList()));
		model.addAttribute("laptops", toJson(materialService.getLaptopList()));
		model.addAttribute("monitors", toJson(materialService.getMonitorList()));
		model.addAttribute("macs", toJson(materialService.getMacList()));
		model.addAttribute("etc", toJson(materialService.getEtcList()));
		model.addAttribute("etc_it", toJson(materialService.getEtcItList()));
		model.addAttribute("printers", toJson(materialService.getPrinterList()));
		model.addAttribute("telephones", toJson(materialService.getTelephoneList()));
		
		//model.addAttribute("garage", toJson(materialService.getGarageList()));
		//model.addAttribute("tvs", toJson(materialService.getTvList()));
		
		model.addAttribute("totalDesktopMap", toJson(reportService.selectTotalDesktopReport()));
		model.addAttribute("totalEtcMap", toJson(reportService.selectTotalEtcReport()));
		model.addAttribute("totalItEtcMap", toJson(reportService.selectTotalItEtcReport()));
		model.addAttribute("totalLaptopMap", toJson(reportService.selectTotalLatptopReport()));
		model.addAttribute("totalMacMap", toJson(reportService.selectTotalMacReport()));
		model.addAttribute("totalMonitorMap", toJson(reportService.selectTotalMonitorReport()));
		model.addAttribute("totalPrinterMap", toJson(reportService.selectTotalPrinterReport()));
		model.addAttribute("totalTelephoneMap", toJson(reportService.selectTotalTelephoneReport()));
		model.addAttribute("totalTvMap", toJson(reportService.selectTotalTvReport()));
		model.addAttribute("totalComputerMap", toJson(reportService.generateComputerTotalMap()));
		model.addAttribute("totalBarcodeMap", toJson(reportService.selectEtcReportByType("Bar Code Reader")));
		model.addAttribute("totalProjectorMap", toJson(reportService.selectEtcReportByType("Projector")));
		model.addAttribute("totalMicrowaveMap", toJson(reportService.selectEtcReportByType("Microwave")));
		model.addAttribute("totalShrederMap", toJson(reportService.selectEtcReportByType("Shreder")));
		model.addAttribute("totalLaminatorMap", toJson(reportService.selectEtcReportByType("Laminator")));
		model.addAttribute("totalFaxMap", toJson(reportService.selectEtcReportByType("Fax")));
		model.addAttribute("totalEFTPOSMap", toJson(reportService.selectEtcReportByType("EFTPOS Machine")));
		model.addAttribute("totalStudentComSummary", toJson(reportService.calcurateAllStudentCompuersSummary()));
		System.out.println("JSON Loading Complete");
		return "index_rwd";
	}

	@RequestMapping("/create_view")
	public String createView(Model model) {
		return "create_view";
	}

	@RequestMapping("/create_computer")
	public ModelAndView createComputer(Model model, 
			@RequestParam("id") String id,
			@RequestParam("sn") String sn,
			@RequestParam("campus") String campus, 
			@RequestParam("location") String location,
			@RequestParam("name") String name, 
			@RequestParam("ip") String ip, 
			@RequestParam("type") String type,
			@RequestParam("domain") String domain, 
			@RequestParam("role") String role,
			@RequestParam("brand") String brand, 
			@RequestParam("comModel") String comModel,
			@RequestParam("serialNumber") String serialNumber, 
			@RequestParam("productNumber") String productNumber,
			@RequestParam("os") String os, 
			@RequestParam("license") String license,
			@RequestParam("machineOnly") String machineOnly, 
			@RequestParam("status") String status,
			@RequestParam("officeActive") String officeActive, 
			@RequestParam("bitDef") String bitDef,
			@RequestParam("cpu") String cpu, 
			@RequestParam("memory") String memory, 
			@RequestParam("bios") String bios,
			@RequestParam("purchaseDate") String purchaseDate, 
			@RequestParam("user") String user,
			@RequestParam("index") String index,
			@RequestParam("comment") String comment,
			@RequestParam("previous") String previous) {

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		String date = dateFormat.format(now);

		Computer computer = new Computer(id, sn, date, campus, location, name, ip, type, domain, role, brand, comModel,
				serialNumber);
		materialService.createComputer(computer);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/create_koiMaterial")
	public ModelAndView createKoiMaterial(Model model, 
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("campus") String campus,
			@RequestParam("location") String location, 
			@RequestParam("type") String type,
			@RequestParam("brand") String brand, 
			@RequestParam("user") String user,
			@RequestParam("index") String index,
			@RequestParam("comment") String comment,
			@RequestParam("status") String status) throws ParseException {
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		String today = dateFormat.format(now);
		String previous_new = "Brand New";
		Object koiMaterial = null;
		String sn = "New";
		
		if (type.equals("Desktop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createDesktop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop");
		} else if (type.equals("Laptop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createLaptop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop");
		} else if (type.equals("Monitor")) {
			koiMaterial = new Monitor(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createMonitor(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor");
		} else if (type.equals("iMac")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createMac("list_mac");
			model.addAttribute("objects", toJson(materialService.getMacList()));
			return new ModelAndView(redirectUrl);
		} else if (type.equals("Telephone")) {
			koiMaterial = new Telephone(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createTelephone(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone");
		} else if (type.equals("Printer")) {
			koiMaterial = new Printer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createPrinter(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer");
		} 
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/update_view_KoiMaterial")
	public String viewKoiMaterial(Model model, @RequestParam("id") String id, @RequestParam("type") String type) throws ParseException {
		System.out.println("Id : " + id);
		System.out.println("Type : " + type);
		Object koiMaterial = null;
		if (type.equals("Desktop")) {
			System.out.println("UPDATE TARGET : " + materialService.getDesktop(id));
			koiMaterial = materialService.getDesktop(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else if (type.equals("Laptop")) {
			System.out.println("UPDATE TARGET : " + materialService.getLaptop(id));
			koiMaterial = materialService.getLaptop(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else if (type.equals("Monitor")) {
			System.out.println("UPDATE TARGET : " + materialService.getMonitor(id));
			koiMaterial = materialService.getMonitor(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else if (type.equals("iMac")) {
			System.out.println("UPDATE TARGET : " + materialService.getMac(id));
			koiMaterial = materialService.getMac(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else if (type.equals("Telephone")) {
			System.out.println("UPDATE TARGET : " + materialService.getTelephone(id));
			koiMaterial = materialService.getTelephone(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else if (type.equals("Printer")) {
			System.out.println("UPDATE TARGET : " + materialService.getPrinter(id));
			koiMaterial = materialService.getPrinter(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} 
		return "update_view_general";
	}

	@RequestMapping("/update_broken")
	public ModelAndView update_broken(Model model, @RequestParam("id") String id) throws ParseException {
		Object computer = materialService.getComputer(id);
		model.addAttribute("computer", computer);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/update")
	public ModelAndView update(Model model, 
			@RequestParam("id") String id, 
			@RequestParam("id") String sn,
			@RequestParam("date") String date,
			@RequestParam("campus") String campus, 
			@RequestParam("location") String location,
			@RequestParam("name") String name, 
			@RequestParam("ip") String ip, 
			@RequestParam("type") String type,
			@RequestParam("domain") String domain, 
			@RequestParam("role") String role,
			@RequestParam("brand") String brand, 
			@RequestParam("comModel") String comModel,
			@RequestParam("serialNumber") String serialNumber, 
			@RequestParam("productNumber") String productNumber,
			@RequestParam("os") String os, 
			@RequestParam("license") String license,
			@RequestParam("machineOnly") String machineOnly, 
			@RequestParam("status") String status,
			@RequestParam("officeActive") String officeActive, 
			@RequestParam("bitDef") String bitDef,
			@RequestParam("cpu") String cpu, 
			@RequestParam("memory") String memory, 
			@RequestParam("bios") String bios,
			@RequestParam("purchaseDate") String purchaseDate, 
			@RequestParam("user") String user,
			@RequestParam("previous") String previous) throws ParseException {

		Computer computer = new Computer(id, sn, date, campus, location, name, ip, type, domain, role, brand, comModel,
				serialNumber);
		System.out.println("Update Cont" + computer);
		materialService.updateComputer(computer);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/updateGeneral")
	public ModelAndView updateGeneral(Model model, 
			@RequestParam("id") String id, 
			@RequestParam("sn") String sn,
			@RequestParam("campus") String campus,
			@RequestParam("name") String name,
			@RequestParam("location") String location, 
			@RequestParam("type") String type,
			@RequestParam("brand") String brand, 
			@RequestParam("user") String user,
			@RequestParam("index") String index,
			@RequestParam("comment") String comment,
			@RequestParam("status") String status,
			@RequestParam("previous") String previous) throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		String today = dateFormat.format(now);
		Object koiMaterial = null;
		System.out.println("UPDATE HIT!!!!");
		if (type.equals("Desktop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateDesktop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop");
		} else if (type.equals("Laptop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateLaptop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop");
		} else if (type.equals("Monitor")) {
			koiMaterial = new Monitor(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateMonitor(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor");
		} else if (type.equals("iMac")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateMac(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMacList()));
			return new ModelAndView(redirectUrl);
		} else if (type.equals("Telephone")) {
			koiMaterial = new Telephone(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateTelephone(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone");
		} else if (type.equals("Printer")) {
			koiMaterial = new Printer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updatePrinter(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer");
		} 
		return new ModelAndView(redirectUrl);
	}
	@RequestMapping("/deleteKoiMaterial")
	public ModelAndView deleteKoiMaterial(Model model, 
			@RequestHeader(value = "referer", required = false) final String referer, 
			@RequestParam("type") String type, 
			@RequestParam("id") String id) throws ParseException {
		String url = referer.replace("http://localhost:8080/OK_COMPUTER/", "");
		System.out.println("Re: " + url);
		if (type.equals("Desktop")) {
			materialService.deleteDesktop(id);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop");
		} else if (type.equals("Laptop")) {
			materialService.deleteLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop");
		} else if (type.equals("Monitor")) {
			materialService.deleteMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor");
		} else if (type.equals("iMac")) {
			materialService.deleteMac(id);
			model.addAttribute("objects", toJson(materialService.getMacList()));
			return new ModelAndView("list_mac");
		} else if (type.equals("Telephone")) {
			materialService.deleteTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone");
		} else if (type.equals("Printer")) {
			materialService.deletePrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer");
		}
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/delete_computer")
	public ModelAndView deleteComputer(Model model, @RequestParam("id") String id) throws ParseException {
		materialService.deleteComputer(id);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/delete_tv")
	public ModelAndView deleteTv(Model model, @RequestParam("id") String id) throws ParseException {
		materialService.deleteTv(id);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/swap")
	public ModelAndView swap(Model model, @RequestParam("id") String id, @RequestParam("nextId") String nextId)
			throws ParseException {
		Computer prev = (Computer) materialService.getComputer(id);
		Computer next = (Computer) materialService.getComputer(nextId);
		materialService.swap(prev, next);
		return new ModelAndView(redirectUrl);
	}

	@RequestMapping("/move")
	public ModelAndView move(Model model, @RequestParam("id") String id) throws ParseException {
		// materialService.move(computer);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/list_desktop")
	public String listDesktop(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getDesktopList()));
		return "list_desktop";
	}
	
	@RequestMapping("/list_laptop")
	public String listLaptop(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getLaptopList()));
		return "list_laptop";
	}
	
	@RequestMapping("/list_monitor")
	public String listMonitor(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getMonitorList()));
		return "list_monitor";
	}
	
	@RequestMapping("/list_mac")
	public String listMac(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getMacList()));
		return "list_mac";
	}
	@RequestMapping("/list_telephone")
	public String listTelephone(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getTelephoneList()));
		return "list_telephone";
	}
	@RequestMapping("/list_printer")
	public String listPrinter(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getPrinterList()));
		return "list_printer";
	}
	@RequestMapping("/list_itEtc")
	public String listItEtc(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getEtcItList()));
		return "list_itEtc";
	}
	@RequestMapping("/list_etc")
	public String listEtc(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getEtcList()));
		return "list_etc";
	}
	@RequestMapping("/makeBackupJsonFile")
	public String makeBackupJsonFile(Model model) throws ParseException, IOException {
		reportService.makeBackupJsonFile();
		model.addAttribute("desktopSnap", toJson(reportService.selectTotalDesktopReportSnap("19122017")));
		return "report_snapshots";
	}

	/**
	 * Serializes a Java object to a Json string.
	 *
	 * @param object
	 * @return
	 */
	public static String toJson(Object object) {

		ObjectMapper mapper = new ObjectMapper();
		String json = "{}";
		try {
			json = mapper.writeValueAsString(object);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json;
	}
}