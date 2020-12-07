package com.website.quanlybanhang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.Manufacturer;

@Repository
public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long> {
	@Query("select nsx from Manufacturer nsx")
	List<Manufacturer> getAll();

	@Query("select nsx from Manufacturer nsx where nsx.tenNSX like %:tenNSX%")
	List<Manufacturer> getSearchManufacturer(@Param("tenNSX") String tenNSX);
}
