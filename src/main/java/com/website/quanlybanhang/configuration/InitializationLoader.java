package com.website.quanlybanhang.configuration;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.website.quanlybanhang.service.UserService;
import com.website.quanlybanhang.service.impl.PermissionServiceImpl;

@Component
public class InitializationLoader {

	@Autowired
	private UserService userService;

	@Autowired
	private PermissionServiceImpl permissonService;

	@PostConstruct
	public void init() {
		try {
			if (userService.getByUserName("admin") == null) {
				permissonService.createDefaultPermissions();
				userService.createDefaultAdmin();
				createDefaultManager();
				createDefaultEmployee();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	void createDefaultManager() {
		try {
			if (userService.getAllManagers().size() <= 0) {
				userService.createDefaultManager();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultEmployee() {
		try {
			if (userService.getAllEmployees().size() <= 0) {
				userService.createDefaultEmployee();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
