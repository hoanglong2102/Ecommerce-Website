package com.website.quanlybanhang.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.service.UserService;

@Controller
@RequestMapping(value = "/changepassword")
public class ChangepasswordController {
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value = "/viewchangepassword", method = RequestMethod.GET)
	public ModelAndView viewChangepassword(@RequestParam String username, ModelAndView model)
	{
		model.setViewName("user-changepassword");
		model.addObject("username", username);
		return model ;
		 
	}
	@RequestMapping(value = "/updatepassword/{username}", method = RequestMethod.POST)
	public String updatePassword(@PathVariable("username") String username, HttpServletRequest request,
			@RequestParam String oldpassword ,@RequestParam String newpassword,@RequestParam String enterpassword)
	{
		boolean kq = false;
		String message = "";
		if (enterpassword.equals(newpassword) && oldpassword != "")
		{
			if (enterpassword == "" || newpassword == "")
			{
				message = "Phải nhập mật khẩu!";
				kq = false;
			}
			else
			{
				if (newpassword.length() < 8)
				{
					message = "Mật khẩu ít nhất có 8 ký tự!";
					kq = false;
				}
				else 
				{
					boolean changepassword = userService.changePassword(username, oldpassword, newpassword);
					if (changepassword)
					{
						kq = true;
						return "redirect:/admin/quanlysanpham/";	
					}
					else
					{
						message = "Mật khẩu không đúng!";
						kq = false;
					}
				}
						
			}	
		}
		else
		{
			if (!enterpassword.equals(newpassword))
			{
				 message = "Mật khẩu phải trùng khớp !";
				 kq = false;
			}
		    if (oldpassword =="" || enterpassword == "" || newpassword == "" )
			{
				message = "Phải nhập mật khẩu!";
				kq = false;
			}
		   
		}
	     request.setAttribute("message", message);
	     request.setAttribute("kq", kq);
	     return "user-changepassword";
		
	}
	
	}


