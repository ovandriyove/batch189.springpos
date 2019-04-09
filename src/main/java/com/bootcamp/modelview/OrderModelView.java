package com.bootcamp.modelview;

import java.util.Collection;
import java.util.Date;

import com.bootcamp.model.OrderDetail;
import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderModelView {
	
	private String kode;
	private String namaPelanggan;
	@JsonFormat(pattern="yyyy-MM-dd", locale="Asia/Jakarta")
	private Date tglTransaksi;
	private double total;
	private Collection<OrderDetail> orderDetails;
	
	@Override
	public String toString() {
		return "OrderModelView [kode=" + kode + ", namaPelanggan=" + namaPelanggan + ", tglTransaksi=" + tglTransaksi
				+ ", total=" + total + ", orderDetails=" + orderDetails + "]";
	}
	public String getKode() {
		return kode;
	}
	public void setKode(String kode) {
		this.kode = kode;
	}
	public String getNamaPelanggan() {
		return namaPelanggan;
	}
	public void setNamaPelanggan(String namaPelanggan) {
		this.namaPelanggan = namaPelanggan;
	}
	public Date getTglTransaksi() {
		return tglTransaksi;
	}
	public void setTglTransaksi(Date tglTransaksi) {
		this.tglTransaksi = tglTransaksi;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public Collection<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(Collection<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	

}
