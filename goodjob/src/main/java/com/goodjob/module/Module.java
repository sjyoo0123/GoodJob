package com.goodjob.module;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Module {
	public Date datePasing(String birth_s) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date date = formatter.parse(birth_s);
			java.sql.Date birth = new java.sql.Date(date.getTime());
			return birth;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	
}