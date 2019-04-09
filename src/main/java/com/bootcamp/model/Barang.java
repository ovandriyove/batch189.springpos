package com.bootcamp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tblBarang")
public class Barang implements Serializable{

	@Id
	@Column(name="kodeBarang", length=10, nullable=false)
	private String kodeBarang;
	
	@Column(name="namaBarang", length=100, nullable=false)
	private String namaBarang;
	
	@Column(name="harga", length=10, nullable=false)
	private double harga;
	
	@Column(name="satuan", length=100, nullable=false)
	private String satuan;

	public String getKodeBarang() {
		return kodeBarang;
	}

	public void setKodeBarang(String kodeBarang) {
		this.kodeBarang = kodeBarang;
	}

	public String getNamaBarang() {
		return namaBarang;
	}

	public void setNamaBarang(String namaBarang) {
		this.namaBarang = namaBarang;
	}

	public double getHarga() {
		return harga;
	}

	public void setHarga(double harga) {
		this.harga = harga;
	}

	public String getSatuan() {
		return satuan;
	}

	public void setSatuan(String satuan) {
		this.satuan = satuan;
	}
}
