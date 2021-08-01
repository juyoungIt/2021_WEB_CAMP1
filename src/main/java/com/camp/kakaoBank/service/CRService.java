package com.camp.kakaoBank.service;

import java.util.List;

import com.camp.kakaoBank.bean.CardRequestVO;

public interface CRService {
	public int insertCR(CardRequestVO vo);
	public int deleteCR(int req_id);
	public int updateCR(CardRequestVO vo);
	public CardRequestVO getCR(int req_id);
	public List<CardRequestVO> getCRList();
}