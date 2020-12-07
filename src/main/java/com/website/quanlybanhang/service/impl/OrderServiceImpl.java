package com.website.quanlybanhang.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Customer;
import com.website.quanlybanhang.entities.Order;
import com.website.quanlybanhang.entities.OrderDetail;
import com.website.quanlybanhang.entities.Sanpham;
import com.website.quanlybanhang.model.CartInfo;
import com.website.quanlybanhang.model.CartLineInfo;
import com.website.quanlybanhang.model.CustomerInfo;
import com.website.quanlybanhang.repository.CustomerRepository;
import com.website.quanlybanhang.repository.OrderDetailRepository;
import com.website.quanlybanhang.repository.OrderPagingAndSortingRepository;
import com.website.quanlybanhang.repository.OrderRepository;
import com.website.quanlybanhang.service.OrderService;
import com.website.quanlybanhang.service.SanphamService;

@Transactional
@Service

public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderDetailRepository orderdetailRepository;

	@Autowired
	private OrderPagingAndSortingRepository orderPageSort;

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Autowired
	private SanphamService sanphamService;

	public Order getOrder(Long id) {
		return this.orderRepository.getOne(id);

	}

	public List<Order> getAll() {

		return this.orderRepository.findAll();
	}

	public Order update(Order order) {
		return this.orderRepository.save(order);
	}

	public void delete(Long id) {
		Order order = this.orderRepository.getOne(id);
		orderRepository.delete(order);
	}

	public void delete(Order order) {
		orderRepository.delete(order);
	}

	@Override
	public List<OrderDetail> listOrderDetailInfos(Long orderId) {
		return this.orderdetailRepository.findOrderDetails(orderId);
	}

	public Order addOrder(CartInfo cartInfo) {
		Order order = new Order();
		CustomerInfo customerInfo = cartInfo.getCustomerInfo();
		String getNumberPhone = customerInfo.getNumberPhone();
		// customer.setNumberPhone(customerInfo.getNumberPhone());
		// customer.setAddress((customerInfo.); // chuyen het column ben address entity
		// qua Customer entity

		Customer customerPhone = customerRepository.findByNumberPhone(getNumberPhone);
		Customer customer = null;
		if (customerPhone != null) {
			customer = customerPhone;
		} else {
			customer = new Customer();

			customer.setFirstName(customerInfo.getFirstName());
			customer.setLastName(customerInfo.getLastName());
			customer.setStreet(customerInfo.getStreet());
			customer.setDistrict(customerInfo.getDistrict());
			customer.setCity(customerInfo.getCity());
			customer.setEmail(customerInfo.getEmail());
			customer.setNumberPhone(customerInfo.getNumberPhone());

			customerRepository.save(customer);

		}

		/*
		 * order.setOrderDate(new Date());
		 */
		java.util.Date today = new java.util.Date();
		int h = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		int m = Calendar.getInstance().get(Calendar.MINUTE);
		order.setOrderDate(new java.sql.Date(today.getTime()));
		order.setHour(h);
		order.setMinute(m);
		order.setAmount(cartInfo.getAmountTotal());
		order.setCustomer(customer);

		// TODO Auto-generated method stub
		orderRepository.save(order);

		List<CartLineInfo> lines = cartInfo.getCartLines();

		for (CartLineInfo line : lines) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setAmount(line.getAmount());
			detail.setPrice(line.getProductInfo().getGiamoi());
			detail.setQuantity(line.getQuantity());
            
			Long code = line.getProductInfo().getMasp();
			Sanpham product = this.sanphamService.getSanpham(code);
			detail.setSanpham(product);
			orderDetailRepository.save(detail);
			
			product.setSoluongconlai(product.getSoluong() - detail.getQuantity());
			product.setSoluong(product.getSoluongconlai());
			
		}

		// Set OrderNum for report.
		// Set OrderNum để thông báo cho người dùng.
		cartInfo.setOrderNum(order.getId());

		return order;
	}

	/*
	 * @Override public List<Order> searchByDates(Date fromDate, Date toDate) { //
	 * TODO Auto-generated method stub return null; }
	 */

	@Override
	public Page<Order> getOrderPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Order> pageOrder = orderPageSort.findAll(pageable);
		return pageOrder;

	}
	@Override
	public List<Order> searchByFromDateAndToDate(java.util.Date fromDate, java.util.Date toDate) {

		List<Order> orders = orderRepository.searchByFromDateAndToDate(fromDate, toDate);
		return orders;
	}
	@Override
	public List<Order> searchByFromDateAndTimeToDateAndTime(java.util.Date fromDate, int fromHour, int fromMinute,
			java.util.Date toDate, int toHour, int toMinute) {
		List<Order> orders = orderRepository.searchByDatesAndTime(fromDate, fromHour, fromMinute, toDate, toHour, toMinute);
		return orders;
	}

	@Override
	public List<Order> searchByHoursAndMinute(int fromHour, int fromMinute, int toHour, int toMinute) {
		List<Order> orders = orderRepository.searchByHoursAndMinute(fromHour, fromMinute, toHour, toMinute);
		return orders;
	}

	@Override
	public List<Order> searchByDateAndTime(Date Date, int Hour, int Minute) {
		List<Order> orders  = orderRepository.searchByDateAndTime(Date, Hour, Minute);
		return orders;
	}


}
