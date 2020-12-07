package com.website.quanlybanhang.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.User;
import com.website.quanlybanhang.service.ImageService;
import com.website.quanlybanhang.service.UserService;

@Controller
@RequestMapping(value = "/profile")
public class UserProfileController {

	@Autowired
	private UserService userService;

	@Autowired
	private ImageService imageService;
	
	
	
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public ModelAndView getProfile(Principal principal, ModelAndView model) {
		model.setViewName("profile");
		String userName = principal.getName();
		User user = userService.getByUserName(userName);

		model.addObject("user", user);
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveProfile(@ModelAttribute("user") User user, HttpServletRequest request) {

		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, user.getProfileImageFile());

		if (user.getId() == null) {
			user.setProfileImage(imageName);
			userService.add(user);
		} else {
			if (imageName != null) {
				user.setProfileImage(imageName);
			}
			userService.update(user);
		}
		return "redirect:/profile/" + user.getId();
	}
	
	
}
