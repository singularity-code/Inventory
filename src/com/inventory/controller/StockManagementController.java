package com.inventory.controller;

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

import com.inventory.dto.Computer;
import com.inventory.dto.KoiMaterial;
import com.inventory.dto.Monitor;
import com.inventory.dto.Printer;
import com.inventory.dto.Router;
import com.inventory.dto.Server;
import com.inventory.dto.Speaker;
import com.inventory.dto.Switch;
import com.inventory.dto.Tablet;
import com.inventory.dto.Telephone;
import com.inventory.service.MaterialReport;
import com.inventory.service.MaterialServiceInterface;

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
		model.addAttribute("totalTabletMap", toJson(reportService.selectEtcItReportByType("Tablet")));
		model.addAttribute("totalBarcodeMap", toJson(reportService.selectEtcReportByType("Bar Code Reader")));
		model.addAttribute("totalProjectorMap", toJson(reportService.selectEtcReportByType("Projector")));
		model.addAttribute("totalMicrowaveMap", toJson(reportService.selectEtcReportByType("Microwave")));
		model.addAttribute("totalShrederMap", toJson(reportService.selectEtcReportByType("Shreder")));
		model.addAttribute("totalLaminatorMap", toJson(reportService.selectEtcReportByType("Laminator")));
		model.addAttribute("totalFaxMap", toJson(reportService.selectEtcReportByType("Fax")));
		model.addAttribute("totalEFTPOSMap", toJson(reportService.selectEtcReportByType("EFTPOS Machine")));
		model.addAttribute("totalDSLRMap", toJson(reportService.selectEtcReportByType("DSLR")));
		model.addAttribute("totalStudentComSummary", toJson(reportService.calcurateAllStudentCompuersSummary()));
		
		model.addAttribute("totalAvailableComputers", toJson(reportService.getListTotalAvailableComputers()));
		model.addAttribute("duplicatedId", reportService.selectDuplicatedId());
		return "index_rwd";
	}
	
	@RequestMapping("/list_all")
	public String listAll(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getAllList()));
		return "list_all_rwd";
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
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createLaptop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			koiMaterial = new Monitor(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createMonitor(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("Telephone")) {
			koiMaterial = new Telephone(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createTelephone(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			koiMaterial = new Printer(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createPrinter(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		} else if (type.equals("Switch")) {
			koiMaterial = new Switch(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createSwitch(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else if (type.equals("Router")) {
			koiMaterial = new Router(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createRouter(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else if (type.equals("Speaker")) {
			koiMaterial = new Speaker(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createSpeaker(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else if (type.equals("Tablet")) {
			koiMaterial = new Tablet(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createTablet(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else if (type.equals("Server")) {
			koiMaterial = new Server(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createServer(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else if (type.equals("UPS")) {
			koiMaterial = new Server(index, sn, id, name, type, brand, user, previous_new, campus, location, today, status, comment);
			materialService.createServer(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
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
		} else if (type.equalsIgnoreCase("Switch") 
				|| type.equalsIgnoreCase("Router") 
				|| type.equalsIgnoreCase("Speaker")
				|| type.equalsIgnoreCase("Tablet")
				|| type.equalsIgnoreCase("Server")) {
			koiMaterial = materialService.getEtcItItem(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		} else {
			koiMaterial = materialService.getEtcItem(id);
			model.addAttribute("koiMaterial", koiMaterial);
			return "update_view_general";
		}
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
		if (type.equals("Desktop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateDesktop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateLaptop(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			koiMaterial = new Monitor(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateMonitor(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("iMac")) {
			koiMaterial = new Computer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateMac(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getMacList()));
			return new ModelAndView("list_mac_rwd");
		} else if (type.equals("Telephone")) {
			koiMaterial = new Telephone(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateTelephone(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			koiMaterial = new Printer(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updatePrinter(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		} else if (type.equalsIgnoreCase("Switch") 
				|| type.equalsIgnoreCase("Router") 
				|| type.equalsIgnoreCase("Speaker")
				|| type.equalsIgnoreCase("Tablet")
				|| type.equalsIgnoreCase("Server")) {
			koiMaterial = new KoiMaterial(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateEtcItItem(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcItList()));
			return new ModelAndView("list_itEtc_rwd");
		} else {
			koiMaterial = new KoiMaterial(index, sn, id, name, type, brand, user, previous, campus, location, today, status, comment);
			materialService.updateEtcItem(koiMaterial);
			model.addAttribute("objects", toJson(materialService.getEtcList()));
			return new ModelAndView("list_etc_rwd");
		}
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
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			materialService.deleteLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			materialService.deleteMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("iMac")) {
			materialService.deleteMac(id);
			model.addAttribute("objects", toJson(materialService.getMacList()));
			return new ModelAndView("list_mac_rwd");
		} else if (type.equals("Telephone")) {
			materialService.deleteTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			materialService.deletePrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		}
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/chgStatToOk")
	public ModelAndView chgStatToOk(Model model, 
			@RequestHeader(value = "referer", required = false) final String referer, 
			@RequestParam("type") String type, 
			@RequestParam("id") String id) throws ParseException {
		String url = referer.replace("http://localhost:8080/OK_COMPUTER/", "");
		System.out.println("Re: " + url);
		if (type.equals("Desktop")) {
			materialService.chgStatToOkDesktop(id);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			materialService.chgStatToOkLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			materialService.chgStatToOkMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("Telephone")) {
			materialService.chgStatToOkTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			materialService.chgStatToOkPrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		}
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/chgStatToNotUsing")
	public ModelAndView chgStatToNotUsing(Model model, 
			@RequestHeader(value = "referer", required = false) final String referer, 
			@RequestParam("type") String type, 
			@RequestParam("id") String id) throws ParseException {
		String url = referer.replace("http://localhost:8080/OK_COMPUTER/", "");
		System.out.println("Re: " + url);
		if (type.equals("Desktop")) {
			materialService.chgStatToNotUsingDesktop(id);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			materialService.chgStatToNotUsingLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			materialService.chgStatToNotUsingMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("Telephone")) {
			materialService.chgStatToNotUsingTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			materialService.chgStatToNotUsingPrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		}
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/chgStatToBroken")
	public ModelAndView chgStatToBroken(Model model, 
			@RequestHeader(value = "referer", required = false) final String referer, 
			@RequestParam("type") String type, 
			@RequestParam("id") String id) throws ParseException {
		String url = referer.replace("http://localhost:8080/OK_COMPUTER/", "");
		System.out.println("Re: " + url);
		if (type.equals("Desktop")) {
			materialService.chgStatToBrokenDesktop(id);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			materialService.chgStatToBrokenLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			materialService.chgStatToBrokenMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("Telephone")) {
			materialService.chgStatToBrokenTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			materialService.chgStatToBrokenPrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
		}
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/chgStatToDiscard")
	public ModelAndView chgStatToDiscard(Model model, 
			@RequestHeader(value = "referer", required = false) final String referer, 
			@RequestParam("type") String type, 
			@RequestParam("id") String id) throws ParseException {
		String url = referer.replace("http://localhost:8080/OK_COMPUTER/", "");
		System.out.println("Re: " + url);
		if (type.equals("Desktop")) {
			materialService.chgStatToDiscardDesktop(id);
			model.addAttribute("objects", toJson(materialService.getDesktopList()));
			return new ModelAndView("list_desktop_rwd");
		} else if (type.equals("Laptop")) {
			materialService.chgStatToDiscardLaptop(id);
			model.addAttribute("objects", toJson(materialService.getLaptopList()));
			return new ModelAndView("list_laptop_rwd");
		} else if (type.equals("Monitor")) {
			materialService.chgStatToDiscardMonitor(id);
			model.addAttribute("objects", toJson(materialService.getMonitorList()));
			return new ModelAndView("list_monitor_rwd");
		} else if (type.equals("Telephone")) {
			materialService.chgStatToDiscardTelephone(id);
			model.addAttribute("objects", toJson(materialService.getTelephoneList()));
			return new ModelAndView("list_telephone_rwd");
		} else if (type.equals("Printer")) {
			materialService.chgStatToDiscardPrinter(id);
			model.addAttribute("objects", toJson(materialService.getPrinterList()));
			return new ModelAndView("list_printer_rwd");
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
		return "list_desktop_rwd";
	}
	
	@RequestMapping("/list_laptop")
	public String listLaptop(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getLaptopList()));
		return "list_laptop_rwd";
	}
	
	@RequestMapping("/list_monitor")
	public String listMonitor(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getMonitorList()));
		return "list_monitor_rwd";
	}
	
	@RequestMapping("/list_mac")
	public String listMac(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getMacList()));
		return "list_mac_rwd";
	}
	@RequestMapping("/list_telephone")
	public String listTelephone(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getTelephoneList()));
		return "list_telephone_rwd";
	}
	@RequestMapping("/list_printer")
	public String listPrinter(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getPrinterList()));
		return "list_printer_rwd";
	}
	@RequestMapping("/list_itEtc")
	public String listItEtc(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getEtcItList()));
		return "list_itEtc_rwd";
	}
	@RequestMapping("/list_etc")
	public String listEtc(Model model) throws ParseException {
		model.addAttribute("objects", toJson(materialService.getEtcList()));
		return "list_etc_rwd";
	}
	@RequestMapping("/makeBackupJsonFile")
	public ModelAndView makeBackupJsonFile(Model model) throws ParseException, IOException {
		reportService.makeBackupJsonFile();
		DateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
		Date now = Calendar.getInstance().getTime();
		@SuppressWarnings("unused") String today = dateFormat.format(now);
		//model.addAttribute("desktopSnap", toJson(reportService.selectTotalDesktopReportSnap(today)));
		return new ModelAndView(redirectUrl);
	}
	@RequestMapping("/barcodes")
	public String barcodes(Model model) throws ParseException, IOException {
		model.addAttribute("objects", toJson(materialService.getLaptopList()));
		return "barcodes";
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