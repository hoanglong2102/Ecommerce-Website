package com.website.quanlybanhang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.website.quanlybanhang.entities.Order;

public interface OrderPagingAndSortingRepository extends PagingAndSortingRepository<Order, Long> {

}
