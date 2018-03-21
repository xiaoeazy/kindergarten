package cn.huan.kindergarten.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.huan.kindergarten.bean.KdLink;
import cn.huan.kindergarten.bean.mapper.KdLinkMapper;
import cn.huan.kindergarten.service.ILinkService;
@Service
@Transactional(rollbackFor = Exception.class)
public class LinkServiceImpl implements ILinkService{
	@Autowired
	private KdLinkMapper kdLinkMapper;
	@Override
	public void insert() {
		// TODO Auto-generated method stub
		KdLink kdLink = new KdLink();
		kdLink.setLinkName("111");
		kdLink.setLinkUrl("222");
		kdLinkMapper.insert(kdLink);
	}
	

}
