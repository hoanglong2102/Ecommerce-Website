package com.website.quanlybanhang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Sanpham;
import com.website.quanlybanhang.repository.SanphamPagingAndSortingRepository;
import com.website.quanlybanhang.repository.SanphamRepository;
import com.website.quanlybanhang.service.SanphamService;

@Transactional
@Service
public class SanphamServiceImpl implements SanphamService {

	@Autowired
	private SanphamRepository sanphamRepository;

	@Autowired
	private SanphamPagingAndSortingRepository sanphamPageAndSort;
	

	@Override
	public List<Sanpham> getAll() {
		return sanphamRepository.getAll();
	}

	@Override
	public Page<Sanpham> getSanphamTheoDanhMuc(Long danhmucId, Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Sanpham> pagesp = sanphamPageAndSort.getSanphamTheoDanhMuc(danhmucId, pageable);
		return pagesp;
	}

	@Override
	public Sanpham getSanpham(Long id) {
		return sanphamRepository.getOne(id);
	}

	@Override
	public Sanpham add(Sanpham sanpham) {
		return sanphamRepository.save(sanpham);
	}

	@Override
	public Sanpham update(Sanpham sanpham) {
		return sanphamRepository.save(sanpham);
	}

	@Override
	public void delete(Sanpham sanpham) {
		sanphamRepository.delete(sanpham);
	}

	@Override
	public void delete(Long id) {
		Sanpham sanpham = sanphamRepository.getOne(id);
		sanphamRepository.delete(sanpham);

	}

	@Override
	public Page<Sanpham> getSanphamPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Sanpham> pagesp = sanphamPageAndSort.findAll(pageable);
		return pagesp;
	}

	@Override
	public Page<Sanpham> gettimkiemsanpham(String productName, Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Sanpham> pagesp = sanphamPageAndSort.findByProductName(productName, pageable);
		return pagesp;
	}

	public List<Sanpham> ketquatimkiem(String productName) {
		return sanphamRepository.findByProductName(productName);
	}
	

	@Override
	public Page<Sanpham> getSanphamTheoNSX(Long nsxId, Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Sanpham> pagesp = sanphamPageAndSort.getSanphamTheoNSX(nsxId, pageable);
		return pagesp;
	}

}
