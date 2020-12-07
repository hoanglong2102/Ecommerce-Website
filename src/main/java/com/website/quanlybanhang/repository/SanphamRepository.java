package com.website.quanlybanhang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.Sanpham;

@Repository
public interface SanphamRepository extends JpaRepository<Sanpham, Long> {

	@Query("select sp from Sanpham sp")
	List<Sanpham> getAll();
	
	@Query("select s from Sanpham as s where s.tensp like %:tensp%")
	List<Sanpham> findByProductName(@Param("tensp") String tensp);

	

}
