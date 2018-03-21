package cn.huan.kindergarten.service.impl;

import com.huan.HTed.system.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import cn.huan.kindergarten.dto.Demo;
import cn.huan.kindergarten.service.IDemoService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class DemoServiceImpl extends BaseServiceImpl<Demo> implements IDemoService{

}