package com.gionee.baserom.search.util;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class StringHelper {
	private static Logger log = Logger.getLogger(StringHelper.class);

	/**
	 * md5转码
	 * @param str
	 * @return
	 */
	public static String md5(String str) {
		if (str == null) {
			return "";
		} else {
			MessageDigest md5 = null;
			try {
				md5 = MessageDigest.getInstance("MD5");
				md5.update(str.getBytes());
				str = new BigInteger(1, md5.digest()).toString(16);   
			} catch (NoSuchAlgorithmException ex) {
				log.error("创建MD5对象失败！----->StringHelper.java");
			}
			return str;
		}
	}
	
	/**
	 * 获取当前日期时间戳
	 * @return
	 */
	public static String getCurrentDatetime(){
		SimpleDateFormat myFormatter = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		return myFormatter.format(new Date());
	}
	
	/**
	 * 字符串转日期
	 */
	public static Date strToDate(String str){
		SimpleDateFormat sdf1 = new SimpleDateFormat ("EEE MMM dd HH:mm:ss Z yyyy", Locale.UK);
		Date date = null;
		try {
			date = sdf1.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 输出JSON结果到页面，提供给Ajax毁掉函数调用于提示信息
	 * @param str
	 * @param response
	 */
	public static void outputJsonString(String str,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");  
	    response.setContentType("application/json; charset=utf-8");  
	    PrintWriter out = null;  
	   try {
		   out = response.getWriter();  
	       out.append(str);
	       log.debug("输出JSON-->" + str);  
		} catch (Exception e) {
			e.printStackTrace();  
		}finally {  
	        if (out != null) {  
	            out.close();  
	        }  
		}
	}
	
	/**
	 * 判断字符串变量是否为空
	 * @param s
	 * @return
	 */
	public static boolean isEmpty(String s) {
		if (null == s || "".equals(s) || "".equals(s.trim()) || "null".equalsIgnoreCase(s)) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 处理页面传递中文参数乱码
	 * @param str
	 * @return
	 */
	public static String changeCode(String str){
		String t="";
		try {
			t =  new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static void main(String[] args){
		String str = StringHelper.md5("123456");
		System.out.println("MD5密码："+str);
		System.out.println("当前日期："+StringHelper.getCurrentDatetime());
		
		str = "Tue May 10 13:44:41 CST 2016";
		Date date = StringHelper.strToDate(str);
		System.out.println(date);
	}
}
