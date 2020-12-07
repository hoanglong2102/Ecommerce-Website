package com.website.quanlybanhang.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Permission;
import com.website.quanlybanhang.entities.User;
import com.website.quanlybanhang.service.ImageService;
import com.website.quanlybanhang.service.PermissionService;
import com.website.quanlybanhang.service.impl.UserServiceImpl;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private PermissionService permissionService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getUsers(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.addObject("users", userService.getUserPagingAndSorting(page, size, "id"));
		model.setViewName("user-users");
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/getUser/{userId}", method = RequestMethod.GET)
	public ModelAndView getUser(@PathVariable("userId") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {

		if (mode.equals("EDIT")) {
			model.setViewName("user-userUpdate");
		} else {
			model.setViewName("user-userDetail");
		}

		User user = userService.getUser(id);
		List<Permission> permissions = this.permissionService.getAll();

		model.addObject("user", user);
		model.addObject("allPermission", permissions);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView addStudent(ModelAndView model) {
		model.setViewName("user-userUpdate");
		List<Permission> permissions = this.permissionService.getAll();
		model.addObject("user", new User());
		model.addObject("mode", "ADD");
		model.addObject("allPermission", permissions);
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, HttpServletRequest request) {

		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, user.getProfileImageFile());

		List<Long> listpermissId = user.getPermissionID();
		List<Permission> listpermiss = new ArrayList<Permission>();
		for (Long permissId : listpermissId) {
			Permission permission = this.permissionService.getPermission(permissId);
			listpermiss.add(permission);
		}

		user.setPermissions(listpermiss);

		if (user.getId() == null) {
			user.setProfileImage(imageName);
			userService.add(user);
		} else {
			if (imageName != null) {
				user.setProfileImage(imageName);
			}
			userService.update(user);
		}

		return "redirect:/admin/user/";
	}

	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteUser(@PathVariable("id") Long id) {
		User user = userService.getUser(id);
		userService.delete(user);
		return "redirect:/admin/user/";
	}

	@RequestMapping(value = "/timkiemuser", method = RequestMethod.POST)
	public ModelAndView timkiemUser(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<User> list = userService.getTimKiemUser(search);
		if (list.size() > 0) {
			model.addObject("users", list);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.setViewName("user-timkiemuser");
		return model;
	}
}
