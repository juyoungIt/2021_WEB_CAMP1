package com.camp.kakaoBank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.kakaoBank.bean.CardRequestVO;
import com.camp.kakaoBank.dao.CardRequestDAO;

@Service
public class CRServiceImpl implements CRService {
	
	@Autowired
	CardRequestDAO crDAO;
	
	@Override
	public int insertCR(CardRequestVO vo) {
		return crDAO.insertCardRequest(vo);
	}
	@Override
	public int deleteCR(int req_id) {
		return crDAO.deleteCardRequest(req_id);
	}
	@Override
	public int updateCR(CardRequestVO vo) {
		return crDAO.updateCardRequest(vo);
	}
	@Override
	public CardRequestVO getCR(int req_id) {
		return crDAO.getCardRequest(req_id);
	}
	@Override
	public List<CardRequestVO> getCRList() {
		return crDAO.getCardRequestList();
	}
}
