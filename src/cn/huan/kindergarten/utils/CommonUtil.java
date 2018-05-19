package cn.huan.kindergarten.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
}
