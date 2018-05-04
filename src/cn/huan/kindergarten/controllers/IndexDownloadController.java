package cn.huan.kindergarten.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.exception.BaseException;
import com.huan.HTed.system.controllers.BaseController;

import cn.huan.kindergarten.dto.KgConfig;
import cn.huan.kindergarten.dto.KgDownload;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.exception.KgFileException;
import cn.huan.kindergarten.service.IKgConfigService;
import cn.huan.kindergarten.service.IKgDownloadService;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import cn.huan.kindergarten.service.IKgNewstypeService;

@Controller
public class IndexDownloadController extends BaseController{
	/**
     * 文件下载默认编码.
     */
    private static final String ENC = "UTF-8";
    /**
     * buffer 大小.
     */
    private static final Integer BUFFER_SIZE = 1024;
    
	@Autowired
	private IKgConfigService iKgConfigService;
	@Autowired
	private IKgNewstypeService iKgNewstypeService;
	@Autowired
	private IKgNewsSourceService iKgNewsSourceService;
	
	@Autowired
	private IKgDownloadService iKgDownloadService;
	@Autowired
	private IKgNewsAttributeService iKgNewsAttributeService;
	
	@RequestMapping(value = "/index/download")
    @ResponseBody
    public ModelAndView download( @RequestParam(defaultValue = DEFAULT_PAGE) int page,@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int limit,
    		HttpServletRequest request) {
		limit=20;
    	ModelAndView mv = new ModelAndView(getViewPath() + "/index/download/download");
    	 IRequest requestContext = createRequestContext(request);
    	 List<KgDownload> list =iKgDownloadService.select(requestContext, null, page, limit);
    	 int count = iKgDownloadService.adminQueryCount(requestContext, null);
    	 int allPageNum = count%limit==0?count/limit:count/limit+1;
	     if(count==0) allPageNum=1;
    	
    	 mv.addObject("downloadList",list);
    	 mv.addObject("page", page);
         mv.addObject("allPageNum",allPageNum);
         
         loadNavigation(mv, requestContext, IndexController.CH_INDEX);
         iKgNewsAttributeService.loadAttriteNews(mv, requestContext,3);
         return mv;
    }
	
	
    /**
     * 具体查看某个附件.
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param fileId   文件id
     * @throws FileReadIOException 文件读取IO异常
     */
    @RequestMapping(value = {"/index/file/download","/index/file/download"})
    public void detail(HttpServletRequest request, HttpServletResponse response, String fileId,String password) throws Exception {
        IRequest requestContext = createRequestContext(request);
        KgDownload kg = new KgDownload();
        kg.setId(fileId);
        KgDownload sysFile = iKgDownloadService.selectByPrimaryKey(requestContext, kg);
        
        if(sysFile.getPassword()!=null&&!("").equals(sysFile.getPassword())) {
        	if(password==null||!password.equals(sysFile.getPassword())) {
        		 throw new KgFileException(null, "下载文件密码不对", null);
            }
        }
        File file = new File(request.getServletContext().getRealPath("/") +sysFile.getFilePath());
        if (file.exists()) {
            response.addHeader("Content-Disposition", "attachment;filename=\"" + URLEncoder.encode(sysFile.getFileTitle(), ENC) + "\"");
//            response.setContentType(sysFile.getFileType() + ";charset=" + ENC);
            response.setHeader("Accept-Ranges", "bytes");
            int fileLength = (int) file.length();
            response.setContentLength(fileLength);
            if (fileLength > 0) {
                writeFileToResp(response, file);
            }
        } else {
            throw new KgFileException(null, "文件不存在", null);
        }
    }
	

    /**
     * 将文件对象的流写入Responsne对象.
     *
     * @param response HttpServletResponse
     * @param file     File
     * @throws FileNotFoundException 找不到文件异常
     * @throws IOException           IO异常
     */
    private void writeFileToResp(HttpServletResponse response, File file) throws Exception {
        byte[] buf = new byte[BUFFER_SIZE];
        try (InputStream inStream = new FileInputStream(file);
             ServletOutputStream outputStream = response.getOutputStream()) {
            int readLength;
            while (((readLength = inStream.read(buf)) != -1)) {
                outputStream.write(buf, 0, readLength);
            }
            outputStream.flush();

        }
    }
	
    private void loadNavigation(ModelAndView mv,IRequest requestContext,String chanel  ) {
  	  List<KgNewstype> kgNewstypeList = iKgNewstypeService.selectAll(requestContext);
        List<KgNewsSource> KgNewsSourceList = iKgNewsSourceService.selectAll(requestContext);
        
        mv.addObject("kgNewstypeList", kgNewstypeList);
        mv.addObject("KgNewsSourceList", KgNewsSourceList);
        mv.addObject("chanel", chanel);
        
        List<KgConfig> kgConfigList= iKgConfigService.selectAll(requestContext);
        for(KgConfig cf:kgConfigList) {
      	  if(("copyright").equals(cf.getSyskey())) {
      		  mv.addObject("copyright", cf.getSysvalue());continue;
      	  }
      	  if(("ICPlicense").equals(cf.getSyskey())) {
      		  mv.addObject("ICPlicense", cf.getSysvalue());continue;
      	  }
      	  if(("keyword").equals(cf.getSyskey())) {
      		  mv.addObject("keyword", cf.getSysvalue());continue;
      	  }
      	  if(("webdesc").equals(cf.getSyskey())) {
      		  mv.addObject("webdesc", cf.getSysvalue());continue;
      	  }
        }
  }
   
}