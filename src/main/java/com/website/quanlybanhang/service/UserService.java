package com.website.quanlybanhang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.quanlybanhang.entities.User;

public interface UserService {

	User getByUserName(String userName);

	User getUser(Long id);

	List<User> getAll();

	List<User> getAllManagers();

	List<User> getAllEmployees();

	User add(User user);

	User update(User user);

	void delete(User user);

	void delete(Long id);

	void createDefaultAdmin() throws Exception;

	void createDefaultManager() throws Exception;

	void createDefaultEmployee() throws Exception;

	public List<User> getAllExcludeUser(String username);

	boolean changePassword(String username, String oldpass, String newpass);

	public String changeNewPassword(String userName, String newPassword, String retypePassword);

	Page<User> getUserPagingAndSorting(Integer page, Integer pageSize, String sortBy);

	public String checkUserInfo(String username, String phone, String email);
}
