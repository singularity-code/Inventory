package com.dongyeop.okcomputer.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.dongyeop.okcomputer.dto.Tv;
import com.dongyeop.okcomputer.service.MaterialServiceInterface;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dongyeop.okcomputer.dto.Computer;
import com.dongyeop.okcomputer.service.GenericComputerService;

@Controller
public class StockManagementController {
	
	String redirectUrl = "redirect:/";
	
	// StockService is defined in Bean Config
	@Autowired
	private GenericComputerService computerService;
	@Autowired
	private MaterialServiceInterface materialService;

	@RequestMapping("/auth")
	public String auth(Model model) {
		return "auth";
	}
	
	@RequestMapping("/")
	public String getLists(Model model) throws ParseException {
		model.addAttribute("computers", toJson(materialService.getComputerList()));
		model.addAttribute("garage", toJson(computerService.getGarageLists()));
		model.addAttribute("tvs", toJson(materialService.getTvList()));
		System.out.println("JSON LOADED");
		return "index_computer";
	}
	
	@RequestMapping("/create_view")
	public String createView(Model model) {
		return "create_view";
	}
	
	@RequestMapping("/create_computer")
	public ModelAndView createComputer(Model model,
						@RequestParam("id") String id,
						@RequestParam("campus") String campus,
						@RequestParam("location") String location,
						@RequestParam("name") String name,
						@RequestParam("ip") String ip,
						@RequestParam("type") String type,
						@RequestParam("domain")String domain,
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
						@RequestParam("previous") String previous) {
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		String date = dateFormat.format(now);
		
		Computer computer = new Computer(id, date, campus, location, name, ip, type,  domain, role, brand, comModel, serialNumber, productNumber, os,
				 license, machineOnly, status, officeActive, bitDef,  cpu, memory, bios,  purchaseDate, user, previous);
		computerService.create(computer);
		return new ModelAndView(redirectUrl);
	}
	@RequestMapping("/create_tv")
	public ModelAndView createTv(Model model,
							@RequestParam("id") String id,
							@RequestParam("campus") String campus,
							@RequestParam("location") String location,
							@RequestParam("type") String type,
							@RequestParam("brand") String brand,
							@RequestParam("brand") String user,
							@RequestParam("brand") String previous,
							@RequestParam("previous") String comment) {

		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = Calendar.getInstance().getTime();
		String date = dateFormat.format(now);

		Tv tv = new Tv(id, type, brand, user, previous, campus, location, comment, date);
		//materialService.createTv(tv);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/update_view")
	public String view(Model model, @RequestParam("id") String id) throws ParseException {
		Object computer = computerService.getComputer(id);
		model.addAttribute("computer", computer);
		return "update_view";
	}
	
	@RequestMapping("/update_broken")
	public ModelAndView update_broken(Model model, @RequestParam("id") String id) throws ParseException {
		Object computer = computerService.getComputer(id);
		model.addAttribute("computer", computer);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/update")
	public ModelAndView update(Model model,
			@RequestParam("id") String id,
			@RequestParam("date") String date,
			@RequestParam("campus") String campus,
			@RequestParam("location") String location,
			@RequestParam("name") String name,
			@RequestParam("ip") String ip,
			@RequestParam("type") String type,
			@RequestParam("domain")String domain,
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

		Computer computer = new Computer(id, date, campus, location, name, ip, type,  domain, role, brand, comModel, serialNumber, productNumber, os,
				 license, machineOnly, status, officeActive, bitDef,  cpu, memory, bios,  purchaseDate, user, previous);		
		System.out.println(computer);
		computerService.update(computer);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(Model model, @RequestParam("id") String id) throws ParseException {
		computerService.delete(id);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/swap")
	public ModelAndView swap(Model model, 
							@RequestParam("id") String id,
							@RequestParam("nextId") String nextId) throws ParseException {
		Computer computer = (Computer) computerService.getComputer(id);
		Computer nextCom = (Computer) computerService.getComputer(nextId);
		computerService.swap(computer, nextCom);
		return new ModelAndView(redirectUrl);
	}
	
	@RequestMapping("/move")
	public ModelAndView move(Model model, @RequestParam("id") String id) throws ParseException {
		Computer computer = (Computer) computerService.getComputer(id);
		computerService.move(computer);
		return new ModelAndView(redirectUrl);
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