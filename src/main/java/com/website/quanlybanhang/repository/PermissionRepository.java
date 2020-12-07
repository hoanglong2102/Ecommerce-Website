package com.website.quanlybanhang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.website.quanlybanhang.entities.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Long> {
	@Query("select pe from Permission as pe where pe.permissionName = :permissionName")
	Permission findByPermissionName(@Param("permissionName") String permissionName);
}
