package com.website.quanlybanhang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.website.quanlybanhang.entities.User;

public interface UserPagingAndSortingRepository extends PagingAndSortingRepository<User, Long> {

}
