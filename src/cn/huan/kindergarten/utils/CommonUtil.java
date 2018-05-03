package cn.huan.kindergarten.utils;

import java.util.List;

import cn.huan.kindergarten.dto.KgNews;

public class CommonUtil {
	   public static final String  SUSPENSION_POINTS = "...";
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
}
