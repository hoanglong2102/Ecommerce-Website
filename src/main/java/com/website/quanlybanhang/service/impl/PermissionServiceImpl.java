package com.website.quanlybanhang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Permission;
import com.website.quanlybanhang.repository.PermissionRepository;
import com.website.quanlybanhang.service.PermissionService;

@Transactional
@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionRepository permissionRepository;

	@Override
	public Permission getPermisionByName(String permissionName) {
		return permissionRepository.findByPermissionName(permissionName);
	}

	public void createDefaultPermissions() {
		Permission permission1 = new Permission();
		permission1.setPermissionName("EMPLOYEE");
		permissionRepository.save(permission1);

		Permission permission2 = new Permission();
		permission2.setPermissionName("MANAGER");
		permissionRepository.save(permission2);

		Permission permission3 = new Permission();
		permission3.setPermissionName("SUPER_ADMIN");
		permissionRepository.save(permission3);
	}

	@Override
	public List<Permission> getAll() {
		return permissionRepository.findAll();
	}

	@Override
	public Permission getPermission(Long id) {
		return permissionRepository.getOne(id);
	}
}
