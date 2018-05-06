package cn.huan.kindergarten.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.huan.kindergarten.dto.KgAssessmentActivity;
import cn.huan.kindergarten.dto.KgNews;

public class CommonUtil {
	   public static final String  SUSPENSION_POINTS = "...";
	   public static final String  TIME14="yyyyMMddHHmmss";
	   public static void judgeTitleLength(List<KgNews> news) {
	    	for(KgNews kg :news) {
	    		String title =kg.getNewstitle();
	    		if(title.length()>17) {
	    			title=kg.getNewstitle().substring(0)+SUSPENSION_POINTS;
	    			kg.setNewsSimpleTitle(title);
	    		}else {
	    			kg.setNewsSimpleTitle(title);
	    		}
	    	}
	    }
	   public static void judgeTitleLength(List<KgAssessmentActivity> assessmentActivityList,int length) {
	    	for(KgAssessmentActivity kg :assessmentActivityList) {
	    		String title =kg.getAssessmentActivityName();
	    		if(title.length()>17) {
	    			title=kg.getAssessmentActivityName().substring(0, 22)+SUSPENSION_POINTS;
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
}
