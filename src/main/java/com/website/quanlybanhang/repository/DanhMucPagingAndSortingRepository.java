package com.website.quanlybanhang.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.website.quanlybanhang.entities.Danhmuc;

public interface DanhMucPagingAndSortingRepository extends PagingAndSortingRepository<Danhmuc, Long> {
	
	
	@Query("select dm from Danhmuc as dm where dm.tendm like %:tendm%")
	Page<Danhmuc> findByCatagoryName(@Param("tendm") String tendm, Pageable pageable);
}
