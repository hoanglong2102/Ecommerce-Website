package com.website.quanlybanhang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.Customer;

public interface CustomerService {
	public Customer getCustomer(Long id);

	public List<Customer> getAll();

	public Customer add(Customer customer);

	public Customer update(Customer customer);

	public void delete(Customer customer);

	public void delete(Long id);

	public Page<Customer> getCustomerPagingAndSorting(Integer page, Integer pageSize, String sortBy);

	public Customer findByNumberPhone(String numberPhone);

}
