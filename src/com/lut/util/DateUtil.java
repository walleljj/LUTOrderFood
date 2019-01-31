package com.lut.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static String getAutoIncrementKey(Date date) {
		//Calendar
		String pkey;
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		pkey = Integer.toString(year) + Integer.toString(month) 
		  + Integer.toString(day) + "-" + date.getTime();
		
		return pkey;
	}

}
