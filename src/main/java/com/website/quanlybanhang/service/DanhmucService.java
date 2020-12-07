package com.website.quanlybanhang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.Danhmuc;

public interface DanhmucService {

	List<Danhmuc> getAll();

	Danhmuc getDanhmuc(Long id);

	Danhmuc add(Danhmuc dm);

	Danhmuc update(Danhmuc dm);

    void delete(Danhmuc dm);

	void delete(Long id);

	Page<Danhmuc> getDanhMucPagingAndSorting(Integer page, Integer pageSize, String sortBy);
	
	Page<Danhmuc> gettimkiemdanhmuc(String categoryName, Integer page, Integer pageSize, String sortBy);

}
