package com.song.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
* create by: song on 2017年9月28日
* 
* 类说明:
*/

/* 
 * 将时间戳转换为时间
 */
public class TimeStamp {
    
    public static Date stampToDate(String s) throws ParseException{
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        Long time=new Long(s);  
        String d = format.format(time);  
        Date date=format.parse(d);
        return date;
    }
}
