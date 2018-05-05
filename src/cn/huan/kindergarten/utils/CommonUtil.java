package cn.huan.kindergarten.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.huan.kindergarten.dto.KgNews;

public class CommonUtil {
	   public static final String  SUSPENSION_POINTS = "...";
	   public static final String  TIME14="yyyyMMddHHmmss";
	   public static void judgeTitleLength(List<KgNews> news) {
	    	for(KgNews kg :news) {
	    		String title =kg.getNewstitle();
	    		if(title.length()>17) {
	    			title=kg.getNewstitle().substring(0, 17)+SUSPENSION_POINTS;
	    			kg.setNewsSimpleTitle(title);
	    		}else {
	    			kg.setNewsSimpleTitle(title);
	    		}
	    	}
	    }
	   
	   public static String loadNowTime14() {
		   Date day=new Date();
		   SimpleDateFormat df = new SimpleDateFormat(TIME14); 
		   return (df.format(day));   
	   }
}
