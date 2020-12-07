package com.website.quanlybanhang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.Customer;
import com.website.quanlybanhang.entities.Danhmuc;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

	@Query("SELECT c FROM Customer c WHERE c.lastName = :lastName")
	List<Customer> findByLastNameLike(@Param("lastName") String lastName);

	@Query("select c from Customer c where c.lastName like %:lastName%")
	List<Customer> getTimKiemCustomer(@Param("lastName") String lastName);
	
	@Query("select distinct c from Customer c where c.numberPhone = :numberPhone")
	Customer findByNumberPhone(@Param("numberPhone") String numberPhone);
}
