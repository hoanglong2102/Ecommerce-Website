package com.website.quanlybanhang.model;

import com.website.quanlybanhang.entities.Sanpham;

public class ProductInfo {
	private Long masp;
	private String tensp;
	private int giacu;
	private Long giamoi;
	private String hinhanhsp;
	private Integer soluong;
 
	public ProductInfo() {

	}

	public ProductInfo(Sanpham product) {
		this.masp = product.getMasp();
		this.tensp = product.getTensp();
		this.giacu = product.getGiacu();
		this.giamoi = product.getGiamoi();
		this.hinhanhsp = product.getHinhanhsp();
		this.soluong = product.getSoluong();
	}

	public ProductInfo(Long masp, String tensp, int giacu, Long giamoi, String hinhanhsp) {
		this.masp = masp;
		this.tensp = tensp;
		this.giacu = giacu;
		this.giamoi = giamoi;
		this.hinhanhsp = hinhanhsp;
	}

	public Long getMasp() {
		return masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	
	public int getGiacu() {
		return giacu;
	}

	public void setGiacu(int giacu) {
		this.giacu = giacu;
	}

	public Long getGiamoi() {
		return giamoi;
	}

	public void setGiamoi(Long giamoi) {
		this.giamoi = giamoi;
	}

	public String getHinhanhsp() {
		return hinhanhsp;
	}

	public void setHinhanhsp(String hinhanhsp) {
		this.hinhanhsp = hinhanhsp;
	}

	public Integer getSoluong() {
		return soluong;
	}

	public void setSoluong(Integer soluong) {
		this.soluong = soluong;
	}
	
}
