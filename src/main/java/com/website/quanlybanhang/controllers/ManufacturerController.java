package com.website.quanlybanhang.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Manufacturer;
import com.website.quanlybanhang.service.ManufacturerService;

@Controller
@RequestMapping(value = "/admin/quanlynhasanxuat")
public class ManufacturerController {

	@Autowired
	private ManufacturerService manufacturerService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getManufacture(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.addObject("manufacturer", manufacturerService.getManufacturerPagingAndSorting(page, size, "maNSX"));
		model.setViewName("manufacture-manufacture");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/{maNSX}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getNhaSanXuat(@PathVariable("maNSX") Long maNSX, @RequestParam("mode") String mode,
			ModelAndView model) {
		Manufacturer manufacturer = manufacturerService.getManufacturer(maNSX);
		if (mode.equals("EDIT")) {
			model.setViewName("manufacture-capnhatnhasanxuat");
		} else {
			model.setViewName("manufacture-chitietnhasanxuat");
		}
		model.addObject("manufacturer", manufacturer);
		return model;
	}

	@RequestMapping(value = "/themnhasanxuat", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView themNhaSanXuat(ModelAndView model) {
		model.setViewName("manufacture-themnhasanxuat");
		Manufacturer manufacturer = new Manufacturer();
		model.addObject("manufacturer", manufacturer);
		return model;
	}

	@RequestMapping(value = "/capnhatnhasanxuat", method = RequestMethod.POST)
	public String capnhatNhaSanXuat(@ModelAttribute("manufacturer") Manufacturer manufacturer) {
		if (manufacturer.getMaNSX() == null) {
			manufacturerService.add(manufacturer);
		} else {
			if (manufacturer.getTenNSX().isEmpty()) {
				return "manufacture-capnhatnhasanxuat";
			}
			manufacturerService.update(manufacturer);
		}

		return "redirect:/admin/quanlynhasanxuat/";
	}

	@RequestMapping(value = "/xoanhasanxuat/{maNSX}", method = RequestMethod.GET)
	public String xoaNhaSanXuat(@PathVariable("maNSX") Long maNSX) {
		manufacturerService.delete(maNSX);
		return "redirect:/admin/quanlynhasanxuat/";
	}

	@RequestMapping(value = "/timkiemnhasanxuat", method = RequestMethod.POST)
	public ModelAndView searchNhaSanXuat(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<Manufacturer> list = manufacturerService.getSearchManufacturer(search);
		if (list.size() > 0) {
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("Kết quả tìm kiếm cho " + search).append(":" + "\t")
					.append(list.size() + "\t" + "kết quả");
			model.addObject("message", stringBuilder.toString());
			model.addObject("manufacturers", list);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.setViewName("manufacture-timkiemnhasanxuat");
		return model;
	}

}
