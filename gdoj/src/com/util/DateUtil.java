package com.util;

import com.opensymphony.xwork2.ActionSupport;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static Date StringToDate(String dateString,String formatString){
		try {
			DateFormat fm = new SimpleDateFormat(formatString);
			Date date = null;
			try {
				date = fm.parse(dateString);
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				return null;
			} // Thu Jan 18 00:00:00 CST 2007
			return date;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	public static String DateToString(Date date,String formatString){
		try {
			DateFormat fm = new SimpleDateFormat(formatString);
			String str = new String();
			str = fm.format(date);   
			return str;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	public static String penaltyString(int second) {
		
		int sec=second%60;
			second=second/60;
		int min=second%60;	
		int hour=second=second/60;
		
		String nowTime=new String();
		
		if(hour<10) {
			if(hour==0) nowTime="00";
			nowTime="0"+hour;
		}else {nowTime=Integer.toString(hour);}
	
		if(min<10) {
			nowTime=nowTime+":0"+min;
		}else {nowTime=nowTime+":"+min;}
		
		if(sec<10) {
			nowTime=nowTime+":0"+sec;
		}else {nowTime=nowTime+":"+sec;}
		
		return nowTime;
	}
	public static String secondToString(long second) {
		
		long sec=second%60;
			second=second/60;
		long min=second%60;	
		long hour=second=second/60;
		
		String nowTime=new String();
		
		if(hour<10) {
			if(hour==0) nowTime="00";
			nowTime="0"+hour;
		}else {nowTime=Long.toString(hour);}
	
		if(min<10) {
			nowTime=nowTime+":0"+min;
		}else {nowTime=nowTime+":"+min;}
		
		if(sec<10) {
			nowTime=nowTime+":0"+sec;
		}else {nowTime=nowTime+":"+sec;}
		
		return nowTime;
	}

	public static String toFriendlyDate(Date time){
		ActionSupport action = new ActionSupport();
		if(time == null) return action.getText("unknown");
		int ct = (int)((System.currentTimeMillis() - time.getTime())/1000);
		if (ct < 60)
			return ct + " " + action.getText("seconds_before");
		if(ct < 3600)
			return Math.max(ct / 60,1) + " " + action.getText("minutes_before");
		if(ct >= 3600 && ct < 86400)
			return ct / 3600 + " " + action.getText("hours_before");
		if(ct >= 86400 && ct < 2592000){ //86400 * 30
			int day = ct / 86400 ;
			if(day>1){
				return day + " " + action.getText("days_before");
			}
			return action.getText("yesterday");
		}
		if(ct >= 2592000 && ct < 31104000) //86400 * 30
			return ct / 2592000 + " " + action.getText("months_before");
		return ct / 31104000 + " " + action.getText("years_before");
	}
}
