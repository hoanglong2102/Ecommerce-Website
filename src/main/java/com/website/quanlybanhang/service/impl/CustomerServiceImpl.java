package com.website.quanlybanhang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Customer;
import com.website.quanlybanhang.entities.Danhmuc;
import com.website.quanlybanhang.repository.CustomerPagingAndSortingRepository;
import com.website.quanlybanhang.repository.CustomerRepository;
import com.website.quanlybanhang.service.CustomerService;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private CustomerPagingAndSortingRepository customerPageSort;

	public Customer getCustomer(Long id) {
		return customerRepository.getOne(id);
	}

	public List<Customer> getAll() {
		return this.customerRepository.findAll();
	}

	public Customer add(Customer customer) {
		return customerRepository.save(customer);
	}

	public Customer update(Customer customer) {

		return customerRepository.save(customer);
	}

	public void delete(Customer customer) {
		customerRepository.delete(customer);
	}

	public void delete(Long id) {
		Customer customer = customerRepository.getOne(id);
		customerRepository.delete(customer);
	}

	public List<Customer> getTimKiemCustomer(String lastName) {
		return customerRepository.getTimKiemCustomer(lastName);
	}

	@Override
	public Page<Customer> getCustomerPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Customer> pageCustomer = customerPageSort.findAll(pageable);
		return pageCustomer;
	}
	
	public Customer findByNumberPhone(String numberPhone) {
		return customerRepository.findByNumberPhone(numberPhone);
	}
}
