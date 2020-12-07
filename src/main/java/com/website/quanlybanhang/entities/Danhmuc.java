package com.website.quanlybanhang.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "danhmuc", schema = "quanlybanhang")
public class Danhmuc implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long madm;
	private String tendm;
	private String hinhanhdm;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaDM", unique = true, nullable = false)
	public Long getMadm() {
		return madm;
	}

	public void setMadm(Long madm) {
		this.madm = madm;
	}

	@Column(name = "TenDM", length = 30)
	public String getTendm() {
		return tendm;
	}

	public void setTendm(String tendm) {
		this.tendm = tendm;
	}

	@Column(name = "HinhanhDM", length = 50)
	public String getHinhanhdm() {
		return hinhanhdm;
	}

	public void setHinhanhdm(String hinhanhdm) {
		this.hinhanhdm = hinhanhdm;
	}

}
