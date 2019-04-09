package com.bootcamp.converter;

import java.text.SimpleDateFormat;//import SimpleDateFormat
import java.util.Date;//Import Date

import org.springframework.core.convert.converter.Converter;//Import Converter

public class StringDateConverter implements Converter<String, Date> {
	
	@Override
	public Date convert(String source) {
		SimpleDateFormat waktu = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return waktu.parse(source);
		} catch (Exception e){
			return null;
		}
	}
}
