package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgNewstype;
import cn.huan.kindergarten.service.IKgNewstypeService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewstypeServiceImpl extends BaseServiceImpl<KgNewstype> implements IKgNewstypeService{

}