package cn.huan.kindergarten.linstener;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ServletContextAware;

import com.huan.HTed.system.controllers.sy.ImageController;

import cn.huan.kindergarten.bean.SysConfig;
import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.service.IKgConfigService;

public class InitDataListener implements InitializingBean, ServletContextAware {
	  /** 日志记录. **/
    private static Logger logger = LoggerFactory.getLogger(InitDataListener.class);
		@Autowired
		private IKgConfigService iKgConfigService;
		
		@Override
		public void setServletContext(ServletContext arg0) {
				List<KgConfig> list = iKgConfigService.selectAll();
				for(KgConfig kg :list) {
					switch(kg.getSyskey()) {
						case "webname":{
							SysConfig.webname=kg.getSysvalue();
							break;
						}
						case "uploadpath":{
							SysConfig.uploadpath=kg.getSysvalue();
							break;
						}
						case "copyright":{
							SysConfig.copyright=kg.getSysvalue();
							break;
						}
						case "keyword":{
							SysConfig.keyword=kg.getSysvalue();
							break;
						}
						case "webdesc":{
							SysConfig.webdesc=kg.getSysvalue();
							break;
						}
						case "webLogo":{
							SysConfig.webLogo=kg.getSysvalue();
							break;
						}
						case "webIco":{
							SysConfig.webIco=kg.getSysvalue();
							break;
						}
					}
				}
				logger.info("初始化加载完毕");
		}
		
		@Override
		public void afterPropertiesSet() throws Exception {
			// TODO Auto-generated method stub
			
		}
}
