package com.website.quanlybanhang.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail", schema = "quanlybanhang")
public class OrderDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Sanpham sanpham;
	private Order order;
	private Long price;
	private int quantity;
	private double amount;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDER_DETAIL_ID", unique = true, nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ORDER_ID", nullable = false)
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaSP", nullable = false)
	public Sanpham getSanpham() {
		return sanpham;
	}

	@Column(name = "PRICE")
	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
}
