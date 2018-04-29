package cn.huan.kindergarten.service;

import com.huan.HTed.core.IRequest;
import com.huan.HTed.core.ProxySelf;
import com.huan.HTed.system.service.IBaseService;
import cn.huan.kindergarten.dto.KgCarousel;

public interface IKgCarouselService extends IBaseService<KgCarousel>, ProxySelf<IKgCarouselService>{

	public int adminQueryCount(IRequest request, KgCarousel record);

}