package com.website.quanlybanhang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.Sanpham;

public interface SanphamService {
	List<Sanpham> getAll();

	Page<Sanpham> getSanphamTheoDanhMuc(Long danhmucId, Integer page, Integer pageSize, String sortBy);

	Page<Sanpham> getSanphamTheoNSX(Long nsxId, Integer page, Integer pageSize, String sortBy);

	Sanpham getSanpham(Long id);

	Sanpham add(Sanpham sp);

	Sanpham update(Sanpham sp);

	void delete(Sanpham sanpham);

	void delete(Long id);

	Page<Sanpham> gettimkiemsanpham(String productName, Integer page, Integer pageSize, String sortBy);

	Page<Sanpham> getSanphamPagingAndSorting(Integer page, Integer pageSize, String sortBy);

}
