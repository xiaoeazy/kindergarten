package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgNewsSource;
import cn.huan.kindergarten.service.IKgNewsSourceService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewsSourceServiceImpl extends BaseServiceImpl<KgNewsSource> implements IKgNewsSourceService{

}