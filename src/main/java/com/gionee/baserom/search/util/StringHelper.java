package com.gionee.baserom.search.util;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class StringHelper {
	private static Logger log = Logger.getLogger(StringHelper.class);
	
	
	/**
	 * 随机生成UUID
	 * @return
	 */
	public static synchronized String getUUID() {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		String uuidStr = str.replace("-", "");
		return uuidStr;
	}

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
	 * 日期类型转格式化字符串：yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String dateToString(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);  
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
	 * 字符串转日期
	 * 字符串格式为yyyy-MM-dd HH:mm:ss
	 */
	public static Date strToDate2(String str){
		SimpleDateFormat sdf1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf1.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	/**
	 * 获取 年-月-日 格式的字符串
	 */
	public static String getYMD(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String formatDate = sdf.format(date);
		return formatDate;
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
	
	/**
	 * 字符串列表去重复
	 * @param strlist
	 * @return
	 */
	public static List<String> filtrationDuplicate(List<String> list){
//		for (int i = 0; i < list.size() - 1; i++) {
//			for (int j = list.size() - 1; j > i; j--) {
//				if (list.get(j).equals(list.get(i))) {
//					list.remove(j);
//				}
//			}
//		}
		HashSet h = new HashSet(list);   
		list.clear();   
		list.addAll(h);   
		return list;   
	}

	
	public static void main(String[] args){
//		String str = StringHelper.md5("123456");
//		System.out.println("MD5密码："+str);
//		System.out.println("当前日期："+StringHelper.getCurrentDatetime());
//		
//		str = "Tue May 10 13:44:41 CST 2016";
//		Date date = StringHelper.strToDate(str);
//		System.out.println(date);
		
//		System.out.println(getYMD());
		System.out.println(getUUID());
	}
}
