package cn.huan.kindergarten.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.huan.kindergarten.service.ILinkService;

@Controller
@RequestMapping("/demo")
public class LinkController {
	
	private Logger logger = LoggerFactory.getLogger(LinkController.class);
	@Autowired
	 private ILinkService iLinkService;
	
	
	 @RequestMapping("/insert")
	 @ResponseBody
	    public String insert() {
		 	logger.error("insert start");
		 	iLinkService.insert();
		 	System.out.println("1234");
		 	logger.error("insert end ");
	        return "welcome";
	    }
}
