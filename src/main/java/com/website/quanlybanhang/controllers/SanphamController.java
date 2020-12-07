package com.website.quanlybanhang.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.website.quanlybanhang.entities.Manufacturer;
import com.website.quanlybanhang.entities.Sanpham;
import com.website.quanlybanhang.service.ImageService;
import com.website.quanlybanhang.service.ManufacturerService;
import com.website.quanlybanhang.service.impl.DanhmucServiceImpl;
import com.website.quanlybanhang.service.impl.SanphamServiceImpl;

@Controller
@RequestMapping(value = "/admin/quanlysanpham")
public class SanphamController {

	@Autowired
	private ImageService imageService;

	@Autowired
	private SanphamServiceImpl sanphamService;

	@Autowired
	private DanhmucServiceImpl danhmucServiceImpl;

	@Autowired
	private ManufacturerService manufacturerService;
	
	
	private Map<String, String> map = new HashMap<>();
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getSanpham(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {

		model.addObject("sanpham", sanphamService.getSanphamPagingAndSorting(page, size, "masp"));
		model.setViewName("sanpham-sanpham");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/timkiemsanpham", method = RequestMethod.POST)
	public ModelAndView timkiemsanpham(@RequestParam String search, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		boolean kq = false;
		ModelAndView model = new ModelAndView();
		List<Sanpham> list = sanphamService.ketquatimkiem(search);
		Page<Sanpham> pagesanpham = sanphamService.gettimkiemsanpham(search, page, size, "tensp");
		if (list.size() > 0) {
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("Kết quả tìm kiếm cho " + search).append(":" + "\t")
					.append(list.size() + "\t" + "kết quả");
			model.addObject("message", stringBuilder.toString());
			model.addObject("currentPage", page);
			model.addObject("sanpham", pagesanpham);
			kq = true;
		}
		map.put("search", search);
		model.addObject("ketqua", kq);
		model.setViewName("sanpham-timkiemsanpham");
		return model;
	}
	@RequestMapping(value = "/timkiemsanpham", method = RequestMethod.GET)
	public ModelAndView timkiemsanpham(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {	
		return timkiemsanpham(map.get("search"), page, size);
	}

	@RequestMapping(value = "/{masp}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getSanpham(@PathVariable("masp") Long masp, @RequestParam String mode, ModelAndView model) {
		Sanpham sp = sanphamService.getSanpham(masp);
		if (mode.equals("EDIT")) {
			model.addObject("dsdm", danhmucServiceImpl.getAll());

			model.setViewName("sanpham-capnhatsanpham");
		} else {
			model.setViewName("sanpham-chitietsanpham");
		}
		List<Manufacturer> listManufacturers = manufacturerService.getAll();
		model.addObject("manufacturers", listManufacturers);
		model.addObject("sanpham", sp);
		return model;
	}

	@RequestMapping(value = "/capnhatsanpham", method = RequestMethod.POST)
	public String capnhatSanpham(@ModelAttribute("sanpham") Sanpham sanpham, HttpServletRequest request) {
		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, sanpham.getImageFile());
		

		List<Long> listdanhmucId = sanpham.getDanhmucID();
		List<Danhmuc> listdm = new ArrayList<Danhmuc>();
		for (Long danhmucId : listdanhmucId) {
			Danhmuc dm = this.danhmucServiceImpl.getDanhmuc(danhmucId);
			listdm.add(dm);
		}
		if (listdm.size() > 0) {
			sanpham.setDanhmuc(listdm);
		}
		if (sanpham.getMasp() == null) 
		{
			request.getSession().setAttribute("manufacturers", manufacturerService.getAll());
			request.getSession().setAttribute("dsdm", danhmucServiceImpl.getAll());
			sanpham.setHinhanhsp(imageName);
			sanphamService.add(sanpham);
		} 
		else 
		{
			Sanpham sp = sanphamService.getSanpham(sanpham.getMasp());
			sanpham.setHinhanhsp(sp.getHinhanhsp());
			request.getSession().setAttribute("manufacturers", manufacturerService.getAll());
			request.getSession().setAttribute("dsdm", danhmucServiceImpl.getAll());
			request.getSession().setAttribute("sanpham", sanpham);
			if (imageName != null && !imageName.isEmpty()) {
				sanpham.setHinhanhsp(imageName);
			}
			sanphamService.update(sanpham);
		}
		return "redirect:/admin/quanlysanpham/";
	}

	@RequestMapping(value = "/xoasanpham/{masp}", method = RequestMethod.GET)
	public String xoaSanpham(@PathVariable("masp") Long masp) {
		sanphamService.delete(masp);
		return "redirect:/admin/quanlysanpham/";
	}

	@RequestMapping(value = "/themsanpham", method = RequestMethod.GET)
	public ModelAndView themSanpham(ModelAndView model) {
		Sanpham sanpham = new Sanpham();
		sanpham.setGiacu(0);
		sanpham.setGiamgia(0L);
		sanpham.setSoluong(0);
		model.addObject("dsdm", danhmucServiceImpl.getAll());
		model.addObject("sanpham", sanpham);
		List<Manufacturer> listManufacturers = manufacturerService.getAll();
		model.addObject("manufacturers", listManufacturers);
		model.setViewName("sanpham-themsanpham");
		return model;
	}

}
