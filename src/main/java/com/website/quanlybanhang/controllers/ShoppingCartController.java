package com.website.quanlybanhang.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.quanlybanhang.entities.Sanpham;
import com.website.quanlybanhang.model.CartInfo;
import com.website.quanlybanhang.model.CartLineInfo;
import com.website.quanlybanhang.model.CustomerInfo;
import com.website.quanlybanhang.model.ProductInfo;
import com.website.quanlybanhang.service.OrderService;
import com.website.quanlybanhang.service.SanphamService;
import com.website.quanlybanhang.utils.Utils;

@Controller
@RequestMapping(value = "/shop")
public class ShoppingCartController {

	@Autowired
	private SanphamService sanphamService;

	@Autowired
	private OrderService orderService;
	
	

	@RequestMapping({ "/buyProduct" })
	public String listProductHandler(HttpServletRequest request, Model model,  //
			@RequestParam(value = "id", defaultValue = "") Long id) {

		boolean kq = false;
		Sanpham product = null;
		String message = "";
		if (id != null) {
			product = sanphamService.getSanpham(id);
		}
		if (product != null) 
		{
			if (product.getSoluong() <= 0)
			{
				message = "Sản phẩm đã hết hàng";
				request.setAttribute("message", message);
				kq = false;
			}
			else
			{
				CartInfo cartInfo = Utils.getCartInSession(request);
				ProductInfo productInfo = new ProductInfo(product);
				cartInfo.addProduct(productInfo, 1);
				model.addAttribute("cartForm", cartInfo);
				kq = true;
			}
		}
		request.setAttribute("kq", kq);
		return "shop-shoppingCart" ;
	}

	@RequestMapping({ "/shoppingCartRemoveProduct" })
	public String removeProductHandler(HttpServletRequest request, Model model, //
			@RequestParam(value = "id", defaultValue = "") Long id) {
		Sanpham product = null;
		if (id != null) {
			product = sanphamService.getSanpham(id);
		}
		if (product != null) {

			CartInfo cartInfo = Utils.getCartInSession(request);

			ProductInfo productInfo = new ProductInfo(product);

			cartInfo.removeProduct(productInfo);
			

		}
		return "redirect:/shop/shoppingCart";
	}

	// POST: Update quantity for product in cart
	@RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.POST)
	public String shoppingCartUpdateQty(HttpServletRequest request,
			@ModelAttribute("cartForm") CartInfo cartForm, Model model) 
	{
		String message = "";
		CartInfo cartInfo = Utils.getCartInSession(request);
		
	    cartInfo.updateQuantity(cartForm);
	    
	    for (CartLineInfo cartLineInfo : cartInfo.getCartLines()) {
	    	if (cartLineInfo.getMessage() != null)
	    	{
	    		message = message + cartLineInfo.getMessage();
	    	}
			
		}
	    request.setAttribute("kq", true);
	    model.addAttribute("message", message);
		model.addAttribute("cartForm", cartInfo);
		return "shop-shoppingCart";
	}

	// GET: Show cart.
	@RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.GET)
	public String shoppingCartHandler(HttpServletRequest request, Model model) 
	{
		String message = "";
		CartInfo myCart =  Utils.getCartInSession(request);;
		model.addAttribute("cartForm", myCart);
		
		if (myCart.getCartLines().size() <= 0)
		{
			message = "Giỏ hàng của bạn đang trống!";
			request.setAttribute("kq", false);
		}
		else
		{
			request.setAttribute("kq", true);
		}
		request.setAttribute("message", message);
		return "shop-shoppingCart";
	}

	// GET: Enter customer information.
	@RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.GET)
	public ModelAndView shoppingCartCustomerForm(HttpServletRequest request) {

		CartInfo cartInfo = Utils.getCartInSession(request);
		CustomerInfo customerInfo = cartInfo.getCustomerInfo();
		if (customerInfo == null) {
			customerInfo = new CustomerInfo();
		}
		ModelAndView model = new ModelAndView();
		model.addObject("customerInfo", customerInfo);
//			if (cartInfo.isEmpty()) {
		//
//				return "redirect:/shop/checkOut";
//			}

		model.setViewName("shop-checkOut");
		return model;

	}

	// POST: Save customer information.
	@RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.POST)
	public String shoppingCartCustomerSave(HttpServletRequest request, //
			Model model, //
			@ModelAttribute("customerInfo") CustomerInfo customerInfo //
	) {

		CartInfo cartInfo = Utils.getCartInSession(request);
		cartInfo.setCustomerInfo(customerInfo);

		String errorMessage = null;
		if (customerInfo.getNumberPhone().isEmpty()) {
			errorMessage = "Điền thông tin số điện thoại!";
		}
		if (customerInfo.getEmail().isEmpty()) {
			errorMessage = "Điền thông tin email!";
		}
		if (customerInfo.getCity().isEmpty()) {
			errorMessage = "Điền thông tin thành phố!";
		}
		if (customerInfo.getDistrict().isEmpty()) {
			errorMessage = "Điền thông tin quận!";
		}
		if (customerInfo.getStreet().isEmpty()) {
			errorMessage = "Điền thông tin địa chỉ!";
		}
		if (customerInfo.getLastName().isEmpty()) {
			errorMessage = "Điền thông tin tên!";
		}
		if (customerInfo.getFirstName().isEmpty()) {
			errorMessage = "Điền thông tin họ!";
		}

		if (errorMessage != null) {
			request.setAttribute("errorMessage", errorMessage);
			return "shop-checkOut";
		}

		return "redirect:/shop/shoppingCartConfirmation";
	}

	// GET: Show information to confirm.
	@RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.GET)
	public String shoppingCartConfirmationReview(HttpServletRequest request, Model model) {
		CartInfo cartInfo = Utils.getCartInSession(request);

		if (cartInfo == null || cartInfo.isEmpty()) {

			return "redirect:/shop/shoppingCart";
		}
		model.addAttribute("myCart", cartInfo);

		return "shoppingCartConfirmation";
	}

	// POST: Submit Cart (Save)
	@RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.POST)
	public String shoppingCartConfirmationSave(HttpServletRequest request, Model model) {
		CartInfo cartInfo = Utils.getCartInSession(request);

		if (cartInfo.isEmpty()) {

			return "redirect:/shop/shoppingCart";
		}
//			else if (!cartInfo.isValidCustomer()) {
		//
//				return "redirect:/shop/shoppingCartCustomer";
//			}
		try {
			orderService.addOrder(cartInfo);
		} catch (Exception e) {

			return "shoppingCartConfirmation";
		}

		// Remove Cart from Session.
		Utils.removeCartInSession(request);

		// Store last cart.
		Utils.storeLastOrderedCartInSession(request, cartInfo);

		return "redirect:/shop/shoppingCartFinalize";
	}

	@RequestMapping(value = { "/shoppingCartFinalize" }, method = RequestMethod.GET)
	public String shoppingCartFinalize(HttpServletRequest request, Model model) {

		CartInfo lastOrderedCart = Utils.getLastOrderedCartInSession(request);

		if (lastOrderedCart == null) {
			return "redirect:/shop/shoppingCart";
		}
		model.addAttribute("lastOrderedCart", lastOrderedCart);
		return "shoppingCartFinalize";
	}

}
