package com.website.quanlybanhang.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Danhmuc;
import com.website.quanlybanhang.entities.Manufacturer;
import com.website.quanlybanhang.entities.Sanpham;
import com.website.quanlybanhang.service.DanhmucService;
import com.website.quanlybanhang.service.ManufacturerService;
import com.website.quanlybanhang.service.SanphamService;
import com.website.quanlybanhang.service.impl.SanphamServiceImpl;

@Controller
public class HomeController {

	@Autowired
	private SanphamService productService;

	@Autowired
	private DanhmucService danhMucService;

	@Autowired
	private ManufacturerService manufacturerService;

	@Autowired
	private SanphamServiceImpl sanphamServiceImpl;
	
	
	
	
	private Map<String, String> map = new HashMap<>();
	
	

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "6") Integer size) {

		ModelAndView model = new ModelAndView();
		model.addObject("products", productService.getSanphamPagingAndSorting(page, size, "masp"));
		model.addObject("currentPage", page);
		List<Danhmuc> categories = this.danhMucService.getAll();
		List<Manufacturer> manufacturers = this.manufacturerService.getAll();
		request.getSession().setAttribute("danhmuc", categories);
		request.getSession().setAttribute("manufacturer", manufacturers);
		model.setViewName("shop-home");
		return model;
	}

	@RequestMapping(value = "/thongtinchitietsanpham/{masp}", method = RequestMethod.GET)
	public ModelAndView thongtinchitietsanpham(@PathVariable("masp") Long masp, ModelAndView model) {
		Sanpham sanpham = productService.getSanpham(masp);
		model.addObject("sanpham", sanpham);
		model.setViewName("shop-chitietsanpham");
		return model;
	}

	@RequestMapping(value = { "/listAllProductByManufacturers/{maNSX}" }, method = RequestMethod.GET)
	public ModelAndView hienThiSannPhamTheoNhaSanXuat(@PathVariable("maNSX") Long maNSX, HttpServletRequest request,
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "6") Integer pagesize) {
		ModelAndView model = new ModelAndView();
		List<Manufacturer> manufacturers = this.manufacturerService.getAll();
		request.getSession().setAttribute("manufacturer", manufacturers);
		model.addObject("currentPage", page);
		model.addObject("products", productService.getSanphamTheoNSX(maNSX, page, pagesize, "masp"));
		model.setViewName("shop-home");
		return model;
	}
	
	
	@RequestMapping(value = {"/listAllProductByCategory/{madm}"} ,method = RequestMethod.GET)
	public ModelAndView hienthisanphamtheodanhmuc(@PathVariable("madm") Long madm, HttpServletRequest request,@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "6") Integer pagesize) {
			ModelAndView model = new ModelAndView();
			List<Danhmuc> categories = this.danhMucService.getAll();
			request.getSession().setAttribute("danhmuc", categories);
			model.addObject("products",productService.getSanphamTheoDanhMuc(madm, page, pagesize, "masp"));
			model.addObject("currentPage", page);
			model.setViewName("shop-home");
			return model;
		}

		
		
	@RequestMapping(value = { "/shop/search" }, method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String search  ,@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "6") Integer size) {
		
		boolean kq = false;
		ModelAndView model = new ModelAndView();
		List<Sanpham> list = sanphamServiceImpl.ketquatimkiem(search);
		Page<Sanpham> products = sanphamServiceImpl.gettimkiemsanpham(search, page, size, "tensp");
		if (list.size() > 0) {
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("Kết quả tìm kiếm cho " + search).append(":" + "\t")
					.append(list.size() + "\t" + "kết quả");
			model.addObject("currentPage", page);
			model.addObject("message", stringBuilder.toString());
			model.addObject("products", products);
			kq = true;
		}
	    map.put("search", search);
	    model.addObject("kq", kq);
		model.setViewName("shop-timkiemsanpham");
		return model;
		
	}
	@RequestMapping(value = { "/shop/search" }, method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "6") Integer size) 
	{	
	    return search(map.get("search"), page, size);
	}

	@RequestMapping(value = { "/shop/about" }, method = RequestMethod.GET)
	public ModelAndView about() {
		ModelAndView model = new ModelAndView();
		model.setViewName("shop-about");
		return model;
	}

	@RequestMapping(value = { "/shop/contact" }, method = RequestMethod.GET)
	public ModelAndView contact() {
		ModelAndView model = new ModelAndView();
		model.setViewName("shop-contact");
		return model;
	}

}
