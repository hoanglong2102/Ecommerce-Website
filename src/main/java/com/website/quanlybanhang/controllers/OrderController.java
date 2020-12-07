package com.website.quanlybanhang.controllers;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Order;
import com.website.quanlybanhang.entities.OrderDetail;
import com.website.quanlybanhang.entities.User;
import com.website.quanlybanhang.service.OrderDetailService;
import com.website.quanlybanhang.service.OrderService;
import com.website.quanlybanhang.service.impl.OrderServiceImpl;

@Controller
@RequestMapping(value = "/admin/order")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping(name = "/", method = RequestMethod.GET)
	public ModelAndView getOrder(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.addObject("orders", orderService.getOrderPagingAndSorting(page, size, "id"));
		model.setViewName("order-orders");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/deleteOrder/{id}", method = RequestMethod.GET)
	public String deleteOrder(@PathVariable Long id) {
		orderService.delete(id);
		return "redirect:/admin/order/";
	}

	@RequestMapping(value = "/viewsOrderDetail/{orderId}", method = RequestMethod.GET)
	public ModelAndView getOrder(@PathVariable("orderId") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {
		model.setViewName("order-orderDetail");
		// OrderDetail orderDetail = this.orderDetailService.getOrderDetail(id);
		Order order = orderService.getOrder(id);
		List<OrderDetail> orderDetailList = orderService.listOrderDetailInfos(id);
		model.addObject("order", order);
		model.addObject("orderDetailList", orderDetailList);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveOrder(@ModelAttribute("order") Order order) {
		orderService.update(order);
		return "redirect:/admin/order/";
	}

	@RequestMapping(value = "/orderdetailupdate/{orderId}", method = RequestMethod.GET)
	public ModelAndView updateOrder(@PathVariable("orderId") Long id, @RequestParam String mode, ModelAndView model) {
		model.setViewName("order-orderdetailupdate");
		Order order = orderService.getOrder(id);
		model.addObject("mode", mode);
		model.addObject("order", order);
		return model;
	}

	@RequestMapping(value="/searchByFromDateAndToDate", method=  RequestMethod.POST)
	public ModelAndView search(@RequestParam("fromDate") Date fromDate,@RequestParam("toDate") Date toDate ) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByFromDateAndToDate(fromDate, toDate);
		model.addObject("orders",orders);
		
		model.addObject("size",orders.size());
		model.addObject("fromDate",fromDate);
		model.addObject("toDate",toDate);
		model.setViewName("order-searchOrder");
		return model;
	}
	
	@RequestMapping(value="/searchOrderByHour", method=  RequestMethod.POST)
	public ModelAndView searchOrderByHour(@RequestParam("fromHour") int fromHour,@RequestParam("fromMinute") int fromMinute,@RequestParam("toHour") int toHour, @RequestParam("toMinute") int toMinute) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByHoursAndMinute(fromHour, fromMinute, toHour, toMinute);
		model.addObject("orders",orders);
		
		model.addObject("size",orders.size());
		model.setViewName("order-searchOrder");
		return model;
	}
	
	@RequestMapping(value="/searchByFromDateAndTimeToDateAndTime", method=  RequestMethod.POST)
	public ModelAndView searchByFromDateAndTimeToDateAndTime(@RequestParam("fromDate") Date fromDate,@RequestParam("fromHour") int fromHour,@RequestParam("fromMinute") int fromMinute,@RequestParam("toDate") Date toDate,@RequestParam("toHour") int toHour, @RequestParam("toMinute") int toMinute ) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByFromDateAndTimeToDateAndTime(fromDate, fromHour, fromMinute, toDate, toHour, toMinute);
		model.addObject("orders",orders);
		
		model.addObject("size",orders.size());
		model.addObject("fromDate",fromDate);
		model.addObject("toDate",toDate);
		model.setViewName("order-searchOrder");
		return model;
	}
	
	@RequestMapping(value="/searchOrderByDatesAndTime", method=  RequestMethod.POST)
	public ModelAndView searchByDateAndTime(@RequestParam("Date") Date Date,@RequestParam("Hour") int Hour,@RequestParam("Minute") int Minute) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByDateAndTime(Date, Hour, Minute);
		model.addObject("orders",orders);
		model.addObject("size",orders.size());
		model.addObject("Hour",Hour);
		model.addObject("Minute",Minute);
		model.addObject("Date",Date);
		model.setViewName("order-searchOrderByDatesAndTime");
		return model;
	}

}
