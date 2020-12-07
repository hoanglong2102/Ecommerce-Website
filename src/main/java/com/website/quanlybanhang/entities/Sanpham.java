package com.website.quanlybanhang.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "sanpham", schema = "quanlybanhang")
public class Sanpham implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long masp;
	private String tensp;
	private Integer giacu;
	private Long giamoi;
	private String hinhanhsp;
	private String motasp;
	private Long giamgia;
	private Integer soluong;
	private Integer soluongconlai;
	private List<Long> danhmucID;
	private List<Danhmuc> danhmuc;
	private Manufacturer manufacturer;

	private MultipartFile imageFile = null;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaSP", unique = true, nullable = false)
	public Long getMasp() {
		return masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	@Column(name = "TenSP", length = 45)
	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	@Column(name = "Giacu")
	public Integer getGiacu() {
		return giacu;
	}

	public void setGiacu(Integer giacu) {
		this.giacu = giacu;
	}

	@Transient
	public Long getGiamoi() {
		return giacu - (giacu * giamgia) / 100;
	}

	public void setGiamoi(Long giamoi) {
		this.giamoi = giamoi;
	}

	@Column(name = "Hinhanh", length = 100)
	public String getHinhanhsp() {
		return hinhanhsp;
	}

	public void setHinhanhsp(String hinhanhsp) {
		this.hinhanhsp = hinhanhsp;
	}

	@Column(name = "Motasp", length = 1000)
	public String getMotasp() {
		return motasp;
	}

	public void setMotasp(String motasp) {
		this.motasp = motasp;
	}

	@Column(name = "giamgia")
	public Long getGiamgia() {
		return giamgia;
	}
    
	@Column(name = "soluong")
	public Integer getSoluong() 
	{
		return soluong;
	}

	public void setSoluong(Integer soluong) 
	{
		if (soluong <= 0)
		{
			soluong = 0;
		}
		this.soluong = soluong;
	}
	@Column(name = "soluongconlai")
	public Integer getSoluongconlai() {
		return soluongconlai;
	}

	public void setSoluongconlai(Integer soluongconlai) {
		this.soluongconlai = soluongconlai;
	}

	public void setGiamgia(Long giamgia) {
		this.giamgia = giamgia;
	}

	@Transient
	public List<Long> getDanhmucID() {
		return danhmucID;
	}

	public void setDanhmucID(List<Long> danhmucID) {
		this.danhmucID = danhmucID;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "sanpham_danhmuc", joinColumns = { @JoinColumn(name = "MaSP") }, inverseJoinColumns = {
			@JoinColumn(name = "MaDM") })
	public List<Danhmuc> getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(List<Danhmuc> danhmuc) {
		this.danhmuc = danhmuc;
	}

	@Transient
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@ManyToOne
	@JoinColumn(name = "MaNSX", nullable = false)
	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

}
