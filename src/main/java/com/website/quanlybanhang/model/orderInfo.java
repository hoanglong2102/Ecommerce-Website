package com.website.quanlybanhang.model;

import java.util.Date;

import com.website.quanlybanhang.entities.Customer;

public class orderInfo {
	private Long id;
	private int orderNumber;
	private Customer customer;
	private Double amount;
	private Date orderDate;
	public orderInfo(Long id, int orderNumber, Customer customer, Double amount, Date orderDate) {
		super();
		this.id = id;
		this.orderNumber = orderNumber;
		this.customer = customer;
		this.amount = amount;
		this.orderDate = orderDate;
	}

}
