package com.website.quanlybanhang.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Danhmuc;
import com.website.quanlybanhang.service.impl.DanhmucServiceImpl;

@Controller
@RequestMapping(value = "/admin/quanlydanhmuc")
public class DanhmucController {

	@Autowired
	private DanhmucServiceImpl danhmucService;
	
	
	private Map<String, String> map = new HashMap<>();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getDanhmuc(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.addObject("danhmuc", danhmucService.getDanhMucPagingAndSorting(page, size, "madm"));
		model.setViewName("danhmuc-danhmuc");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/{madm}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getDanhmuc(@PathVariable("madm") Long madm, @RequestParam("mode") String mode,
			ModelAndView model) {
		Danhmuc dm = danhmucService.getDanhmuc(madm);
		if (mode.equals("EDIT")) {
			model.setViewName("danhmuc-capnhatdanhmuc");
		} else {
			model.setViewName("danhmuc-chitietdanhmuc");
		}
		model.addObject("danhmuc", dm);
		return model;
	}

	@RequestMapping(value = "/themdanhmuc", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView themDanhmuc(ModelAndView model) {
		model.setViewName("danhmuc-themdanhmuc");
		Danhmuc dm = new Danhmuc();
		model.addObject("danhmuc", dm);
		return model;
	}

	@RequestMapping(value = "/capnhatdanhmuc", method = RequestMethod.POST)
	public String capnhatDanhmuc(@ModelAttribute("danhmuc") Danhmuc danhmuc) {
		if (danhmuc.getMadm() == null) 
		{
			danhmucService.add(danhmuc);
		} 
		else 
		{
			danhmucService.update(danhmuc);
		}

		return "redirect:/admin/quanlydanhmuc/";
	}

	@RequestMapping(value = "/xoadanhmuc/{madm}", method = RequestMethod.GET)
	public String xoaDanhmuc(@PathVariable("madm") Long madm) {
		danhmucService.delete(madm);
		return "redirect:/admin/quanlydanhmuc/";
	}

	@RequestMapping(value = "/timkiemdanhmuc", method = RequestMethod.POST)
	public ModelAndView timkiemdanhmuc(@RequestParam String search, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		boolean kq = false;
		ModelAndView model = new ModelAndView();
		List<Danhmuc> list = danhmucService.gettimkiemdanhmuc(search);
		Page<Danhmuc> pagesanpham = danhmucService.gettimkiemdanhmuc(search,page,size,"tendm");
		if (list.size() > 0) {
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("Kết quả tìm kiếm cho " + search)
			.append(":"+"\t")
			.append(list.size() +"\t"+"kết quả");
			model.addObject("message", stringBuilder.toString());
			model.addObject("currentPage", page);
			model.addObject("danhmucs", pagesanpham);
			kq = true;
		}
		map.put("search", search);
		model.addObject("ketqua", kq);
		model.setViewName("danhmuc-timkiemdanhmuc");
		return model;
	}
	@RequestMapping(value = "/timkiemdanhmuc", method = RequestMethod.GET)
	public ModelAndView timkiemsanpham(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		return timkiemdanhmuc(map.get("search"), page, size);
	}

}
