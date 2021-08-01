package com.camp.kakaoBank.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.camp.kakaoBank.bean.CardRequestVO;

@Repository
public class CardRequestDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	// 1. insert
	public int insertCardRequest(CardRequestVO vo) {
		String sql = "INSERT INTO CardRequest (kor_first_name, kor_last_name, eng_first_name, eng_last_name, birth_date, phone, address) "
				+ "VALUES ("
				+ "'" + vo.getKor_first_name() + "', "
				+ "'" + vo.getKor_last_name() + "', "
				+ "'" + vo.getEng_first_name() + "', "
				+ "'" + vo.getEng_last_name() + "', "
				+ "'" + vo.getBirth_date() + "', "
				+ "'" + vo.getPhone() + "',"
				+ "'" + vo.getAddress() + "')";
		return jdbcTemplate.update(sql);
	}
	
	// 2. delete
	public int deleteCardRequest(int request_id) {
		String sql = "DELETE FROM CardRequest WHERE request_id = " + request_id;
		return jdbcTemplate.update(sql);
	}
	
	// 3. update
	public int updateCardRequest(CardRequestVO vo) {
		String sql = "UPDATE CardRequest set "
				+ "kor_first_name='" + vo.getKor_first_name() + "', "
				+ "kor_last_name='" + vo.getKor_last_name() + "', "
				+ "eng_first_name='" + vo.getEng_first_name() + "', "
				+ "eng_last_name='" + vo.getEng_last_name() + "', "
				+ "birth_date='" + vo.getBirth_date() + "', "
				+ "phone='" + vo.getPhone() + "',"
				+ "address='" + vo.getAddress() + "'"
				+ "WHERE request_id=" + vo.getReq_id();
		return jdbcTemplate.update(sql);
		
	}
	
	// 4. get
	public CardRequestVO getCardRequest(int request_id) {
		String sql = "SELECT * FROM CardRequest WHERE request_id=" + request_id;
		return jdbcTemplate.queryForObject(sql, new CRRowMapper());
	}
	
	// 5. get list
	public List<CardRequestVO> getCardRequestList() {
		String sql = "SELECT * FROM CardRequest ORDER BY requestAt DESC";
		return jdbcTemplate.query(sql, new CRRowMapper());
	}
}

class CRRowMapper implements RowMapper<CardRequestVO> {
	@Override
    public CardRequestVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CardRequestVO vo = new CardRequestVO();
        vo.setReq_id(rs.getInt("request_id"));
        vo.setKor_first_name(rs.getString("kor_first_name"));
        vo.setKor_last_name(rs.getString("kor_last_name"));
        vo.setEng_first_name(rs.getString("eng_first_name"));
        vo.setEng_last_name(rs.getString("eng_last_name"));
        vo.setBirth_date(rs.getString("birth_date"));
        vo.setPhone(rs.getString("phone"));
        vo.setAddress(rs.getString("address"));
        vo.setRequestAt(rs.getDate("requestAt"));
        return vo;
    }
}
