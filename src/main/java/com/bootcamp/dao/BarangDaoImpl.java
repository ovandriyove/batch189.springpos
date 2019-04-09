package com.bootcamp.dao;

import java.util.Collection;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.bootcamp.model.Barang;

@Repository
public class BarangDaoImpl extends AbstractHibernateDao<Barang> implements BarangDao {

	public BarangDaoImpl () {
		setClazz(Barang.class);
	}
	
	public Collection<Barang> searchByNama(final String namaBarang) {
		String hql = "FROM Barang B WHERE LOWER(B.namaBarang) LIKE LOWER(:namaBarang)";
		Query q = getCurrentSession().createQuery(hql);
		q.setParameter("namaBarang", "%" + namaBarang + "%");
		Collection<Barang> result = q.list();
		return result;
	}
}
