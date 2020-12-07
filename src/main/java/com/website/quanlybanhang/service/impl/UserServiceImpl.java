package com.website.quanlybanhang.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.website.quanlybanhang.entities.Permission;
import com.website.quanlybanhang.entities.User;
import com.website.quanlybanhang.repository.UserPagingAndSortingRepository;
import com.website.quanlybanhang.repository.UserRepository;
import com.website.quanlybanhang.service.PermissionService;
import com.website.quanlybanhang.service.UserService;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userReposity;

	@Autowired
	private UserPagingAndSortingRepository userPageSort;

	@Autowired
	private PermissionService permissionService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	private Object userRepository;

	private static final String DEFAULT_INITIAL_PASSWORD = "admin";

	public User getByUserName(String userName) {
		return userReposity.findByUserName(userName);
	}

	public User getUser(Long id) {
		return userReposity.getOne(id);
	}

	public List<User> getAll() {
		return this.userReposity.findAll();
	}

	@Override
	public List<User> getAllManagers() {
		return userReposity.findByPermissionName("MANAGER");
	}

	@Override
	public List<User> getAllEmployees() {
		return userReposity.findByPermissionName("EMPLOYEE");
	}

	public List<User> getAllExcludeUser(String username) {
		return this.userReposity.findAllUsersExclude(username);
	}

	public User add(User user) {
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);
		user.setPassword(password);
		user.setIsActive(true);
		return userReposity.save(user);
	}

	public User update(User user) {
		user.setIsActive(true);
		return userReposity.save(user);
	}

	public void delete(User user) {
		userReposity.delete(user);
	}

	public void delete(Long id) {
		User user = userReposity.getOne(id);
		userReposity.delete(user);
	}

	public void createDefaultAdmin() throws Exception {

		// TODO create all groups and permissions
		Permission supperAdmin = permissionService.getPermisionByName("SUPER_ADMIN");
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);

		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("admin");
		user.setPassword(password);
		user.setEmail("admin@greenacedamy.com");
		user.setFirstName("Administrator");
		user.setLastName("User");
		user.setIsActive(true);

		List<Permission> permissions = new ArrayList<Permission>();
		permissions.add(supperAdmin);
		user.setPermissions(permissions);

		userReposity.save(user);

	}

	public void createDefaultManager() throws Exception {
		Permission manager = permissionService.getPermisionByName("MANAGER");
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);

		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("manager1");
		user.setPassword(password);
		user.setEmail("manager1@greenacedamy.com");
		user.setFirstName("Manager");
		user.setLastName("User");
		user.setIsActive(true);

		List<Permission> permissions = new ArrayList<Permission>();
		permissions.add(manager);
		user.setPermissions(permissions);

		userReposity.save(user);
	}

	public void createDefaultEmployee() throws Exception {
		Permission employee = permissionService.getPermisionByName("EMPLOYEE");
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);

//		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("employee1");
		user.setPassword(password);
		user.setEmail("employee1@greenacedamy.com");
		user.setFirstName("Employee");
		user.setLastName("User");
		user.setIsActive(true);

		List<Permission> permissions = new ArrayList<Permission>();
		permissions.add(employee);
		user.setPermissions(permissions);

		userReposity.save(user);
	}

	@Override
	public boolean changePassword(String username, String oldpass, String newpass) {
		User user = this.userReposity.findByUserName(username);
		if (user != null) {
			if (passwordEncoder.matches(oldpass, user.getPassword())) {
				String newpassword = passwordEncoder.encode(newpass);
				user.setPassword(newpassword);
				userReposity.save(user);
				return true;
			}
		}
		return false;

	}
	public String changeNewPassword(String userName, String newPassword,String retypePassword) {
		User user = this.userReposity.findByUserName(userName);
		if (user != null) {
			
			if(newPassword.equals(retypePassword) == false ) {
				return "mật khẩu xác nhận không khớp";
			}
			if(newPassword.length() <= 5) {
				return "mật khẩu không đủ dài";
			}
			
			String password = passwordEncoder.encode(newPassword);
			user.setPassword(password);
			userReposity.save(user);
			System.out.println("update thanh cong");
			
		}
		return null;
	}
	
	public String checkUserInfo(String username, String phone, String email){
		User user = this.userReposity.findByUserNameEmailPhone(username, phone, email);
		if (user == null) {
			return "Thong tin nhap khong dung. Vui long kiem tra lai";
		} 
		
		return null;
	}


	public List<User> getTimKiemUser(String userName) {
		return userReposity.getTimKiemUser(userName);
	}

	@Override
	public Page<User> getUserPagingAndSorting(Integer page, Integer pageSize, String sortBy) {
		Pageable pageable = PageRequest.of(page, pageSize, Sort.by(sortBy));
		Page<User> pageUser = userPageSort.findAll(pageable);
		return pageUser;
	}
}
