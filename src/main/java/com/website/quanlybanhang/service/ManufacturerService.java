package com.website.quanlybanhang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.Manufacturer;

public interface ManufacturerService {

	public List<Manufacturer> getAll();

	public List<Manufacturer> getSearchManufacturer(String tenNSX);

	public Manufacturer getManufacturer(Long id);

	public Manufacturer add(Manufacturer manufacturer);

	public Manufacturer update(Manufacturer manufacturer);

	public void delete(Manufacturer manufacturer);

	public void delete(Long id);

	public Page<Manufacturer> getManufacturerPagingAndSorting(Integer page, Integer pageSize, String sortBy);
}
