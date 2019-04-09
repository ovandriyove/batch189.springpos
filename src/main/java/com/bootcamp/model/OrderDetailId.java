package com.bootcamp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class OrderDetailId implements Serializable {
	
	@Override
	public String toString() {
		return "OrderDetailId [kodeOrder=" + kodeOrder + ", kodeBarang=" + kodeBarang + "]";
	}

	@Column(name="kodeOrder", length=10, nullable=false)
	private String kodeOrder;
	
	@Column(name="kodeBarang", length=10, nullable=false)
	private String kodeBarang;

	public String getKodeOrder() {
		return kodeOrder;
	}

	public void setKodeOrder(String kodeOrder) {
		this.kodeOrder = kodeOrder;
	}

	public String getKodeBarang() {
		return kodeBarang;
	}

	public void setKodeBarang(String kodeBarang) {
		this.kodeBarang = kodeBarang;
	}
}
