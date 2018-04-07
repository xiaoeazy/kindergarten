package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgLink;
import cn.huan.kindergarten.service.IKgLinkService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgLinkServiceImpl extends BaseServiceImpl<KgLink> implements IKgLinkService{

}