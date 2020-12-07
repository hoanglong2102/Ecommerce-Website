package com.website.quanlybanhang.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "nhasanxuat", schema = "quanlybanhang")
public class Manufacturer implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long maNSX;
	private String tenNSX;

	private List<Sanpham> sanpham;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaNSX", unique = true, nullable = false)
	public Long getMaNSX() {
		return maNSX;
	}

	public void setMaNSX(Long maNSX) {
		this.maNSX = maNSX;
	}

	@Column(name = "TenNSX", length = 30)
	public String getTenNSX() {
		return tenNSX;
	}

	public void setTenNSX(String tenNSX) {
		this.tenNSX = tenNSX;
	}

	@OneToMany(mappedBy = "manufacturer")
	public List<Sanpham> getSanpham() {
		return sanpham;
	}

	public void setSanpham(List<Sanpham> sanpham) {
		this.sanpham = sanpham;
	}

}
