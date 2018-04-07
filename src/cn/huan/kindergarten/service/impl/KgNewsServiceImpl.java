package cn.huan.kindergarten.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.huan.HTed.core.IRequest;
import com.huan.HTed.system.service.impl.BaseServiceImpl;

import cn.huan.kindergarten.dto.KgNews;
import cn.huan.kindergarten.mapper.KgNewsMapper;
import cn.huan.kindergarten.service.IKgNewsService;

@Service
@Transactional(rollbackFor = Exception.class)
public class KgNewsServiceImpl extends BaseServiceImpl<KgNews> implements IKgNewsService{
	@Autowired
	private KgNewsMapper kgNewsMapper;

	@Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<KgNews> selectWithOtherInfo(IRequest request,  KgNews condition ,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return kgNewsMapper.selectWithOtherInfo();
    }
}