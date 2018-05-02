package cn.huan.kindergarten.service;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;
import cn.huan.kindergarten.dto.KgDownload;

public interface IKgDownloadService extends IBaseService<KgDownload>, ProxySelf<IKgDownloadService>{

	public int adminQueryCount(IRequest request, KgDownload record);

}