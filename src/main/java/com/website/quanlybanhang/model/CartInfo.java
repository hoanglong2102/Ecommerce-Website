package com.website.quanlybanhang.model;

import java.util.ArrayList;
import java.util.List;

public class CartInfo {

	private CustomerInfo customerInfo;

	private Long orderNum;

	private final List<CartLineInfo> cartLines = new ArrayList<CartLineInfo>();
	
	

	public CustomerInfo getCustomerInfo() {
		return customerInfo;
	}

	public void setCustomerInfo(CustomerInfo customerInfo) {
		this.customerInfo = customerInfo;
	}

	public List<CartLineInfo> getCartLines() {
		return cartLines;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	private CartLineInfo findLineById(Long id) {
		for (CartLineInfo line : this.cartLines) {
			if (line.getProductInfo().getMasp().equals(id)) {
				return line;
			}
		}
		return null;
	}

	public void addProduct(ProductInfo productInfo, int quantity) {
		CartLineInfo line = this.findLineById(productInfo.getMasp());
		if (line == null) {
			line = new CartLineInfo();
			line.setQuantity(0);
			line.setProductInfo(productInfo);
			line.setStatus(false);
			this.cartLines.add(line);
		}
		int newQuantity = line.getQuantity() + quantity;
		if (newQuantity <= 0) {
			this.cartLines.remove(line);
		} else {
			if (newQuantity <= line.getProductInfo().getSoluong())
			{
				newQuantity = newQuantity;
			}
			else
			{
			   newQuantity = line.getProductInfo().getSoluong();
			}
			line.setQuantity(newQuantity);
			
			
		}
	}

	public void updateProduct(Long id, int quantity) 
	{
		CartLineInfo line = this.findLineById(id);
		if (line != null) 
		{
			if (quantity <= 0) {
				this.cartLines.remove(line);
			} 
			else 
			{
				int newQuantity = line.getQuantity();
				if (quantity <= line.getProductInfo().getSoluong()) 
				{
					newQuantity = quantity;
					line.setMessage(null);
					line.setQuantity(newQuantity);
				} 
				else {
					String message = line.getProductInfo().getTensp() +"\t"+ "đã vượt quá số lượng quy định";
					line.setMessage(message);
					line.setQuantity(newQuantity);
				}

			}
		}
	}

	public void removeProduct(ProductInfo productInfo) {
		CartLineInfo line = this.findLineById(productInfo.getMasp());
		if (line != null) {
			this.cartLines.remove(line);
		}
	}

	public boolean isEmpty() {
		return this.cartLines.isEmpty();
	}

	public int getQuantityTotal() {
		int quantity = 0;
		for (CartLineInfo line : this.cartLines) {
			quantity += line.getQuantity();
		}
		return quantity;
	}

	public int getAmountTotal() {
		int total = 0;
		for (CartLineInfo line : this.cartLines) {
			total += line.getAmount();
		}
		return total;
	}

	public void updateQuantity(CartInfo cartForm) 
	{
		if (cartForm != null) 
		{
			List<CartLineInfo> lines = cartForm.getCartLines();
			for (CartLineInfo line : lines) 
			{
			   this.updateProduct(line.getProductInfo().getMasp(), line.getQuantity());
			}
		}

	}

}
