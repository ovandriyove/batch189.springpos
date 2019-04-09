package com.bootcamp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tblOrderDetail")
public class OrderDetail implements Serializable{
	
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", jumlahBarang=" + jumlahBarang + ", hargaSatuan=" + hargaSatuan
				+ ", subTotal=" + subTotal + ", order=" + order + ", barang=" + barang + "]";
	}

	@EmbeddedId
	private OrderDetailId id;
	
	@Column(name="jumlahBarang")
	private int jumlahBarang;
	
	@Column(name="hargaSatuan")
	private double hargaSatuan;
	
	@Column(name="subTotal")
	private double subTotal;
	
	@ManyToOne
	@JoinColumn(name="kodeOrder", updatable=false, insertable=false)
	private Order order;
	
	@ManyToOne
	@JoinColumn(name="kodeBarang", updatable=false, insertable=false)
	private Barang barang;

	public OrderDetailId getId() {
		return id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	public int getJumlahBarang() {
		return jumlahBarang;
	}

	public void setJumlahBarang(int jumlahBarang) {
		this.jumlahBarang = jumlahBarang;
	}

	public double getHargaSatuan() {
		return hargaSatuan;
	}

	public void setHargaSatuan(double hargaSatuan) {
		this.hargaSatuan = hargaSatuan;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Barang getBarang() {
		return barang;
	}

	public void setBarang(Barang barang) {
		this.barang = barang;
	}
}
