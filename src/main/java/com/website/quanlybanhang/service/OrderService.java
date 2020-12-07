package com.website.quanlybanhang.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.Order;
import com.website.quanlybanhang.entities.OrderDetail;
import com.website.quanlybanhang.model.CartInfo;

public interface OrderService {

	public Order getOrder(Long id);

	public Order addOrder(CartInfo cartInfo);

	public List<Order> getAll();

	public Order update(Order order);

	public void delete(Long id);

	public void delete(Order order);

	public List<OrderDetail> listOrderDetailInfos(Long orderId);

	public List<Order> searchByFromDateAndToDate(Date fromDate, Date toDate);

	public List<Order> searchByHoursAndMinute(int fromHour, int fromMinute, int toHour, int toMinute);

	public List<Order> searchByDateAndTime(Date Date, int Hour, int Minute);

	public List<Order> searchByFromDateAndTimeToDateAndTime(Date fromDate, int fromHour, int fromMinute, Date toDate,
			int toHour, int toMinute);

	public Page<Order> getOrderPagingAndSorting(Integer page, Integer pageSize, String sortBy);
}
