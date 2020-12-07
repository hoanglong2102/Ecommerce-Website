package com.website.quanlybanhang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Manufacturer;
import com.website.quanlybanhang.repository.ManufacturerPagingAndSortingRepository;
import com.website.quanlybanhang.repository.ManufacturerRepository;
import com.website.quanlybanhang.service.ManufacturerService;

@Transactional
@Service
public class ManufacturerServiceImpl implements ManufacturerService {

	@Autowired
	private ManufacturerRepository manufacturerRepository;

	@Autowired
	private ManufacturerPagingAndSortingRepository manufacturerPageAndSort;

	@Override
	public List<Manufacturer> getAll() {
		return manufacturerRepository.findAll();
	}

	@Override
	public List<Manufacturer> getSearchManufacturer(String tenNSX) {
		return manufacturerRepository.getSearchManufacturer(tenNSX);
	}

	@Override
	public Manufacturer getManufacturer(Long id) {
		return manufacturerRepository.getOne(id);
	}

	@Override
	public Manufacturer add(Manufacturer manufacturer) {
		return manufacturerRepository.save(manufacturer);
	}

	@Override
	public Manufacturer update(Manufacturer manufacturer) {
		return manufacturerRepository.save(manufacturer);
	}

	@Override
	public void delete(Manufacturer manufacturer) {
		manufacturerRepository.delete(manufacturer);

	}

	@Override
	public void delete(Long id) {
		Manufacturer manufacturer = manufacturerRepository.getOne(id);
		manufacturerRepository.delete(manufacturer);
	}

	@Override
	public Page<Manufacturer> getManufacturerPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<Manufacturer> pageManufacturer = manufacturerPageAndSort.findAll(pageable);
		return pageManufacturer;
	}

}
