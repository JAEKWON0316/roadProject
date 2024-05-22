package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.RestaurantDto;

@Repository
public class RestarauntDao implements RestaurantMapper {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int restInsert(RestaurantDto dto) {
		
		return session.insert("restInsert", dto);
	}

	@Override
	public int restUpdate(RestaurantDto dto) {
		
		return session.update("update", dto);
	}

	@Override
	public int restDelete(int selectId) {
		
		return session.delete("delete", selectId);
	}

	@Override
	public int selectRestCount() {
		
		return session.selectOne("selectRestCount");
	}

	@Override
	public RestaurantDto selectDetail(int selectId) {
		return session.selectOne("selectDetail", selectId);
	}

	@Override
	public List<RestaurantDto> restList(Map<String, Object> params) {
		return session.selectList("restList", params);
	}
	
	@Override
	public void increaseHit(int selectId) {
		session.update("increaseHit", selectId);
	}
	

}
