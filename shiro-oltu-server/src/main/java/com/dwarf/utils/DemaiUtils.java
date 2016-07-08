package com.dwarf.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import ch.hsr.geohash.GeoHash;

import com.alibaba.fastjson.JSON;

public class DemaiUtils {
	
	public static final String[] zodiacArr = { "猴", "鸡", "狗", "猪", "鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊" };
	 
	public static final String[] constellationArr = { "水瓶座", "双鱼座", "白羊座", "金牛座", "双子座", "巨蟹座", "狮子座", "处女座", "天秤座", "天蝎座", "射手座", "摩羯座" };
	 
	public static final int[] constellationEdgeDay = { 20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22 };
	 
	/**
	 * 根据日期获取生肖
	 * @return
	 */
	public static String getZodica(Date date) {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    return zodiacArr[cal.get(Calendar.YEAR) % 12];
	}
	 
	/**
	 * 根据日期获取星座
	 * @return
	 */
	public static String getConstellation(Date date) {
	    if (date == null) {
	        return "";
	    }
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    int month = cal.get(Calendar.MONTH);
	    int day = cal.get(Calendar.DAY_OF_MONTH);
	    if (day < constellationEdgeDay[month]) {
	        month = month - 1;
	    }
	    if (month >= 0) {
	        return constellationArr[month];
	    }
	    return constellationArr[11];
	}


	public static void main(String[] args) throws ParseException {
		/*SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(DemaiUtils.getZodica(myFormatter.parse("1986-06-27")));
		System.out.println(DemaiUtils.getConstellation(myFormatter.parse("1986-06-27")));
		
		GeoHash geoHash = GeoHash.withBitPrecision(39.908800,116.452415, 40);
		System.out.println(geoHash);
		
		Map<String, String> map = (Map<String, String>) JSON.parse("{\"latitude\":\"0.0000\",\"longitude\":\"0.0000\"}");
		System.out.println(map.get("latitude"));*/
		System.out.println(DemaiUtils.convertIrrWord("爬山 游泳 武术 绘画"));
	}
	
	public static List<String> convertIrrWord(String word){
		word = word.trim();
		List<String> strList = new ArrayList<>();
		if(word.contains(" ")){
			String[] arrs = word.split(" ");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}else if(word.contains("、")){
			String[] arrs = word.split("、");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}else if(word.contains(",")){
			String[] arrs = word.split(",");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}else if(word.contains("，")){
			String[] arrs = word.split("，");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}else if(word.contains("。")){
			String[] arrs = word.split("。");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}else if(word.contains(".")){
			String[] arrs = word.split(".");
			for(String s : arrs){
				strList.add(s.trim());
			}
		}
		return strList;
	}
	
	public static String stripNonCharCodepoints(String input) {
		StringBuilder retval = new StringBuilder(input.length());
		char ch;
		for (int i = 0; i < input.length(); i++) {
			ch = input.charAt(i);
			if (ch % 0x10000 != 0xffff && // 0xffff - 0x10ffff range step
					ch % 0x10000 != 0xfffe && // 0xfffe - 0x10fffe range
					(ch <= 0xfdd0 || ch >= 0xfdef) && // 0xfdd0 - 0xfdef
					(ch > 0x1F || ch == 0x9 || ch == 0xa || ch == 0xd)) {
				retval.append(ch);
			}
		}
		return retval.toString();
	}
	
}
