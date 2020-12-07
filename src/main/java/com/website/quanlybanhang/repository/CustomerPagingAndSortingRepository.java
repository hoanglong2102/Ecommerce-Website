package com.website.quanlybanhang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.website.quanlybanhang.entities.Customer;

public interface CustomerPagingAndSortingRepository extends PagingAndSortingRepository<Customer, Long> {

}
