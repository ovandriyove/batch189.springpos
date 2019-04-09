package com.bootcamp.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="tblOrder")
public class Order implements Serializable{
	
	@Id
	@Column(name="kodeOrder", length=10, nullable=false)
	private String kodeOrder;
	
	@Column(name="namaPelanggan", length=10, nullable=false)
	private String namaPelanggan;
	
	@Column(name="tglTransaksi")
	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Jakarta")
	private Date tglTransaksi;
	
	@Column(name="total")
	private double total;

	public String getKodeOrder() {
		return kodeOrder;
	}

	public void setKodeOrder(String kodeOrder) {
		this.kodeOrder = kodeOrder;
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
}
