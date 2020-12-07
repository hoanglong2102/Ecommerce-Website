package com.website.quanlybanhang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Danhmuc;
import com.website.quanlybanhang.repository.DanhMucPagingAndSortingRepository;
import com.website.quanlybanhang.repository.DanhmucRepository;
import com.website.quanlybanhang.service.DanhmucService;

@Transactional
@Service
public class DanhmucServiceImpl implements DanhmucService {

	@Autowired
	private DanhmucRepository danhmucRepository;

	@Autowired
	private DanhMucPagingAndSortingRepository danhmucPageSort;

	@Override
	public List<Danhmuc> getAll() {
		return danhmucRepository.findAll();
	}

	@Override
	public Danhmuc getDanhmuc(Long id) {
		return danhmucRepository.getOne(id);
	}

	@Override
	public Danhmuc add(Danhmuc danhmuc) {
		return danhmucRepository.save(danhmuc);
	}

	@Override
	public Danhmuc update(Danhmuc danhmuc) {
		return danhmucRepository.save(danhmuc);
	}

	@Override
	public void delete(Danhmuc danhmuc) {
		danhmucRepository.delete(danhmuc);
	}

	@Override
	public void delete(Long id) {
		Danhmuc danhmuc = danhmucRepository.getOne(id);
		danhmucRepository.delete(danhmuc);

	}

	public List<Danhmuc> gettimkiemdanhmuc(String tendm) {
		return danhmucRepository.gettimkiemdanhmuc(tendm);
	}

	@Override
	public Page<Danhmuc> getDanhMucPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Danhmuc> pageDanhMuc = danhmucPageSort.findAll(pageable);
		return pageDanhMuc;
	}

	@Override
	public Page<Danhmuc> gettimkiemdanhmuc(String categoryName, Integer page, Integer pageSize, String sortBy) {
		
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Danhmuc> pagedm = danhmucPageSort.findByCatagoryName(categoryName, pageable);
		return pagedm;
	}

}
