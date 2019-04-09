package com.bootcamp.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bootcamp.model.Barang;
import com.bootcamp.service.BarangService;

@RestController
@RequestMapping("/barang")
public class BarangController {
	
	@Autowired
	private BarangService barangService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ResponseEntity<Collection<Barang>> findAll() {
		Collection<Barang> list = barangService.findAll();
		ResponseEntity<Collection<Barang>> result = new ResponseEntity<> (list, HttpStatus.OK);
		return result;	
	}
	
	@RequestMapping(value="/{kodeBarang}", method=RequestMethod.GET)
	public ResponseEntity<Barang> findOne(@PathVariable("kodeBarang") String kodeBarang) {
		Barang barang = barangService.findOne(kodeBarang);
		ResponseEntity<Barang> result = new ResponseEntity<> (barang, HttpStatus.OK);
		return result;
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ResponseEntity<Collection<Barang>> findAll(@RequestParam(value = "namaBarang", required = false) String namaBarang) {
//		Collection<Barang> list = barangService.findAll();
//		ResponseEntity<Collection<Barang>> result = new ResponseEntity<> (list, HttpStatus.OK);
//		return result;
//	}
	
	@RequestMapping(value = "/search/", method = RequestMethod.GET)
	public ResponseEntity<Collection<Barang>> searchByNama(@RequestParam(value = "namaBarang") String namaBarang) {
		Collection<Barang> list = barangService.searchByNama(namaBarang);
		ResponseEntity<Collection<Barang>> result = new ResponseEntity<> (list, HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<Barang> save(@RequestBody Barang barang) {
		barangService.save(barang);
		ResponseEntity<Barang> result = new ResponseEntity<> (HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value="/{kodeBarang}", method=RequestMethod.DELETE)
	public ResponseEntity<Barang> deleteById(@PathVariable("kodeBarang") String kodeBarang) {
		barangService.deleteById(kodeBarang);
		ResponseEntity<Barang> result = new ResponseEntity<> (HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value="/", method= RequestMethod.PUT)
	public ResponseEntity<Barang> update(@RequestBody Barang barang) {
		barangService.update(barang);
		ResponseEntity<Barang> result = new ResponseEntity<> (HttpStatus.OK);
		return result;
	}
}
