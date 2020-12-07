package com.website.quanlybanhang.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.Sanpham;

@Repository
public interface SanphamPagingAndSortingRepository extends PagingAndSortingRepository<Sanpham, Long> {

	@Query("select sp from Sanpham as sp join sp.danhmuc as dm where dm.madm = :madm")
	Page<Sanpham> getSanphamTheoDanhMuc(@Param("madm") Long madm, Pageable pageable);
	
	@Query("select sp from Sanpham as sp join sp.manufacturer as m where m.maNSX = :maNSX")
	Page<Sanpham> getSanphamTheoNSX(@Param("maNSX") Long maNSX, Pageable pageable);
	
	@Query("select s from Sanpham as s where s.tensp like %:tensp%")
	Page<Sanpham> findByProductName(@Param("tensp") String tensp, Pageable pageable);

}
