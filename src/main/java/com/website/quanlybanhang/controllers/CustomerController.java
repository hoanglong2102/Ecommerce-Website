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

import com.website.quanlybanhang.entities.Customer;
import com.website.quanlybanhang.service.impl.CustomerServiceImpl;

@Controller
@RequestMapping(value = "/admin/customer")
public class CustomerController {

	@Autowired
	private CustomerServiceImpl customerService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getCustomer(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.addObject("customers", customerService.getCustomerPagingAndSorting(page, size, "id"));
		model.setViewName("customer-customers");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.GET)
	public ModelAndView addCustomer(ModelAndView model, @RequestParam String mode) {
		model.setViewName("customer-customerDetail");
		model.addObject("mode", mode);
		model.addObject("customer", new Customer());

		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {
		if (customer.getId() == null) {
			customerService.add(customer);
		} else {
			customerService.update(customer);
		}
		return "redirect:/admin/customer/";
	}

	@RequestMapping(value = "/getCustomer/{customerId}", method = RequestMethod.GET)
	public ModelAndView getCustomer(@PathVariable("customerId") Long id, @RequestParam String mode,
			ModelAndView model) {
		model.setViewName("customer-customerDetail");
		Customer customer = customerService.getCustomer(id);
		model.addObject("mode", mode);
		model.addObject("customer", customer);
		return model;
	}

	@RequestMapping(value = "/deleteCustomer/{id}", method = RequestMethod.GET)
	public String deleteCustomer(@PathVariable Long id) {
		customerService.delete(id);
		return "redirect:/admin/customer/";
	}

	@RequestMapping(value = "/viewsCustomer/{customerId}", method = RequestMethod.GET)
	public ModelAndView viewsCustomer(@PathVariable("customerId") Long id, ModelAndView model) {
		model.setViewName("customer-customerViews");
		Customer customers = customerService.getCustomer(id);
		model.addObject("customers", customers);

		return model;
	}

	@RequestMapping(value = "/timkiemcustomer", method = RequestMethod.POST)
	public ModelAndView timkiemCustomer(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<Customer> list = customerService.getTimKiemCustomer(search);
		if (list.size() > 0) {
			model.addObject("customers", list);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.setViewName("customer-timkiemcustomer");
		return model;
	}

}
