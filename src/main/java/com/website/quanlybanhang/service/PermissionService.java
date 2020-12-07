package com.website.quanlybanhang.service;

import java.util.List;

import com.website.quanlybanhang.entities.Permission;

public interface PermissionService {

	Permission getPermisionByName(String permissionName);

	List<Permission> getAll();

	Permission getPermission(Long id);

}
