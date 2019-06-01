package com.util;

import java.text.NumberFormat;

public class ChStr
{
	public String formatNO(int str, int length)
	{
		float ver = Float.parseFloat(System
				.getProperty("java.specification.version")); 
		String laststr = "";
		if (ver < 1.5)
		{ 
			try
			{
				NumberFormat formater = NumberFormat.getNumberInstance(); 
				formater.setMinimumIntegerDigits(length); 
				laststr = formater.format(str).toString().replace(",", "");
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		} else
		{ 
			Integer[] arr = new Integer[1];
			arr[0] = new Integer(str); 
			laststr = String.format("%0" + length + "d", arr);
		}
		return laststr;
	}
}
