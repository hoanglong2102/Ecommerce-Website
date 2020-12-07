package com.website.quanlybanhang.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.service.UserService;

@Controller

public class ForgotPasswordController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String forgotPassword() {
		return "forgotPassword";
	}

	/*
	 * @RequestMapping(value = "/resetPassword", method = RequestMethod.POST) public
	 * String resetPassword(@RequestParam String userName, @RequestParam String
	 * phoneNumber,
	 * 
	 * @RequestParam String email, Model model) { String error =
	 * userService.checkUserInfo(userName, phoneNumber, email); if (error != null) {
	 * model.addAttribute("errorMessage", error); return "forgotPassword"; } return
	 * "changePassword"; }
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam String username, @RequestParam String phoneNumber,
			@RequestParam String email, Model model) {
		String error = userService.checkUserInfo(username, phoneNumber, email);
		if (error != null) {
			model.addAttribute("errorMessage", error);
			return "forgotPassword";
		}
		model.addAttribute("userName", username);
		return "changePassword";
	}

	@RequestMapping(value = "/changeNewPassword", method = RequestMethod.POST)
	public ModelAndView getChangePassword(ModelAndView model, @RequestParam("userName") String userName,
			@RequestParam("newPassword") String newPassword, @RequestParam("retypePassword") String retypePassword) {
		String error = userService.changeNewPassword(userName, newPassword, retypePassword);
		if (error != null) {
			model.addObject("errorMessagePass", error);
			model.setViewName("changePasswordError");
			return model;
		}
		model.setViewName("changePasswordSuccess");
		return model;
	}
}
