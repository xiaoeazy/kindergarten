package cn.huan.kindergarten.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgNews;

public class CommonUtil {
	   public static final String  SUSPENSION_POINTS = "...";
	   public static final String  TIME14="yyyyMMddHHmmss";
	   public static void judgeNewsTitleLength(List<KgNews> news,int size) {
	    	for(KgNews kg :news) {
	    		String title =kg.getNewstitle();
	    		if(title.length()>size) {
	    			title=kg.getNewstitle().substring(0,size)+SUSPENSION_POINTS;
	    			kg.setNewsSimpleTitle(title);
	    		}else {
	    			kg.setNewsSimpleTitle(title);
	    		}
	    	}
	    }
	   public static void judgeAssessmentActivityTitleLength(List<KgAssessmentActivity> assessmentActivityList,int length) {
	    	for(KgAssessmentActivity kg :assessmentActivityList) {
	    		String title =kg.getAssessmentActivityName();
	    		if(title.length()>length) {
	    			title=kg.getAssessmentActivityName().substring(0, length)+SUSPENSION_POINTS;
	    			kg.setNewsSimpleAssessmentActivityName(title);
	    		}else {
	    			kg.setNewsSimpleAssessmentActivityName(title);
	    		}
	    	}
	    }
	   
	   public static String loadNowTime14() {
		   Date day=new Date();
		   SimpleDateFormat df = new SimpleDateFormat(TIME14); 
		   return (df.format(day));   
	   }
	   
	   public static String getIpAddress(HttpServletRequest request) {  
		            String ip = request.getHeader("x-forwarded-for");  
		            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		                ip = request.getHeader("Proxy-Client-IP");  
		            }  
		            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		                ip = request.getHeader("WL-Proxy-Client-IP");  
		            }  
		            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		                ip = request.getHeader("HTTP_CLIENT_IP");  
		            }  
		            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		                ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
		            }  
		            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		                ip = request.getRemoteAddr();  
		            }  
		            return ip;  
		        }  
}
