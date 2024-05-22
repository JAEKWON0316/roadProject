package com.pk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pk.dto.MenuDto;
import com.pk.dto.RestaurantDto;

@Repository
public class MenuDao implements MenuMapper {

	@Autowired
	private SqlSession session;
	
	@Override
	public int menuInsert(MenuDto dto) {
		// TODO Auto-generated method stub
		return session.insert("insert", dto);
	}

	@Override
	public int menuUpdate(MenuDto dto) {
		// TODO Auto-generated method stub
		return session.update("update", dto);
	}

	@Override
	public int menuDelete(int selectId) {
		// TODO Auto-generated method stub
		return session.delete("delete", selectId);
	}

	@Override
	public int selectMenuCount() {
		// TODO Auto-generated method stub
		return session.selectOne("selectMenuCount");
	}

	@Override
	public MenuDto selectDetail(int selectId) {
		return session.selectOne("selectDetail", selectId);
	}

	@Override
	public List<MenuDto> menuList(Map<String, Object> params) {
		return session.selectList("menuList", params);
	}
	
	@Override
	public void increaseHit(int selectId) {
		session.update("increaseHit", selectId);
	}

}
