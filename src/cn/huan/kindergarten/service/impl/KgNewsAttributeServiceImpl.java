package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.KgNewsAttribute;
import cn.huan.kindergarten.service.IKgNewsAttributeService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewsAttributeServiceImpl extends BaseServiceImpl<KgNewsAttribute> implements IKgNewsAttributeService{

}