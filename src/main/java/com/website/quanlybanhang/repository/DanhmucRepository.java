package com.website.quanlybanhang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.Danhmuc;

@Repository
public interface DanhmucRepository extends JpaRepository<Danhmuc, Long> 
{
	
	@Query("select dm from Danhmuc dm")
	List<Danhmuc> getAll();
	
	@Query("select dm from Danhmuc dm where dm.tendm like %:tendm%")
	List<Danhmuc> gettimkiemdanhmuc(@Param("tendm") String tendm);

}
